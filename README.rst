=========
zookeeper
=========

Formula to set up and configure a single-node zookeeper server.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Formula Dependencies
====================

* Heystaks/java-formula

Available states
================

.. contents::
    :local:

``zookeeper``
-------------

Downloads the zookeeper tarball from zookeeper:source_url (either pillar or grain), installs the package.

Zookeeper role and Salt Minion Configuration
============================================

The implementation depends on the existence of the _roles_ grain in your minion configuration - at least
one minion in your network has to have the *zookeeper* role which means that it is a zookeeper server.
