bison:
  pkg.installed

libgdbm-dev:
  pkg.installed

libreadline-dev:
  pkg.installed

libssl-dev:
  pkg.installed

openssl:
  pkg.installed

download_ruby_2.5.1_source:
  cmd.run:
    - name: curl -s -S --retry 5 https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz | tar xz
    - runas: jenkins
    - cwd: /var/lib/jenkins
    - creates: /var/lib/jenkins/ruby-2.5.1

install_ruby_2.5.1_from_source:
  cmd.run:
    - name: cd /var/lib/jenkins/ruby-2.5.1 && ./configure && make && make install

fpm-cookery:
  gem.installed:
    - version: 0.33.0
    - require:
      - install_ruby_2.5.1_from_source
