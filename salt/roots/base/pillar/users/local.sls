local_users:
  jenkins:
    uid: 20001
    gid: 20001
    fullname: Jenkins CI
    shell: /bin/bash
    home: /var/lib/jenkins
    groups:
      - dev
      - qe
      - apps
