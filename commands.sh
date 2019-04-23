
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

#RESULTS
HG00268, 1678244
HG00419, 1692225
HG00759, 1657402
HG01595, 1777475
HG02568, 1176896
HG02922, 2058184
HG03052, 1836908
HG03642, 1561186
NA18525, 1872109
NA18939, 1690272
NA19017, 1796170
NA19625, 1760107
NA19648, 1710430
NA20502, 1520089
#Discordant read pairs in female samples
for i in *.cram;
do 
  echo `basename $i | cut -f1 -d '.'`, `samtools view -F 1294 --reference GRCh38_full_analysis_set_plus_decoy_hla.fa $i chrY | wc -l`;
done
#Results
HG00268, 571746
HG00419, 554684
HG00759, 538112
HG01595, 564943
HG02568, 398107
HG02922, 703997
HG03052, 622788
HG03642, 488164
NA18525, 668863
NA18939, 538635
NA19017, 615442
NA19625, 605821
NA19648, 612778
NA20502, 520145

