#!/bin/bash

#print your name
echo 'Hello Banji!'
Banji=1
echo $Banji

#create a folder title with your name
mkdir Banji

#Create another new directory titled biocomputing and change to that directory with one line of command
mkdir biocomputing && cd biocomputing

#Download these 3 files:
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
cat wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
cat wildtype.gbk

#Move the .fna file to the folder titled your name
mv wildtype.fna  Banji

#Delete the duplicate gbk file
rm wildtype.gbk

#The .fna file is actually from a bacteria, and it should definitely have a TATA (tata) box for initiating gene transcription. A molecular biologist is trying to understand the implication of dual TATA sequences. The files got mixed up and we are not sure which is wildtype and which is mutant. The mutant should have “tatatata” while the normal should have just “tata”. Can you confirm if the file is mutant or wild type

#Confirm if the .fna file is mutant or wild type (tatatata vs tata)
cd ../
mutant grep -i 'tatatata' wildtype.fna

#If mutant, print all matching lines into a new file
if [[ $mutant_grep == "" ]];then
       echo 'this strain is a wildtype strain with no mutation in the tata box!'
else
       echo 'this strain is a mutant with a mutation in the tata box'
       echo $mutant_grep| tr ' ' '\n' .Banji/mutant_lines_1.txt
fi

#Count number of lines (excluding header) in the .gbk file
lines with header=$(wc -l biocomputing/wildtype.gbk | awk '{print $1}')
Lines=$((lines_with_header - 1))
echo 'There are' $Lines 'lines in the gbk file'

#Print the sequence length of the .gbk file. (Use the LOCUS tag in the first line)
seq_len=$(grep 'LOCUS' biocomputing/wildtype.gbk | awk '{print $3}')

#Print the source organism of the .gbk file. (Use the SOURCE tag in the first line)
source_org=$(grep 'SOURCE' biocomputing/wildtype.gbk | awk '{print $2, $3}')

#List all the gene names of the .gbk file. Hint {grep '/gene='}
gene_list=$(grep '/gene=' biocomputing/wildtype.gbk | sed 's/\/gene\=/ /')

echo 'our genome is' $seq_len 'bp long'
echo 'our genome is for' $source_org
echo 'all gene in this genomeinclude:' $'\n' $gene_list


#Clear your terminal space and print all commands used today
clear

history > history_wildtype.txt

List the files in the two folders
ls Banji/ biocomputing/


#Project 2: Installing Bioinformatics Software on the Terminal


#Activate your base conda environment
conda activate

#Create a conda environment named funtools
conda create --name 'funtools'

#Activate the funtools environment
conda activate funtools

#Install Figlet using conda or apt-get
sudo apt-get install figlet

#Run figlet <your name>
figlet Banji

#Install bwa through the bioconda channel
conda install bwa
 
#Install blast through the bioconda channel
conda install blast

#Install samtools through the bioconda channel
conda install samtools

#Install bedtools through the bioconda channel
conda install bedtools

#Install spades.py through the bioconda channel
conda install spades.py

#Install bcftools through the bioconda channel
conda install bcftools

#Install fastp through the bioconda channel
conda install fastp

#Install multiqc through the bioconda channel
conda install multiqc
