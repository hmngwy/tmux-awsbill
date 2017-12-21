CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bill() {
  aws --region us-east-1 cloudwatch get-metric-statistics \
      --namespace "AWS/Billing" \
      --metric-name "EstimatedCharges" \
      --dimension "Name=Currency,Value=USD" \
      --start-time $(gdate +"%Y-%m-%dT%H:%M:00" --date="-24 hours") \
      --end-time $(gdate +"%Y-%m-%dT%H:%M:00") \
      --statistic Maximum \
      --period 60 \
      --output text | sort -r -k 3 | head -n 1 | cut -f 2
}
main() {
  FILE=/tmp/bill_cache
  #if [ ! -f $FILE ] || test "`find $FILE -mmin +10`"; then
    bill > $FILE
  #fi
  cat $FILE
}
main
