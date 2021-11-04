FROM archlinux

ARG repohost=mirrors.mit.edu
ARG contaneruser=qmk

RUN echo "Server = http://${repohost}/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
RUN useradd ${containeruser} && mkhomedir_helper ${containeruser}

RUN pacman -Sy --noconfirm python3 python-pip git libffi make which
RUN pacman -Sy --noconfirm $(pacman -Si qmk |grep Depends | sed 's/^Depends On.*: //g')
RUN pacman -Sy --noconfirm $(pacman -Si qmk |sed -n '/^Opt/,/^Conf/p' | sed '$d' | sed 's/^Opt.*://g' | sed 's/^\s*//g' | sed 's/: .*$//g' | tr '\n' ' ')

RUN python -m pip install qmk

WORKDIR /home/${containeruser}
USER ${containeruser}

ENTRYPOINT ["/usr/bin/qmk"]
