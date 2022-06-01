#!/bin/bash

HOST="localhost:443"
echo $HOST
LF=$'\n'

# 暗号スイートを列挙し配列の中に入れる
OLD_IFS=$IFS
IFS=:
CIPHER_ARR=(`openssl ciphers`)
IFS=$OLD_IFS

# openssl s_clientコマンドで各暗号スイートの確認
for (( i=0; i < ${#CIPHER_ARR[@]}; i++ ))
do
    echo "<<< "${CIPHER_ARR[i]}" >>>"$LF
    openssl s_client -connect ${HOST} -cipher ${CIPHER_ARR[i]} < /dev/null
    echo $LF
done