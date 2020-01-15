FROM paperist/alpine-texlive-ja
RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata
COPY scripts/build.sh /scripts/build.sh
COPY document /workdir