{%- from 'zookeeper/map.jinja' import zookeeper with context %}

zookeeper_group:
  group.present:
    - name: {{ zookeeper.group }}
    - gid: {{ zookeeper.uid }}

zookeeper_user:
  user.present:
    - name: {{ zookeeper.user }}
    - uid: {{ zookeeper.uid }}
    - gid: {{ zookeeper.group }}
    - require:
      - group: zookeeper_group

zookeeper_basedirs:
  file.directory:
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - mode: 755
    - makedirs: True
    - names:
      - /var/run/zookeeper
      - /var/lib/zookeeper
      - /var/log/zookeeper

zookeeper_prefix:
  file.directory:
    - name: {{ zookeeper.prefix }}
    - user: root
    - group: root

zookeeper_archive:
  archive.extracted:
    - name: {{ zookeeper.prefix }}
    - source: {{ zookeeper.source_url }}
    - source_hash: md5=6bdddcd5179e9c259ef2bf4be2158d18
    - archive_format: tar
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - if_missing: {{ zookeeper.home }}
    - require:
      - file: zookeeper_prefix
