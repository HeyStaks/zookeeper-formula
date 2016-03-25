{%- from 'zookeeper/map.jinja' import zookeeper with context %}

zookeeper_datadir:
  file.directory:
    - name: {{ zookeeper.config.data_dir }}
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - makedirs: True

zookeeper_myid:
  file.managed:
    - name: {{ zookeeper.config.data_dir }}/myid
    - source: salt://zookeeper/templates/myid
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - template: jinja
    - require:
      - file: zookeeper_datadir

zookeeper_main_config:
  file.managed:
    - name: {{ zookeeper.home }}/conf/zoo.cfg
    - source: salt://zookeeper/templates/zoo.cfg
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - template: jinja
    - watch:
      - file: zookeeper_myid
