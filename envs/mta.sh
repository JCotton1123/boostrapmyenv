#!/bin/bash

which yum >/dev/null
if [ $? -eq 0 ]; then
  yum install -y postfix
fi
which apt-get >/dev/null
if [ $? -eq 0 ]; then
  apt-get install -y postfix
fi

cd /etc/postfix

sed -i 's/#relayhost = \[an.ip.add.ress\]/relayhost = [email-smtp.us-west-2.amazonaws.com]:587/g' main.cf
echo >> main.cf
echo "smtp_sasl_auth_enable = yes" >> main.cf
echo "smtp_tls_security_level = encrypt" >> main.cf
echo "smtp_sasl_tls_security_options = noanonymous" >> main.cf
echo "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd" >> main.cf
echo >> main.cf

# echo "[email-smtp.us-west-2.amazonaws.com]  username:password" >> sasl_passwd
# postmap /etc/postfix/sasl_passwd

/etc/init.d/postfix restart
