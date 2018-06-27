include:
  - devtools.build
  - devtools.git
  - devtools.java
  - python
  - jenkins.repo

jenkins:
  pkg.installed:
    - require:
      - pkgrepo: jenkins-apt-repo
  service.running:
    - enable: True
    - require:
      - pkg: jenkins

