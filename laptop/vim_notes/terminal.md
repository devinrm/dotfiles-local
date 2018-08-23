```bash
In general it's not advisable to use `kill -9` for the following reasons:

  it doesn't give the process a chance to cleanly...

  1. shut down socket connections
  2. clean up tmp files
  3. inform its children that it's going away
  4. reset its terminal characteristics

  Generally, send `15`(SIGTERM(terminate)), and wait a second or two, and if
  that doesn't work, send `2`(SIGINT(interrupt, ctrl-c)), and if that doesn't
  work, send `1`(SIGHUP(terminal hangup, often overloaded to keep a process
  running but reload the config)).
```
