#!/bin/sh

KDC_CONFIG_DIR=/var/kerberos/krb5kdc

KDC_DATABASE=/var/kerberos/krb5kdc

KRB5_REALM=SWAD.COM

# create a kdc principal if one doesn't exist
if [ ! -f "${KDC_DATABASE}/principal" ]; then

   if [ -z ${KRB5_PASS} ]; then

      KRB5_PASS=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;)
      echo "*** Your KDC password is ${KRB5_PASS}"
   fi

   ACL_FILE="${KDC_CONFIG_DIR}/kadm5.acl"

   echo "*/admin@${KRB5_REALM} *" > ${ACL_FILE}

cat <<EOF > /tmp/krb5_pass
${KRB5_PASS}
${KRB5_PASS}
EOF

   /usr/sbin/kdb5_util create -r ${KRB5_REALM} < /tmp/krb5_pass
   rm /tmp/krb5_pass
   /usr/sbin/kadmin.local -r ${KRB5_REALM} -q "addprinc -pw ${KRB5_PASS} admin/admin@${KRB5_REALM}"
fi