{%- from 'zookeeper/settings.sls' import zk with context -%}
ZOOBINDIR={{ zk.bin_dir }}
ZOOCFGDIR={{ zk.conf_dir }}
ZOO_LOG_DIR={{ zk.log_dir }}
ZOO_LOG4J_PROP={{ zk.log_level }},ROLLINGFILE
ZOOPIDFILE=/var/run/zookeeper/zookeeper.pid
# SERVER_JVMFLAGS="-Xms{{ zk.initial_heap_size }}m -Xmx{{ zk.max_heap_size }}m {{ zk.jvm_opts }} -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.port={{ zk.jmx_port }}"
