{% from 'zookeeper/settings.sls' import zk with context %}

zookeeper_myid:
  file.managed:
    - name: {{ zk.data_dir }}/myid
    - source: salt://zookeeper/files/myid
    - replace: False
    - user: {{ zk.user }}
    - group: {{ zk.group }}
    - mode: 644
    - template: jinja
