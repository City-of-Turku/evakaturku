#!/bin/bash

export SSHPASS=$SFTP_PASS

run_query() {
    SQL_FILE=$1
    OUTPUT_FILE=$2
    DATE_ARG=$3

    psql --csv -v date_val="'${DATE_ARG}'" -P csv_fieldsep=';' < $SQL_FILE > $OUTPUT_FILE
}

send_file() {
    FILE=$1

    echo "put $FILE" > sftp_batch.txt
    echo "bye" >> sftp_batch.txt

    sshpass -e sftp -o StrictHostKeyChecking=no -o BatchMode=no -b sftp_batch.txt $SFTP_USER@$SFTP_HOST:$SFTP_PATH
    aws s3 cp $FILE s3://$S3_BUCKET/$FILE
}

run_query_and_send_file() {
    SQL_FILE=$1
    OUTPUT_FILE=$2
    DATE_ARG=$3

    if [[ "${DATE_ARG}" != "" && "${DATE_ARG}" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        run_query $SQL_FILE $OUTPUT_FILE $DATE_ARG
        send_file $OUTPUT_FILE
    else
        echo "No date provided. Format has to be yyyy-mm-dd"
    fi
}

DATE=$(date --iso-8601)

run_query_and_send_file sql/DW-Daily_info.sql daily_info_3v_$DATE.csv $DATE
run_query_and_send_file sql/DW-Units_and_groups.sql units_and_groups_3v_$DATE.csv $DATE
run_query_and_send_file sql/DW-Daily_units_and_groups_attendance.sql daily_units_and_groups_attendance_3v_$DATE.csv $DATE
run_query_and_send_file sql/DW-Fee_decisions.sql fee_decisions_3v_$DATE.csv $DATE
run_query_and_send_file sql/DW-Voucher_value_decisions.sql voucher_value_decisions_3v_$DATE.csv $DATE
run_query_and_send_file sql/DW-Assistance_need_decisions.sql assistance_need_decisions_3v_$DATE.csv $DATE
run_query_and_send_file sql/DW-Child_aggregate.sql child_aggregate_3v_$DATE.csv $DATE
