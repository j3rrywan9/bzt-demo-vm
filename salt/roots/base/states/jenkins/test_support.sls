jmeter-3.2:
  cmd.run:
    - name: curl -s -S --retry 5 https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.2.tgz | tar xz
    - cwd: /usr/local
    - creates: /usr/local/apache-jmeter-3.2/bin/jmeter

bzt-1.9.6:
  cmd.run:
    - name: pip install bzt==1.9.6