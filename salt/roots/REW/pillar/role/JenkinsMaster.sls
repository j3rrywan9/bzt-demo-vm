sudoers:
  jenkins:
    defaults:
      generic:
        - 'env_keep += "DEBIAN_FRONTEND"'
    groups:
      qe:
        - '(jenkins) ALL'
        - '(root) NOPASSWD: /bin/systemctl start jenkins'
        - '/bin/systemctl stop jenkins'
        - '/bin/systemctl restart jenkins'
        - '/bin/systemctl status jenkins'

