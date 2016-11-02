{% if grains['os'] == 'RedHat' or grains['os'] == 'Centos' %}
salt-repo:
  pkgrepo.managed:
    - humanname: salt-repo
    - baseurl: https://repo.saltstack.com/yum/rhel{{ grains['osrelease_info'][0] }}/
    - gpgcheck: 1
    - gpgkey: https://repo.saltstack.com/yum/rhel{{ grains['osrelease_info'][0] }}/SALTSTACK-GPG-KEY.pub
{% endif %}
