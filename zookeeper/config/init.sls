{% from 'zookeeper/settings.sls' import zk with context %}

include:
  - .myid

zookeeper_main_config:
  file.managed:
    - name: {{ zk.home }}/conf/zoo.cfg
    - source: salt://zookeeper/files/zoo.cfg
    - user: {{ zk.user }}
    - group: {{ zk.group }}
    - mode: 644
    - template: jinja
    - watch:
      - file: zookeeper_myid

zookeeper_env:
  file.managed:
    - name: {{ zk.conf_dir }}/zookeeper-env.sh
    - source: salt://zookeeper/files/zookeeper-env.sh
    - user: {{ zk.user }}
    - group: {{ zk.group }}
    - mode: 644
    - template: jinja
