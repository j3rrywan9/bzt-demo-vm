{%- for group, gdata in pillar.get('local_groups', {}).iteritems() %}
{{ group }}:
  group.present:
    - name: {{ group }}
{%- if 'gid' in gdata %}
    - gid: {{ gdata.gid }}
{%- endif %}
{%- endfor %}
