{%- from 'zookeeper/map.jinja' import zookeeper with context %}

include:
  - zookeeper.package

zookeeper_datadir:
  file.directory:
    - name: {{ zookeeper.config.dataDir }}
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - makedirs: True

zookeeper_myid:
  file.managed:
    - name: {{ zookeeper.config.dataDir }}/myid
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - contents: {{ grains.get('zookeeper:myid', zookeeper.myid) }}
    - require:
      - file: zookeeper_datadir

zookeeper_config:
  file.managed:
    - name: {{ zookeeper.config_file }}
    - source: salt://zookeeper/files/zoo.cfg.jinja
    - template: jinja
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - defaults:
        config: {{ zookeeper.config }}
    - watch:
      - file: zookeeper_myid
