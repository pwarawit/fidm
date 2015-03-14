#!/usr/bin/env bash
# load_simple_dim.sh

echo "Loading data file $1 as simple dimension...."
table_name=$(echo $1 | cut -f1 -d.)
echo "  Loading into table ${table_name}"
file -bi $1
echo "  Pre-processing - remove first | and last |"

# Need to convert encoding 
# iconv -f iso-8859-1 -t utf-8 oldfile.txt > newfile.txt 
# Donor - still need to either manually remove the third column or modify the donor table to have 3 columns

sed -i "s/^|//g" $1
sed -i "s/|$//g" $1
sed -i "s/\"//g" $1

psql -d fidm -c "\copy ${table_name}(code,name) FROM '$1' WITH CSV DELIMITER '|';"


