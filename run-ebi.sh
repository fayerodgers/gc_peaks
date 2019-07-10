#!/usr/bin/bash
set -euo pipefail
root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p $root_dir/scaffold_counts

for f in $PARASITE_SCRATCH/jbrowse/WBPS13/JBrowseTools/*/*.genomic.fa ; do
  species=$(basename $f | sed s/.genomic.fa//)
  histogram_path=$root_dir/scaffold_counts/$species.tsv
  [ -f "$histogram_path" ] || echo "$root_dir/gc_histogram.sh $f > $histogram_path"
done | parallel --will-cite --halt soon,fail=1 --jobs 30 

ls $root_dir/scaffold_counts/* | sort | while read -r h; do
  species=$(basename "$h" | sed s/.tsv$//)
  echo -n $species$'\t'
  python $root_dir/peaks.py < "$h"
done | tee $root_dir/gc_peaks.txt
