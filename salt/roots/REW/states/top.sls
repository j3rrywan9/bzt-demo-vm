REW:
  '*':
    - common
    - sudoers

  'role:JenkinsMaster':
    - match: grain
    - jenkins.master

  'role:JenkinsSlave':
    - match: grain
    - jenkins.slave

