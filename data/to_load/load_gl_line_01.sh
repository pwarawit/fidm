#!/usr/bin/env bash
# load_gl_line_01.sh

echo "Loading gl_line_01.txt file into tmp_gl_line table..."
filename = 'gl_line_01.txt'

file -bi gl_line_01.txt
echo "  cutting the head and tail of the file "
sed -n "9,147 p" gl_line_01.txt > tmpfile.txt
echo "  Pre-processing - remove first |, last |, and double-quote" 

sed -i "s/^|//g" tmpfile.txt
sed -i "s/|$//g" tmpfile.txt
sed -i "s/\"//g" tmpfile.txt

psql -d fidm  -c "\copy tmp_gl_line( symbol,assignment,document_number, business_area,document_type,posting_key,amount_in_local_currency,local_currency,tax_code,clearning_document,profit_center,segment,text,document_header_text,entry_date,parked_by,user_name,activity_code,benefit_county,cf_leadership,donor,donor_line,gender_rights,monitor_evaluate,outcome,staff,theme) FROM 'tmpfile.txt' WITH CSV DELIMITER '|';"


