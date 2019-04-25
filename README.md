# onekg
This repository is designed to explore characteristics of 1000 Genome Data that is publicly available for use and analyses.

## High-coverage PCR-free library
Index of CRAM files for high-coverage PCR-free library used for analysis on GRCh38 reference was downloaded from ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections/1000_genomes_project/1000genomes.high_coverage.GRCh38DH.alignment.index.

## Discordant mappings

Table 1: Summary statistics of discordant mappings for 14 female samples of 1000 Genome (GRCh38) mapped.  


|Sample ID|# of discordants|# of discordants with mq20|# of reads mapped to the Y chromosome|Total # of reads|% of discordants|% of mq20 discordants|% of reads mapped to the Y chromosome|
|:---|---:|---:|---:|---:|---:|---:|---:|
|HG00268|21452730|9865992|1678244|788945768|2.72|45.99|0.21|
|HG00419|29959632|14656472|1692225|730182210|4.10|48.92|0.23|
|HG00759|24254366|9128952|1657402|793047110|3.06|37.64|0.21|
|HG01595|23405082|9045800|1777475|809779196|2.89|38.65|0.22|
|HG02568|33380642|17668340|1176896|416558544|8.01|52.93|0.28|
|HG02922|27371273|12264399|2058184|788768948|3.47|44.81|0.26|
|HG03052|29423416|13242420|1836908|724732312|4.06|45.01|0.25|
|HG03642|34143287|16482361|1561186|652081788|5.24|48.27|0.24|
|NA18525|24930157|8310473|1872109|773884178|3.22|33.34|0.24|
|NA18939|25968248|9814554|1690272|806242620|3.22|37.79|0.21|
|NA19017|26003479|11295761|1796170|787777536|3.30|43.44|0.23|
|NA19625|20655000|9079166|1760107|671389540|3.08|43.96|0.26|
|NA19648|37410954|20419118|1710430|602492930|6.21|54.58|0.28|
|NA20502|34411264|18535718|1520089|637337378|5.40|53.87|0.24|
|Average|28054966|12843538|1699121|713087147|4.14|44.94|0.24|  
|||||||||  

1. Number of discordants:  
```samtools view -F 1294 $cram | wc -l```  
2. Number of discordants with mapping quality of at least 20:  
```samtools view -q 20 -F 1294 $cram | wc -l```  
3. Number of reads mapping to the Y chromosome:  
```samtools view $cram chrY | wc -l```  
4. Total number of reads:  
```
samtools flagstat $cram
## paired in sequencing number
```
5. % of discordants reads relative to the total number of reads
6. % of mq20 discordants is relative to the number of discordants
7. % of reads mapped to the Y chromosome is relative to the total number of reads.
