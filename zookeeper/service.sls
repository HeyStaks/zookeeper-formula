{% from 'zookeeper/map.jinja' import zookeeper with context %}

include:
  - .config

zookeeper_init:
  file.managed:
    - name: {{ zookeeper.service_conf }}
    - source: salt://zookeeper/templates/{{ zookeeper.service_script }}
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
