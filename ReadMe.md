# ShowB

電力メータ情報発信サービスを眺める

## 下準備

nginx、fcgiwrap、及び gnuplot-nox をインストールしておきます。

```console
# apt update
# apt upgrade
# apt install nginx
# apt install fcgiwrap
# apt install gnuplot-nox
```

nginx の設定を構成し、.sh を fcgiwrap に廻すようにしておきます。

```nginx
        location ~ \.sh$ {
                include         fastcgi_params;
                fastcgi_pass    unix:/run/fcgiwrap.socket;
                fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        }
```

fcgiwrap を有効化します。

```console
# systemctl enable --now fcgiwrap
```

nginx の設定を読み込み直します。

```console
# systemctl reload nginx
```
