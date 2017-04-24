=========
zookeeper
=========

Formula to set up and configure a single-node zookeeper server.

Features
========

- Install zookeeper using the tar.gz archive from the official site
- Configure zookeeper using data from pillar
- Run zookeeper service

Formula Dependencies
====================

* Java (https://bitbucket.org/heystaks/java-formula suggested)

To use the java-formula on test-kitchen, is necessary to include the java-formula as a submodule in the *deps* directory:

The java-formula master branch is already included as a submodule and the url information is saved on *.gitmodules* so in order to inialize the module, you should run:

`git submodule update --init`

If a different java formula needs to be used then the submodule can be added explitely with on the directory *deps/java-formula* and test-kitchen will pick it up.

`git submodule add git@bitbucket.org:heystaks/java-formula deps/java-formula`

Because is using git submodule, it can import an specific branch of the java-formula or an specific reference like commit

Available states
================

.. contents::
    :local:

``zookeeper.user``
------------------

Create zookeeper user and group to use it for the files and service.

``zookeeper.package``
---------------------

Download and unarchive zookeeper package from `source` pillar variable url. 

``zookeeper.config``
--------------------

- Create dataDir directory
- Setup myid file with the `myid` pillar variable value.
- Setup `zoo.cfg` using pillar values under `zookeeper.config` key.

``zookeeper.service``
---------------------

- Install service script. Only systemd unit for now.
- Starts the service and sets it to run on init.

``zookeeper``
-------------

Run all states to have a Zookeeper server running.

Pillar parameters
*****************

.. code:: yaml

    zookeeper:
      version: 'zookeeper-3.4.10'
      source: 'http://ftp.heanet.ie/mirrors/www.apache.org/dist/zookeeper/stable/zookeeper-3.4.10.tar.gz'
      source_hash: 'sha1=eb2145498c5f7a0d23650d3e0102318363206fba'
      user: zookeeper
      group: zookeeper
      install_dir: /opt
      myid: 1
    config:
      tickTime: 2000
      initLimit: 10
      syncLimit: 5
      dataDir: /var/lib/zookeeper
      clientPort: '2181'
      maxClientCnxns: 100
      log_dir: /var/log/zookeeper
      log_level: INFO
      #snap_count: None
      #snap_retain_count: 3
      #purge_interval: None
    jvm:
      initial_heap_size: 256
      max_heap_size: 1024
      max_perm_size: 128

Examples of usage
=================

.. code:: sh

   salt '*' state.apply zookeeper
   salt -G 'roles:zookeeper' state.apply zookeeper

Saltstack formulas
==================

See the full `Salt Formulas installation and usage instructions <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.
