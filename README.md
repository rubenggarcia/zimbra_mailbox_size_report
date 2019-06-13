# zimbra_mailbox_size_report
Get mail report of size from all domain mailboxes

# Usage
Setup a cronjob (crontab -e as zimbra user) to run this at 4:01 every monday morning, and email it to them.
1 4 * * 1 /opt/zimbra/backup/size.sh yourdomain.com

Based on: https://wiki.zimbra.com/wiki/Mailbox_usage_report
