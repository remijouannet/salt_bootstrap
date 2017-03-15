include:
  - repository.salt-repo  

salt-master:
  pkg.installed:
    - name: salt-master
    - refresh: True

salt-master:
  pkg.installed:
    - name: python-zmq
    - refresh: True

/etc/salt/master:
  file.managed:
    - source: salt://salt-master/files/master
    - template: jinja
    - require:
      - pkg: salt-master

salt-master_service:
  service.running:
    - name: salt-master
    - enable: True
    - require:
      - pkg: salt-master
      - file: /etc/salt/master
    - watch:
      - file: /etc/salt/master
