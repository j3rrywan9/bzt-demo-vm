{%- set desired_ruby_version = '2.5.1p57' %}

bison:
  pkg.installed

libgdbm-dev:
  pkg.installed

libreadline-dev:
  pkg.installed

libssl-dev:
  pkg.installed

download_ruby_2.5.1_source:
  cmd.run:
    - name: curl -s -S --retry 5 https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz | tar xz
    - runas: jenkins
    - cwd: /var/lib/jenkins
    - unless: command -v ruby && test {{ desired_ruby_version|yaml_encode }} = $(ruby -v|awk '{print $2}')

install_ruby_2.5.1_from_source:
  cmd.run:
    - name: cd /var/lib/jenkins/ruby-2.5.1 && ./configure && make && make install
    - onchanges:
      - download_ruby_2.5.1_source

remove_ruby_2.5.1_source:
  file.absent:
    - name: /var/lib/jenkins/ruby-2.5.1
    - onchanges:
      - download_ruby_2.5.1_source

bundler:
  gem.installed:
    - version: 1.16.2
    - require:
      - install_ruby_2.5.1_from_source

fpm-cookery:
  gem.installed:
    - version: 0.33.0
    - require:
      - install_ruby_2.5.1_from_source
