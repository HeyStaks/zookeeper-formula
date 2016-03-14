{% from 'zookeeper/settings.sls' import zk with context %}
{% from 'zookeeper/map.jinja' import zk_map with context %}

include:
  - .config

zookeeper_init:
  file.managed:
    - name: {{ zk_map.service_conf }}
    - source: salt://zookeeper/files/{{ zk_map.service_script }}
    - user: root
    - group: root
    - mode: 755
    - template: jinja

zookeeper_service:
  service.running:
    - name: zookeeper
    - enable: true
    - watch:
      - file: zookeeper_main_config
