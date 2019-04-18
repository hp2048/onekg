
#Download CRAM and .crai files.

for i in `cut -f1 1000genomes.high_coverage.GRCh38DH.alignment.index | cut -f3- -d '/'`;
do
  lftp -e "pget -n24 ~/$i;quit" ftp.1000genomes.ebi.ac.uk;
done

for i in `cut -f3 1000genomes.high_coverage.GRCh38DH.alignment.index | cut -f3- -d '/'`;
do
  lftp -e "pget -n24 ~/$i;quit" ftp.1000genomes.ebi.ac.uk;
done
