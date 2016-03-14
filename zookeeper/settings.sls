{% set p  = salt['pillar.get']('zookeeper', {}) %}
{% set pc = p.get('config', {}) %}
{% set g  = salt['grains.get']('zookeeper', {}) %}
{% set gc = g.get('config', {}) %}

{%- set user = p.get('user', 'zookeeper') %}
{%- set group = p.get('group', 'zookeeper') %}
{%- set uid = p.get('uid', '6030') %}
{%- set version = g.get('version', p.get('version', '3.4.8')) %}
{%- set version_name = 'zookeeper-' + version %}
{%- set default_url = 'http://ftp.heanet.ie/mirrors/www.apache.org/dist/zookeeper/stable/' + version_name + '.tar.gz' %}
{%- set source_url = g.get('source_url', p.get('source_url', default_url)) %}
{%- set prefix = p.get('prefix', '/usr/share/zookeeper') %}
{%- set home = prefix + version_name %}
{%- set bin_dir = g.get('bin_dir', p.get('bin_dir', home + '/bin')) %}
{%- set conf_dir = g.get('conf_dir', p.get('conf_dir', home + '/conf')) %}

### Config options
{%- set log_dir           = gc.get('log_dir', pc.get('log_dir', '/var/log/zookeeper')) %}
{%- set log_level         = gc.get('log_level', pc.get('log_level', 'INFO')) %}
{%- set bind_address      = gc.get('bind_address', '0.0.0.0') %}
{%- set data_dir          = gc.get('data_dir', pc.get('data_dir', '/var/lib/zookeeper')) %}
{%- set client_port       = gc.get('port', pc.get('port', '2181')) %}
{%- set jmx_port          = gc.get('jmx_port', pc.get('jmx_port', '2183')) %}
{%- set snap_count        = gc.get('snap_count', pc.get('snap_count', 'None')) %}
{%- set snap_retain_count = gc.get('snap_retain_count', pc.get('snap_retain_count', 3)) %}
{%- set purge_interval    = gc.get('purge_interval', pc.get('purge_interval', 'None')) %}
{%- set max_client_cnxns  = gc.get('max_client_cnxns', pc.get('max_client_cnxns', 100)) %}
### End Config

### JVM options
{%- set initial_heap_size = gc.get('initial_heap_size', pc.get('initial_heap_size', 256)) %}
{%- set max_heap_size     = gc.get('max_heap_size', pc.get('max_heap_size', 1024)) %}
{%- set max_perm_size     = gc.get('max_perm_size', pc.get('max_perm_size', 128)) %}
{%- set jvm_opts          = gc.get('jvm_opts', pc.get('jvm_opts', None)) %}
### End JVM

### Mine gathering
{%- set zookeeper_hostnames = salt['mine.get']('roles:zookeeper', 'network.get_hostname', 'grain') %}
{%- set zookeeper_ips = salt['mine.get']('roles:zookeeper', 'network.ip_addrs', 'grain') %}
{%- set zookeeper_myids = salt['mine.get']('roles:zookeeper', 'zookeeper_myid', 'grain') -%}
### End Mine

{%- set zk = {} %}
{%- do zk.update( { 'user': user,
                    'group': group,
                    'uid': uid,
                    'version': version,
                    'version_name': version_name,
                    'source_url': source_url,
                    'prefix' : prefix,
                    'home': home,
                    'bin_dir': bin_dir,
                    'conf_dir': conf_dir,
                    'log_dir': log_dir,
                    'log_level': log_level,
                    'bind_address': bind_address,
                    'data_dir': data_dir,
                    'client_port': client_port,
                    'jmx_port': jmx_port,
                    'snap_count': snap_count,
                    'snap_retain_count': snap_retain_count,
                    'purge_interval': purge_interval,
                    'max_client_cnxns': max_client_cnxns,
                    'initial_heap_size': initial_heap_size,
                    'max_heap_size': max_heap_size,
                    'max_perm_size': max_perm_size,
                    'jvm_opts': jvm_opts,
                    'zookeeper_hostnames': zookeeper_hostnames,
                    'zookeeper_ips': zookeeper_ips,
                    'zookeeper_myids': zookeeper_myids,
                    }) %}
