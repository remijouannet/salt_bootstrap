# salt_bootstrap

* one line to generate roster from salt-master : 
```
salt-run manage.present show_ipv4=True | while read -r minion; read -r minion_ip; do echo $minion >> roster; echo '  host: '$minion_ip >> roster; echo '  user: root' >> roster; echo '  tty: True' >> roster; done
```

* Saltfile with the path to your private key
```
salt-ssh:
  config_dir: ./config
  max_procs: 30
  wipe_ssh: True
  ssh_priv: /Users/remi/.ssh/id_rsa
  ignore_host_keys: True
  roster_file: ./roster
```

* edit the roster file with hosts IP
```
salt-master:
  host: 171.33.77.154
  user: root
  tty: True
```

* edit the file srv/salt/salt-minion/init.sls with the salt-master ip
```
...
{% set ip_master = '192.168.2.182' %}
...
```


