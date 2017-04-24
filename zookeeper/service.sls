{%- from 'zookeeper/map.jinja' import zookeeper with context %}

include:
  - zookeeper.config

zookeeper_env:
  file.managed:
    - name: {{ zookeeper.env_file }}
    - source: salt://zookeeper/files/zookeeper-env.sh.jinja
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - template: jinja
    - defaults:
        env: {{ zookeeper.env }}
        bin_dir: {{ zookeeper.bin_dir }}
        config_dir: {{ zookeeper.config_dir }}

zookeeper_init:
  file.managed:
{%- if grains.get('init') == 'systemd' %}
    - name: /etc/systemd/system/zookeeper.service
    - source: salt://zookeeper/files/zookeeper.systemd.jinja
{%- endif %}
    - template: jinja
    - defaults:
        user: {{ zookeeper.user }}
        group: {{ zookeeper.group }}
        home: {{ zookeeper.home }}
        exec: {{ zookeeper.bin_dir }}/zkServer.sh

zookeeper_service:
  service.running:
    - name: zookeeper
    - enable: True
    - watch:
      - file: zookeeper_config
