{% from 'zookeeper/map.jinja' import zookeeper with context %}

zookeeper_myid:
  file.managed:
    - name: {{ zookeeper.config.data_dir }}/myid
    - source: salt://zookeeper/templates/myid
    - replace: False
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - mode: 644
    - template: jinja

zookeeper_main_config:
  file.managed:
    - name: {{ zookeeper.home }}/conf/zoo.cfg
    - source: salt://zookeeper/templates/zoo.cfg
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - mode: 644
    - template: jinja
    - watch:
      - file: zookeeper_myid

zookeeper_env:
  file.managed:
    - name: {{ zookeeper.conf_dir }}/zookeeper-env.sh
    - source: salt://zookeeper/templates/zookeeper-env.sh
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - mode: 644
    - template: jinja
