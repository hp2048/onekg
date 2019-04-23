
#Download CRAM and .crai files.

for i in `cut -f1 1000genomes.high_coverage.GRCh38DH.alignment.index | cut -f3- -d '/'`;
do
  lftp -e "pget -n24 ~/$i;quit" ftp.1000genomes.ebi.ac.uk;
done

for i in `cut -f3 1000genomes.high_coverage.GRCh38DH.alignment.index | cut -f3- -d '/'`;
do
  lftp -e "pget -n24 ~/$i;quit" ftp.1000genomes.ebi.ac.uk;
done

#Download reference genome file
wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/GRCh38_reference_genome/GRCh38_full_analysis_set_plus_decoy_hla.fa

#For female samples, calculate reads that map to the Y chromosome
for i in *.cram; 
do 
  echo `basename $i | cut -f1 -d '.'`, `samtools view --reference GRCh38_full_analysis_set_plus_decoy_hla.fa $i chrY | wc -l`;
done
