ca-certificates-java:
  pkg.installed:
    - version: 20161107~bpo8+1

openjdk-8-jdk:
  pkg.installed:
    - require:
      - pkg: ca-certificates-java

java-8-alternative:
  cmd.run:
    - name: update-java-alternatives -s java-1.8.0-openjdk-amd64
    - unless: "[ \"$(update-alternatives --query java | grep Value | awk '{print $2}')\" = \"/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java\" ]"

