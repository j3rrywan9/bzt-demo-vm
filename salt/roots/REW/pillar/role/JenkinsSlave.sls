users:
{% import_yaml 'users/local.sls' as local %}
{%- for user, user_data in local['local_users'].items() %}
  {%- if 'groups' in user_data and 'qe' in user_data.groups %}
  - {{ user }}
  {%- endif %}
{%- endfor %}
