
#!/bin/bash
output="/tmp/accountusage"
domain=$1
SendTo="your@email"
rm -f $output
touch $output
server=`zmhostname`
/opt/zimbra/bin/zmprov gqu $server|grep $domain|awk {'print $1" "$3" "$2'}|sort|while read line
do
usage=`echo $line|cut -f2 -d " "`
quota=`echo $line|cut -f3 -d " "`
user=`echo $line|cut -f1 -d " "`
status=`/opt/zimbra/bin/zmprov ga $user | grep  ^zimbraAccountStatus | cut -f2 -d " "`
if [ "$usage" -gt 0 ]; then
echo "$user `expr $usage / 1024 / 1024`Mb ($status account)" >> $output
fi
done
(echo "Subject: Mailbox Usages for $domain";cat $output) | /opt/zimbra/common/sbin/sendmail @SendTo
