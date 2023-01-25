. $ALERI_BASE/.profile_lms.sh
cnt=0
amount=600010
incamount=100
idbase=`uuidgen`
while true 
do
((amount = ${amount}+${incamount}))
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
(( cnt=${cnt}+1 ))
curdatetime=`date -d "-7 day" +"%Y-%m-%dT%H:%M:%S.000"`
echo ${LINE}| sed "s/UniqueId=\"/UniqueId=\"$cnt$idbase/g" | sed "s/OriginalId=\"/OriginalId=\"$cnt$idbase/g" | sed "s/CurrentId=\"/CurrentId=\"$cnt$idbase/g" |sed "s/OriginalAmount=\"OA/OriginalAmount=\"$amount/g"|sed "s/ValueDateTime=\"DT/ValueDateTime=\"$curdatetime/g"|sed "s/CaptureDateTime=\"DT/CaptureDateTime=\"$curdatetime/g"|sed "s/ActualScheduleTime=\"DT/ActualScheduleTime=\"$curdatetime/g"|sed "s/CashDate=\"DT/CashDate=\"$curdatetime/g"|sed "s/EventDateTime=\"DT/EventDateTime=\"$curdatetime/g"|sed "s/OriginalScheduleTime=\"DT/OriginalScheduleTime=\"$curdatetime/g"|sed "s/DealDate=\"DT/DealDate=\"$curdatetime/g" >> tmp.xml
done < manyTomanyDT_3_3.xml
# send
$LMS_HOME/bin/sendtomq -s off -x "vlcsp08739(32440)" -c S_LMS -m QM_TST324DE -q QUEUE_XML_EVENTS < tmp.xml
rm -f tmp.xml
done
echo "done"

