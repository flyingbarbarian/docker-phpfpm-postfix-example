#!/bin/bash

# postfixの起動
postfix start

# Postfixは/var/spool/postfixにchrootするので、
# 名前解決に際して、/etc/resolv.confではなく/var/spool/postfix/etc/resolv.confを見に行く。
# 従って、/etc/resolv.confをコピーする。
cp /etc/resolv.conf /var/spool/postfix/etc/resolv.conf

# SASL認証用のテーブル作成
chown root:root /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd

# postfixの設定変更を反映させる
postfix reload

# コンテナの起動を維持するため
tail -f /dev/null