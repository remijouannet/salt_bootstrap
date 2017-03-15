{% set id_host = grains['id'] %}
{% set ip_master = '192.168.2.182' %}
include:
  - repository.salt-repo  

salt-minion:
  pkg.installed:
    - name: salt-minion
    - refresh: True

salt-minion:
  pkg.installed:
    - name: python-zmq
    - refresh: True

/etc/salt/minion_id:
  file.managed:
     - contents: 
       - {{ id_host }}
     - require:
       - pkg: salt-minion

/etc/salt/minion:
  file.managed:
     - source: salt://salt-minion/files/minion
     - template: jinja
     - defaults:
         ip_master: {{ ip_master }}
     - require:
       - pkg: salt-minion

salt-minion_service:
  service.running:
    - name: salt-minion
    - enable: True
    - require:
      - pkg: salt-minion
      - file: /etc/salt/minion_id
    - watch:
      - file: /etc/salt/minion
      - file: /etc/salt/minion_id


