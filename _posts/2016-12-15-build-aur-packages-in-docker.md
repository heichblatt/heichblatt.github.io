---
layout: post
title: "Build AUR Packages in a Docker Container"
description: "Don't trust that yaourt"
category: personal
tags:
- tech
- howto
---
{% include JB/setup %}
I switched back to [Arch Linux](https://www.archlinux.org/), partly because of the amazing [Arch User Repository (AUR)](https://wiki.archlinux.org/index.php/Arch_User_Repository). I use [`yaourt`](https://archlinux.fr/yaourt-en) as my [AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers). We will use [my Arch Linux Docker image with yaourt included](https://hub.docker.com/r/heichblatt/archlinux-yaourt/) to sandbox the whole process of building a package from a [`PKGBUILD`](https://wiki.archlinux.org/index.php/PKGBUILD). We mount a directory `pkgs` under our current working directory at `/var/cache/pacman/pkg` in the container to store the built packages and all necessary dependencies. `yaourt` will keep a copy of all downloaded packages in said directory. We also tell `yaourt` to `export` the built packages there. Since `yaourt` will let us edit the `PKGBUILD` and `*.install` files, we need to specify an `$EDITOR`. The last argument is the name of the package to be built, in this example the simply wonderful [Lumina desktop environment](https://lumina-desktop.org/).

    docker run -ti -v $PWD/pkgs:/var/cache/pacman/pkg -e "EDITOR=nano" heichblatt/archlinux-yaourt yaourt -Sy --export /var/cache/pacman/pkg lumina-desktop

This way, if you miss any malicious commands in the scripts being run during the build, the damage gets contained in the ephemeral container. I'll leave it to the reader to find further ways to secure the container. What's more, you could even write your own wrapper around [`makepkg`](https://wiki.archlinux.org/index.php/makepkg) and put it in your [`yaourtrc`](https://archlinux.fr/man/yaourtrc.5.html).
