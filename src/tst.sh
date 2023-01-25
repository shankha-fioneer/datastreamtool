# curdatetime=`date +"%Y-%m-%dT%H:%M:%S.000"`
# echo $curdatetime
# cnt=0
# amount=600000
# incamount=100

# while IFS='' read -r LINE || [ -n "${LINE}" ]; do
# (( cnt=${cnt}+1 ))
# echo ${LINE}| sed "s/UniqueId=\"/UniqueId=\"$cnt/g" | sed "s/OriginalId=\"/OriginalId=\"$cnt/g" | sed "s/CurrentId=\"/CurrentId=\"$cnt/g" |sed "s/OriginalAmount=\"OA/OriginalAmount=\"$amount/g"|sed "s/ValueDateTime=\"DT/ValueDateTime=\"$curdatetime/g"|sed "s/CaptureDateTime=\"DT/CaptureDateTime=\"$curdatetime/g"|sed "s/ActualScheduleTime=\"DT/ActualScheduleTime=\"$curdatetime/g"|sed "s/CashDate=\"DT/CashDate=\"$curdatetime/g"|sed "s/EventDateTime=\"DT/EventDateTime=\"$curdatetime/g"|sed "s/OriginalScheduleTime=\"DT/OriginalScheduleTime=\"$curdatetime/g"|sed "s/DealDate=\"DT/DealDate=\"$curdatetime/g" > tmpchec.xml
# done < manyTomanyDT.xml

. $ALERI_BASE/.profile_lms.sh
~/lms_6.2.6-snapshot/lms_services/lms/bin/sendtomq -s off -x "vlcsp08739.wdf.sap.corp(32440)" -c S_LMS -m QM_TST324DE -q QUEUE_XML_EVENTS < tmp.xml