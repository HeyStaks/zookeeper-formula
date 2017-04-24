{%- from 'zookeeper/map.jinja' import zookeeper with context %}

include:
  - zookeeper.user

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

zookeeper_archive:
  archive.extracted:
    - name: {{ zookeeper.install_dir }}
    - source: {{ zookeeper.source }}
    - source_hash: {{ zookeeper.source_hash }}
    - archive_format: tar
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
