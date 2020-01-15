# base-latex-with-github-actions

LaTeX Project template based my thesis project.


## Feature

- Build LaTeX document to PDF on docker container
- Makefile
  - TODO: Check output modifed at
- GitHub Actions
  - Build LaTeX document, And post to Slack
  - TODO: Cache, Resource output to GitHub


## Build

LaTeX document to PDF
```
$ make
```


## File structures
```
.
├── Dockerfile
├── Makefile  (ビルドスクリプト)
├── README.md
├── build
│   └── main.pdf  (ビルドしたドキュメントの出力先)
│
├── document  (LaTexドキュメント群)
│   ├── chapters  (各チャプタの内容、セクションをここに挿入する)
│   │   ├── acknowledgments.tex
│   │   ├── body.tex
│   │   ├── end_addition.tex
│   │   └── references.tex
│   ├── fancyhdr.sty
│   ├── icsthesis.cls
│   ├── main.bbl  (参考文献の定義)
│   ├── main.tex  (ドキュメントのメインファイル、チャプタの挿入はここにする)
│   └── sections  (各セクションの内容)
│       └── body  (チャプタ名でディレクトリ分割する)
│           ├── app.tex
│           ├── introduction.tex
│           └── purpose.tex
│
└── scripts
    └── build.sh  (ビルドコンテナ内で実行するビルドスクリプト)
```

