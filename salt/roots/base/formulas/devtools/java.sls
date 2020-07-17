ca-certificates-java:
  pkg.installed

openjdk-11-jdk:
  pkg.installed:
    - require:
      - pkg: ca-certificates-java
