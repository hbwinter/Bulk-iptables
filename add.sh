#!/bin/bash
echo "Dosya Adı Giriniz.ex:list.txt"
read dosya

for yay in $(cat $dosya)
do
    /sbin/iptables -L -n -v | grep -q "${yay}"
    RETVAL=$?
    if [ $RETVAL -ne 0 ]; then
     /sbin/iptables -A INPUT -s "${yay}" -j DROP
    fi
done
echo "Başarılı"
