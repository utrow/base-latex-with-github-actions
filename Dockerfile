FROM paperist/alpine-texlive-ja
RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime ; \
    apk add bzip2\
	&& wget -q "https://ja.osdn.net/frs/redir.php?m=jaist&f=mytexpert%2F26068%2Fjlisting.sty.bz2" -O - \
	|bzip2 -d >/usr/local/texlive/2019/texmf-dist/tex/latex/listing/jlisting.sty \
	&& mktexlsr \
	apk del bzip2 tzdata

COPY .latexmkrc /workdir
COPY document /workdir
ENTRYPOINT ["latexmk", "-output-directory=./build"]
