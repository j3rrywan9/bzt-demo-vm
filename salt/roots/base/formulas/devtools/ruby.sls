ruby:
  pkg.installed

ruby-dev:
  pkg.installed

bundler:
  gem.installed:
    - version: 1.16.2
    - require:
      - ruby

fpm-cookery:
  gem.installed:
    - version: 0.33.0
    - require:
      - ruby
      - ruby-dev
