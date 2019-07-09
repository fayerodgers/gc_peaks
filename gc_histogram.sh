infoseq  -noheading -only -length -pgc "$@" 2> /dev/null | perl -E '
my %bins;
my $sum;
while (<>) {chomp;
  my ($length, $gc) = split qr/\s+/;
  $sum += $length;
  $bins{sprintf("%.0f", $gc)} += $length;
}
for my $i (0..100){ 
  my $f = sprintf "%.3f", ($bins{$i}  / $sum );
  say $f < 0.005 ? 0 : $f 
} '
