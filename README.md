# Vagrant + Ansible

自分用ローカル環境の設定ファイル

## 構築される環境

* LAMP（CentOS7 + Apache2 + MariaDB + PHP5.6）
* RPMForge, epel, remiのyumリポジトリを追加（念のため）
* ApacheのVirtualDocumentRootを設定して、サブドメイン運用を楽にする（ドキュメントルートを分けたい）

## URL

```
ローカル環境                 Vagrant環境                  URL
/path/to/www/foo/htdocs  ->  /vagrant/www/foo/htdocs  ->  http://foo.localhost/
/path/to/www/bar/htdocs  ->  /vagrant/www/bar/htdocs  ->  http://bar.localhost/
```