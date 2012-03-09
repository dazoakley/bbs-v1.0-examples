#! /usr/bin/perl

use strict;
use warnings;

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use DateTime;

# Set up our system parameters (Change these to suit your set-up)
my $htdocs = '/var/www';
my $tempdir = '/tempfiles'; # This is within the htdocs directory

# First we need to move to our temp directory, then create our R program
chdir($htdocs . $tempdir);
my $timestamp = DateTime->now();
open(RSCRIPT,">r-script-" . $timestamp . ".R");

# Print the contents of the file
print RSCRIPT '
    rangescale <- function(X) {
        Xmax <- apply(X, 2, max)
        Xscaled = scale(X, scale=Xmax, center=FALSE)
        return(Xscaled)
    }
';
print RSCRIPT 'X <- read.table("http://www.bixsolutions.net/profiles.csv", sep=",", header=TRUE)'."\n";
print RSCRIPT 'Xscaled = rangescale(X)'."\n";
print RSCRIPT 'd <- dist(t(Xscaled), method = "euclidean")'."\n";
print RSCRIPT 'bitmap(file = "r-image-' . $timestamp . '.png", type = "png256", width = 6, height = 6, res = 96)'."\n";
print RSCRIPT 'dendrogram <- hclust(t(d), method = "complete", members = NULL)'."\n";
print RSCRIPT 'plot(dendrogram)'."\n";
print RSCRIPT 'dev.off()'."\n";

# Close the file
close RSCRIPT;

# Now run the R script
system('R CMD BATCH ' . $htdocs . $tempdir . '/r-script-' . $timestamp . '.R');

# Finally create our HTML page using the image we generated
my $cgi = new CGI;
print
    $cgi->header,
    $cgi->start_html('Using R In Perl CGI'),
    $cgi->h1('Using R In Perl CGI'),
    $cgi->p('Here is the resulting image from calling R within Perl.'),
    $cgi->img({
              -src => $tempdir . '/r-image-' . $timestamp . '.png',
              -border => 0,
              -alt => 'Combining the power of R and Perl'
              }),
    $cgi->end_html;

