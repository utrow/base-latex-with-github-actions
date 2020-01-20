FROM paperist/alpine-texlive-ja
RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata
COPY .latexmkrc /workdir
COPY document /workdir
ENTRYPOINT ["latexmk", "-output-directory=./build"]
