# docker-phpfpm-postfix-example
PHP-FPMのDocker containerでPostfixを動かしたい人の為の、Dockerfileの実装例です。
mb_send_mailなどを利用することが出来ます。

動かすための**最低限のコード**しか書いていません。
必要に応じてコードを足して使って下さい。

また、SMTPリレーでメールを送信することを念頭に作っています。
Mailtrapなどで実験してみて下さい。
勿論、お好みで設定を変えて使って下さい。

# 使い方
1. ダウンロードして下さい。
2. `configs/main.cf.example`を`configs/main.cf`にファイル名変更して、SMTPリレーホストの情報を書いて下さい。
3. `configs/sasl_passwd.example`を`configs/sasl_passwd`にファイル名変更して、SMTPリレーホストの認証情報などを書いて下さい。
4. `docker-compose build --no-cache`でイメージをビルドして下さい。
5. `docker-compose up -d`でコンテナが起動します。
6. `docker exec -it docker-phpfpm-postfix-example-container /bin/bash`でコンテナにログインできます。

これでコンテナ内のPostfixからメールの送信ができます。
以下にコマンドラインからmb_send_mailを用いる送信テスト例を書きます。

例
```
php -r "mb_send_mail('your-email@example.com', 'test subejct', 'test body', 'From: your-email@example.com');"
```
