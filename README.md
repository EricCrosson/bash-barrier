# bash-barrier

This project provides a barrier for the synchronization of shell scripts or
terminal commands. The shells to be synchronized can be local or remote.

## Install

This script is standalone -- download it and ensure it is in your `$PATH`.

## Use

The basic blocking syntax is to invoke the script:

```
barrier
```

This will pause execution until another shell has reached the barrier. To wait
for multiple notifications, add a numeric argument:

```
barrier 3
```

To notify waiting shells that you have reached a barrier, invoke `barrier` with
the hosts to notify as arguments:

```
barrier localhost
barrier host1 host2 host3
```

### Advanced

To use multiple, independent barriers that should not notify each other,
customize the `PORT` environment variable in the executing shell. For example:

```
PORT=5656 barrier
```

will wait for a different shell to execute:

```
PORT=5656 barrier localhost
```

and any barriers listening on the default port (`64926`) will not be affected.

## Limitations

This is implemented in-shell for-shell. This is not a performant package. In
use cases where multiple broadcasts may be received in a narrow time window,
some may be dropped by the listener. The casual user will be fine.
