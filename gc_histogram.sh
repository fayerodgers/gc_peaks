infoseq  -noheading -only -length -pgc "$@" 2> /dev/null | perl -E '
my %bins;
my $sum;
while (<>) {chomp;
  my ($length, $gc) = split qr/\s+/;
  $length = 1;
  $sum += $length;
  $bins{sprintf("%.0f", $gc)} += $length;
}
for my $i (0..99){ 
  say sprintf "%.5f", ($bins{$i}  / $sum );
} '
