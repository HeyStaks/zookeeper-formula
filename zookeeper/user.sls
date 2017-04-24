{%- from 'zookeeper/map.jinja' import zookeeper with context %}

zookeeper_group:
  group.present:
    - name: {{ zookeeper.group }}
    - system: True

zookeeper_user:
  user.present:
    - name: {{ zookeeper.user }}
    - gid: {{ zookeeper.group }}
    - system: True
    - require:
      - group: zookeeper_group
