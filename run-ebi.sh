root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p $root_dir/results
for f in $PARASITE_SCRATCH/jbrowse/WBPS13/JBrowseTools/*/*.genomic.fa ; do
  species=$(basename $f | sed s/.genomic.fa//)
  histogram_path=$root_dir/results/$species.tsv
  echo -n $species $'\t'
  $root_dir/gc_histogram.sh $f \
   | tee $histogram_path \
   | python $root_dir/peaks.py
done | tee $root_dir/results/gc_peaks.txt
