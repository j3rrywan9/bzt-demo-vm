dpkg-sig:
  pkg.installed

gnupg:
  pkg.installed

gnupg2:
  pkg.installed

gnupg-agent:
  pkg.installed

create_gnupg_directory:
  file.directory:
    - name: /var/lib/jenkins/.gnupg
    - user: jenkins
    - group: jenkins
    - mode: 700

jenkins_gpg_agent_service:
  file.managed:
    - name: /lib/systemd/system/jenkins-gpg-agent.service
    - source: salt://jenkins/slave/files/lib/systemd/system/jenkins-gpg-agent.service
    - require:
      - pkg: gnupg-agent
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: jenkins_gpg_agent_service

jenkins_gpg_agent_running:
  service.running:
    - name: jenkins-gpg-agent
    - enable: True
    - watch:
      - module: jenkins_gpg_agent_service
