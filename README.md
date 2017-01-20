# salt_bootstrap

* one line to generate roster from salt-master : 
```
salt-run manage.present show_ipv4=True | while read -r minion; read -r minion_ip; do echo $minion >> roster; echo '  host: '$minion_ip >> roster; echo '  user: root' >> roster; echo '  tty: True' >> roster; done
```
