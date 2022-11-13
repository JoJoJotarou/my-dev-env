# syntax=docker/dockerfile:1.4.1

# docker build -t jojojotarou/alpine:3.15.4-bash .

FROM alpine:3.15.4

ENV LANG=en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Asia/Shanghai

ARG UNAME=dev
ARG UID=1000
ARG GNAME=dev
ARG GID=1000

COPY --chmod=644 .profile .bash_history .bashrc .bash_aliases /etc/skel/
COPY --chmod=644 .profile .bash_history .bashrc .bash_aliases /root/
RUN \
    # change apk mirror add applications
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache git bash bash-doc bash-completion tzdata \
    && rm -rf /var/cache/apk/* \
    && sed -i '1 s/ash/bash/' /etc/passwd \
    # timezone
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezon \
    # add dev user and group
    && addgroup -S -g ${GID} ${GNAME} \
    && adduser -S -D -h /home/${UNAME} -s /bin/bash -k /etc/skel -G ${GNAME} -u ${UID} ${UNAME}

CMD [ "bash" ]
