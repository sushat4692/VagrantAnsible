# Vagrant + Ansible

自分用ローカル環境の設定ファイル

## 構築される環境

* LAMP（CentOS7 + Apache2 + MariaDB + PHP5.6）
* epel, remiのyumリポジトリを追加（RPMForgeは利用していなかったので削除）
* ApacheのVirtualDocumentRootを設定して、サブドメイン運用を楽にする（ドキュメントルートを分けたい）

## URL

```
ローカル環境              Vagrant環境                  URL
~/Virtual/foo/htdocs  ->  /Virtual/www/foo/htdocs  ->  http://foo.localhost/
~/Virtual/bar/htdocs  ->  /Virtual/www/bar/htdocs  ->  http://bar.localhost/
```
