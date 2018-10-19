# docker-binfmt-register

[![GuardRails badge](https://badges.production.guardrails.io/moul/docker-binfmt-register.svg)](https://www.guardrails.io)

:whale: binfmt-support register in Docker, works with boot2docker to run armhf images

Registers `binfmt-support` in Docker host kernel (works with boot2docker)

```console
$ docker run --privileged moul/binfmt-register > qemu-arm-static
+ mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc
+ test -f /proc/sys/fs/binfmt_misc/arm
+ echo :arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-arm-static:
+ cat /usr/local/bin/qemu-arm-static
$ chmod +x qemu-arm-static
$ docker run -it -v $(pwd)/qemu-arm-static:/usr/local/bin/qemu-arm-static armbuild/ubuntu:trusty bash
root@832aa3415b1a:/# uname -a
Linux 832aa3415b1a 3.18.5-tinycore64 #1 SMP Sun Feb 1 06:02:30 UTC 2015 armv7l armv7l armv7l GNU/Linux
```
