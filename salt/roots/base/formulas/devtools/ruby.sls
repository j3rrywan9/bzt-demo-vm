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

download Ruby 2.5.1 source:
  cmd.run:
    - name: curl -s -S --retry 5 https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz | tar xz
    - runas: jenkins
    - cwd: /var/lib/jenkins
    - creates: /var/lib/jenkins/ruby-2.5.1

install Ruby 2.5.1 from source:
  cmd.run:
    - name: cd /var/lib/jenkins/ruby-2.5.1 && ./configure && make && make install
