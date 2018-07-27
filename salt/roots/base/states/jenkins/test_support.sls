{%- set desired_vagrant_version = '2.1.2' %}

include:
  - devtools.ruby

jmeter-3.2:
  cmd.run:
    - name: curl -s -S --retry 5 https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.2.tgz | tar xz
    - cwd: /usr/local
    - creates: /usr/local/apache-jmeter-3.2/bin/jmeter

virtualbox-repo:
  pkgrepo.managed:
    - humanname: VirtualBox repo
    - name: deb https://download.virtualbox.org/virtualbox/debian jessie contrib
    - file: /etc/apt/sources.list.d/virtualbox.list
    - key_url: https://www.virtualbox.org/download/oracle_vbox_2016.asc

virtualbox-5.2:
  pkg.installed:
    - require:
      - pkgrepo: virtualbox-repo

download_vagrant_2.1.2_deb:
  cmd.run:
    - name: wget -q https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_x86_64.deb
    - runas: jenkins
    - cwd: /var/lib/jenkins
    - unless: command -v vagrant && test {{ desired_vagrant_version|yaml_encode }} = $(vagrant -v|awk '{print $2}')

install_vagrant_2.1.2_deb:
  cmd.run:
    - name: dpkg -i /var/lib/jenkins/vagrant_2.1.2_x86_64.deb && apt-get install -f
    - onchanges:
      - download_vagrant_2.1.2_deb

remove_vagrant_2.1.2_deb:
  file.absent:
    - name: /var/lib/jenkins/vagrant_2.1.2_x86_64.deb
    - onchanges:
      - download_vagrant_2.1.2_deb

test-kitchen:
  gem.installed:
    - version: 1.22.0
    - require:
      - sls: devtools.ruby

kitchen-docker:
  gem.installed:
    - version: 2.7.0
    - require:
      - sls: devtools.ruby

kitchen-ansible:
  gem.installed:
    - version: 0.48.6
    - require:
      - sls: devtools.ruby

kitchen-vagrant:
  gem.installed:
    - version: 1.3.2
    - require:
      - sls: devtools.ruby
