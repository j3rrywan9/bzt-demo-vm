jenkins-apt-repo:
  pkgrepo.managed:
    - humanname: Jenkins Apt Repo
    - name: deb https://pkg.jenkins.io/debian-stable binary/
    - file: /etc/apt/sources.list.d/jenkins.list
    - key_url: https://pkg.jenkins.io/debian-stable/jenkins.io.key

