# packer-freebsd

![Version](https://img.shields.io/github/tag/stblassitude/packer-freebsd.svg?maxAge=2592000)
[![License](https://img.shields.io/github/license/stblassitude/packer-freebsd.svg?maxAge=2592000)](http://creativecommons.org/publicdomain/zero/1.0/deed)
[![CircleCI](https://img.shields.io/circleci/project/stblassitude/packer-freebsd.svg?maxAge=2592000)](https://circleci.com/gh/stblassitude/packer-freebsd)

packer template to build FreeBSD (with zfsroot) images, based on the work
by [uchida/packer-freebsd](https://github.com/uchida/packer-freebsd).

Vagrant images are available at
- [app.vagrantup.com/stblassitude/freebsd-10](https://app.vagrantup.com/stblassitude/boxes/freebsd-10)
  (about 310 MB)
- [app.vagrantup.com/stblassitude/freebsd-11](https://app.vagrantup.com/stblassitude/boxes/freebsd-11)
  (about 260 MB)

```console
vagrant init stblassitude/freebsd-11; vagrant up
```

I'm running the build regularly (every couple of weeks to once a month). To use
the most recent image, update your local cache before you vagrant up a new box.

```console
vagrant box update stblassitude/freebsd-11
```

To check which version your Vagrant box is based on, you can look at
`/root/vagrantbox-version`, which contains the URL and version number of the box
`vagrant up` was run with.

## Building Images

To build images, simply run:

```console
$ git clone https://github.com/stblassitude/packer-freebsd
$ cd packer-freebsd
$ ./build.sh
```

While the template and the build script support VirtualBox, VMware, and
QEMU/KVM, I'm currently only building VirtualBox images.  If you'd like me to
build the others as well, drop me a line.

## License

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")]
(http://creativecommons.org/publicdomain/zero/1.0/deed)

dedicated to public domain, no rights reserved.
