. $ALERI_BASE/.profile_lms.sh
cnt=0
amount=600000
incamount=100
for i in {1..2000..1}
do
((amount = ${amount}+${incamount}))
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
(( cnt=${cnt}+1 ))
echo ${LINE}| sed "s/UniqueId=\"/UniqueId=\"$cnt/g" | sed "s/ Id=\"/ Id=\"$cnt/g" | sed "s/CurrentId=\"/CurrentId=\"$cnt/g" |sed "s/OriginalAmount=\"OA/OriginalAmount=\"$amount/g" >> tmp.xml
done < dbmstxtemplate.xml
# send
$LMS_HOME/bin/sendtomq -s off -x "vlcsp08739.wdf.sap.corp(31640)" -c S_LMS -m QM_TST316DE -q QUEUE_LMS_DBMSLOAD_PPTXN < tmp.xml
rm -f tmp.xml
done
echo "done"
