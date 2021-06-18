# sourcetrail

## problems

```
$ sourcetrail
qt.qpa.xcb: X server does not support XInput 2
failed to get the current screen resources
07:34:09 | LogManager.cpp:40 setLoggingEnabled() | INFO: Enabled logging for Sourcetrail 64 bit, version 2021.1.30
07:34:09 | SharedMemoryGarbageCollector.cpp:59 run() | INFO: start shared memory garbage collection
The X11 connection broke: I/O error (code 1)
XIO:  fatal IO error 0 (Success) on X server "localhost:10.0"
      after 237 requests (232 known processed) with 0 events remaining.
07:34:09 | TaskScheduler.cpp:96 stopSchedulerLoop() | WARNING: Unable to stop task scheduler. Loop is not running.
07:34:09 | TaskScheduler.cpp:96 stopSchedulerLoop() | WARNING: Unable to stop task scheduler. Loop is not running.
terminate called without an active exception
[1]    2148762 abort (core dumped)  sourcetrail

```

```
mobaXterm 就可以解决，支持xInput
```