FROM php:8.1-fpm

# postfixをインストールする為に、パッケージを更新
RUN apt update && apt upgrade -y

# postfixをインストール
RUN DEBIAN_FRONTEND=noninteractive apt install postfix -y

# SMTPリレーにはSMTP AUTHが必要。
# SMTP AUTHの為のSASLにはCyrus SaslとCyrus IMAPを使う。
RUN apt install sasl2-bin -y
RUN DEBIAN_FRONTEND=noninteractive apt install cyrus-imapd -y

# コンテナ起動時のスクリプト
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]