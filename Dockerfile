FROM busybox

#ADD https://github.com/armbuild/qemu-user-static/raw/master/x86_64/qemu-arm-static /usr/local/bin/
COPY qemu-arm-static /usr/local/bin/

CMD set -xe; mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc && test -f /proc/sys/fs/binfmt_misc/arm && echo "binfmt already registered" >&2 || echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-arm-static:' > /proc/sys/fs/binfmt_misc/register; cat /usr/local/bin/qemu-arm-static
