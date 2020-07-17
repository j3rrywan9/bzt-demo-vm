{%- for group, gdata in pillar.get('local_groups', {}).items() %}
{{ group }}:
  group.present:
    - name: {{ group }}
{%- if 'gid' in gdata %}
    - gid: {{ gdata.gid }}
{%- endif %}
{%- endfor %}
