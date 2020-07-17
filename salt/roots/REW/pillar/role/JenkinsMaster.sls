sudoers:
  jenkins:
    defaults:
      generic:
        - 'env_keep += "DEBIAN_FRONTEND"'
    groups:
      qe:
        - '(jenkins) ALL'
        - '(root) NOPASSWD: /bin/systemctl start jenkins'
        - '/bin/systemctl stop jenkins'
        - '/bin/systemctl restart jenkins'
        - '/bin/systemctl status jenkins'

users:
{% import_yaml 'users/local.sls' as local %}
{%- for user, user_data in local['local_users'].items() %}
  {%- if 'groups' in user_data and 'qe' in user_data.groups %}
  - {{ user }}
  {%- endif %}
{%- endfor %}
