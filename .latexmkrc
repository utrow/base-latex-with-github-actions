#!/usr/bin/env perl
$pdf_mode         = 3;
$latex            = 'platex -halt-on-error -interaction=nonstopmode -file-line-error';
$latex_silent     = 'platex -halt-on-error -interaction=nonstopmode -file-line-error';
$bibtex           = 'pbibtex';
$out_dir          = 'output';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';

