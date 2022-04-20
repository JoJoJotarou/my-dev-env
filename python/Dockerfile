# syntax=docker/dockerfile:1.4.1

ARG TAG

FROM python:${TAG}

ENV LANG=en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TZ=Asia/Shanghai


ARG UNAME=dev
ARG UID=1000
ARG GNAME=dev
ARG GID=1000

COPY --chmod=644 bash/* /etc/skel/
COPY --chmod=644 bash/* /root/

RUN \
    # change apk mirror add applications
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache git bash bash-doc bash-completion \
    && rm -rf /var/cache/apk/* \
    && sed -i '1 s/ash/bash/' /etc/passwd \
    # timezone
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezon \
    # add dev user and group
    && addgroup -S -g ${GID} ${GNAME} \
    && adduser -S -D -h /home/${UNAME} -s /bin/bash -k /etc/skel -G ${GNAME} -u ${UID} ${UNAME}


USER ${UNAME}

COPY --chown=${UID}:${GID} --chmod=755 vscext.sh /home/${UNAME}/
COPY --chown=${UID}:${GID} --chmod=644 settings.json /home/${UNAME}/.vscode-server/data/Machine/settings.json

ENV PATH=/home/${UNAME}/.local/bin:$PATH

WORKDIR /home/${UNAME}

CMD [ "bash" ]
