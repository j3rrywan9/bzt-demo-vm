REW:
  '*':
    - ignore_missing: True
    - common
{%- if 'role' in grains %}
  {%- if grains.role is not iterable or grains.role is string %}
    - role.{{ grains.role }}
  {%- else %}
    {%- for role in grains.role %}
    - role.{{ role }}
    {%- endfor %}
  {%- endif %}
{%- endif %}
    - minion.{{ grains.id }}

