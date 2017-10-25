REW:
  '*':
    - common
    - sudoers

  'role:JenkinsMaster':
    - match: grain
    - jenkins.master

