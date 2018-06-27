{%- set local_users = salt['pillar.get']('local_users', {}) %}
{%- set user_list = salt['pillar.get']('users', []) %}
{%- for user in user_list %}
{{ user }}:
  group.present:
    - gid: {{ local_users[user]['gid'] }}
  user.present:
    - uid: {{ local_users[user]['uid'] }}
    - gid: {{ local_users[user]['gid'] }}
    - fullname: {{ local_users[user]['fullname'] }}
    {%- if 'password' in local_users[user] %}
    - password: {{ local_users[user]['password'] }}
    - enforce_password: True
    {%- endif %}
    - shell: {{ local_users[user]['shell'] }}
    - home: {{ local_users[user]['home'] }}
    {%- if 'groups' in local_users[user] %}
    - groups:
      {%- for group in local_users[user]['groups'] %}
      - {{ group }}
      {%- endfor %}
    {%- endif %}
{%- endfor %}
