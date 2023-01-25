. $ALERI_BASE/.profile_lms.sh
cnt=0
amount=6000000
incamount=0
idbase=`uuidgen`
for i in {1..20000..1}
do
((amount = ${amount}+${incamount}))
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
(( cnt=${cnt}+1 ))
echo ${LINE}| sed "s/UniqueId=\"/UniqueId=\"$cnt$idbase/g" | sed "s/OriginalId=\"/OriginalId=\"$cnt/g" | sed "s/CurrentId=\"/CurrentId=\"$cnt/g" |sed "s/OriginalAmount=\"OA/OriginalAmount=\"$amount/g" >> tmp.xml
done < manyTomanyTemplate.xml
# send
$LMS_HOME/bin/sendtomq -s off -x "vlcsp08739.wdf.sap.corp(33140)" -c S_LMS -m QM_TST331DE -q QUEUE_XML_EVENTS < tmp.xml
rm -f tmp.xml
done
echo "done"
