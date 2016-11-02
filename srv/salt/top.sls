base:
  '*':
    - salt-minion
    - repository.salt-repo
    - package
  '*salt-master*':
    - salt-master
