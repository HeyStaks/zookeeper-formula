{%- from 'zookeeper/settings.sls' import zk with context %}

zookeeper_group:
  group.present:
    - name: {{ zk.group }}
    - gid: {{ zk.uid }}

zookeeper_user:
  user.present:
    - name: {{ zk.user }}
    - uid: {{ zk.uid }}
    - gid: {{ zk.group }}
    - require:
      - group: zookeeper_group

zookeeper_basedirs:
  file.directory:
    - user: {{ zk.user }}
    - group: {{ zk.group }}
    - mode: 755
    - makedirs: True
    - names:
      - /var/run/zookeeper
      - /var/lib/zookeeper
      - /var/log/zookeeper

zookeeper_prefix:
  file.directory:
    - name: {{ zk.prefix }}
    - user: root
    - group: root

zookeeper_datadir:
  file.directory:
    - name: {{ zk.data_dir }}
    - user: {{ zk.user }}
    - group: {{ zk.group }}
    - makedirs: True

zookeeper_archive:
  archive.extracted:
    - name: {{ zk.prefix }}
    - source: {{ zk.source_url }}
    - source_hash: md5=6bdddcd5179e9c259ef2bf4be2158d18
    - archive_format: tar
    - user: {{ zk.user }}
    - group: {{ zk.group }}
    - if_missing: {{ zk.home }}
    - require:
      - file: zookeeper_prefix

