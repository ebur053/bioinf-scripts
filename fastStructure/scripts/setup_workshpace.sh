#!/bin/bash -e

## STEP 1
## 1.1 Make sure we are in home directory.
## 1.2 create a project directory (if it doesn't exist) and navigate into it

cd $HOME

if [ -d fastStructure_workshop ] 
then
   echo "You have already set up fastStructure_workshop directory."
else
   mkdir fastStructure_workshop
fi

cd fastStructure_workshop

## STEP 2 Get the data
## 2.1 Create a directory for the data 
## 2.2 Download the data from online source
if [ -d data ]
then
   echo "You already set up a directory for your data." 
else
   mkdir data
fi

cd data

curl https://github.com/apawlik/bioinf-scripts/raw/master/fastStructure/data/MacroPopGenBase.zip -o MacroPopGenBase.zip
curl https://github.com/apawlik/bioinf-scripts/raw/master/fastStructure/data/prubi_gbs.vcf.gz - o prubi_gbs.vcf.gz

unzip MacroPopGenBase.zip
rm MacroPopGenBase.zip

gunzip prubi_gbs.vcf.gz
rm prubi_gbs.vcf.gz

cd ..

## STEP 3 get the scripts 

if [ -d scripts ] 
then
   echo 'Scripts directory already exists.'
else
   mkdir scripts
fi  

cd scripts

