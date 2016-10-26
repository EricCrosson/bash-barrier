Overview
========

This project provides a barrier for the synchronization of shell
scripts or terminal commands.  The shells to be synchronized can be
local or remote.

Installation
------------

This script is standalone -- download it and ensure it is in your
``$PATH``.

Usage
-----

The basic blocking syntax is to invoke the script::

    barrier

This will pause execution until another shell has reached the
barrier.  To wait for multiple shells, add a numeric argument::

    barrier 3

To notify waiting shells that you have reached a barrier, invoke
``barrier`` with the hosts to notify as arguments::

    barrier localhost
    barrier host1 host2 host3

License
-------

This project is released under the MIT license.
