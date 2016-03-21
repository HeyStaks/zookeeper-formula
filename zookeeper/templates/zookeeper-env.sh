{%- from 'zookeeper/map.jinja' import zookeeper with context -%}
ZOOBINDIR={{ zookeeper.bin_dir }}
ZOOCFGDIR={{ zookeeper.conf_dir }}
ZOO_LOG_DIR={{ zookeeper.config.log_dir }}
ZOO_LOG4J_PROP={{ zookeeper.config.log_level }},ROLLINGFILE
ZOOPIDFILE=/var/run/zookeeper/zookeeper.pid
{## SERVER_JVMFLAGS="-Xms{{ zookeeper.initial_heap_size }}m -Xmx{{ zookeeper.max_heap_size }}m {{ zookeeper.jvm_opts }} -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.port={{ zookeeper.jmx_port }}" ##}
