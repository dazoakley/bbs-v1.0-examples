#! /usr/bin/perl

use strict;
use warnings;

use CGI qw( :standard );
use CGI::Carp qw( fatalsToBrowser );
use CGI::Pretty;  # This is used to make out HTML code look
                  # nicer...
use DBI;
use DBD::MySQL;

# First we connect to the database
my $dbh = DBI->connect(
	'DBI:mysql:homo_sapiens_core_47_36i:ensembldb.sanger.ac.uk',
	'anonymous'
) or die "Cannot connect to database $!\n";

# Prepare our query
# NOTE: q() is the same as surrounding our text in single quotes.
my $query = q(
	SELECT es.synonym, sr.name, g.seq_region_start, g.seq_region_end 
	FROM seq_region sr, gene g, external_synonym es
	WHERE es.xref_id = g.display_xref_id 
	AND sr.seq_region_id = g.seq_region_id 
	AND es.synonym IS NOT NULL
	ORDER BY g.seq_region_start ASC
	LIMIT 500
);
my $sth = $dbh->prepare($query);

# Before we run our query and handle the results,
# start the creation of our web page
my $cgi = new CGI;
print
	$cgi->header,
	$cgi->start_html('Example Database Query'),
	$cgi->h1('Example Database Query'),
	$cgi->p(
		'The table below was created by running this query on the ', 
		'\'homo_sapiens_core\' database at ',
		a({href=>"http://www.ensembl.org"},'Ensembl'),
		':'
	),
	$cgi->pre($query),
	$cgi->p('Here are the results:');

# Now to run the query and handle our results
$sth->execute();
my @query_results;
while ( my $results = $sth->fetchrow_arrayref() ) {
	push( @query_results, $cgi->Tr($cgi->td($results)) );
}

# Now print the results
print $cgi->table(
	{ -border => '1', cellpadding => '3', cellspacing => '3' },
	$cgi->Tr([
		$cgi->th([
			'External Synonym',
			'Seq Region Name',
			'Seq Region Start',
			'Seq Region End'
		])
	]),
	@query_results
);

# Clean up
$sth->finish;
$dbh->disconnect;
print $cgi->end_html;
exit;

