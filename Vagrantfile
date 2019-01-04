Vagrant.configure(2) do |config|
    # boxファイルもbentoから拝借
    config.vm.box = "bento/centos-7.2"

    # 共有フォルダの追加
    config.vm.synced_folder "~/Virtual", "/Virtual"

    # via: http://qiita.com/hidekuro/items/a94025956a6fa5d5494f
    # ポート番号は10080 -> 80
    config.vm.network "forwarded_port", guest: 80, host: 10080
    config.vm.network "forwarded_port", guest: 22, host: 2200

    # up, reload 時に PF 設定
    config.trigger.after [:provision, :up, :reload] do |trigger|
        trigger.run = {path: "triggers/up.sh"}
    end

    # halt, destroy 時に PF をリセット
    config.trigger.after [:halt, :destroy] do |trigger|
        trigger.run = {path: "triggers/halt.sh"}
    end

    # via: http://blog.shibayu36.org/entry/2013/08/12/090545
    # IPv6とDNSでのネットワーク遅延対策で追記
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--ioapic", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    # ansible を実行
    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provisioning/site.yml"
        ansible.inventory_path = "provisioning/vagrants"
        ansible.limit = 'all'
        ansible.compatibility_mode = '2.0'
    end
end