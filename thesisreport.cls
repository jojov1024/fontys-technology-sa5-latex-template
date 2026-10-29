\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisreport}[2026/09/14, v2.0 - simplified]
\LoadClass[12pt,a4paper]{book}

% =====================================================================
%  CORE PACKAGES
%  These are loaded for every report: text encoding, basic maths,
%  images, clickable links, page margins, tables, lists, paragraph
%  spacing, page numbering and the chapter title style below.
% =====================================================================
\usepackage[utf8]{inputenc}
\usepackage{amsmath,amsfonts,amssymb}                             % basic maths
\usepackage{graphicx}                                             % images
\usepackage[hidelinks,colorlinks=true,citecolor=blue]{hyperref}   % clickable links + \url
\usepackage[hmargin=2cm,vmargin=2cm]{geometry}
\usepackage{array,tabularx,booktabs}                              % tables
\usepackage{enumitem}                                             % list formatting
\usepackage{parskip}                                              % no first-line indent
\usepackage{fancyhdr}                                             % header/footer
\usepackage[explicit]{titlesec}                                   % chapter title style
\usepackage{etoolbox}                                             % used by metadata.tex
\usepackage[section]{placeins}                                    % keep floats in their section
\usepackage[color=yellow!40, linecolor=orange]{todonotes}         % \todo{} margin notes while writing

\bibliographystyle{IEEEtran}

% =====================================================================
%  OPTIONAL EXTRAS
%  Uncomment only what you need. Keeping unused packages out prevents
%  compile errors on setups (or Overleaf compilers) where a package
%  happens to be missing, and keeps compilation fast.
% =====================================================================
\usepackage{siunitx}                  % \SI{5}{\meter} for units and numbers
% \usepackage{wrapfig}                 % text-wrapped figures
\usepackage{subcaption}               % sub-figures, e.g. figure (a)/(b)
% \usepackage{pdfpages}                % \includepdf, embed whole PDF pages
% \usepackage{algorithm,algorithmic}   % pseudocode listings
% \usepackage{amsthm}                  % \newtheorem, formal theorem/proof style
% \usepackage{mathrsfs}                % \mathscr{} script font

% =====================================================================
%  PAGE STYLE -- page number bottom-right, no header/footer rules.
%  "plain" is redefined too, since \chapter switches to it automatically.
% =====================================================================
\pagestyle{fancy}
\fancyhf{}
\rfoot{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{
  \fancyhf{}
  \rfoot{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\renewcommand{\cleardoublepage}{\clearpage}   % don't insert blank pages between chapters

% =====================================================================
%  CHAPTER TITLE STYLE -- large, right-aligned, with a rule underneath
% =====================================================================
\titlespacing*{\chapter}{1pt}{0pt}{0pt}

\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}
\makeatother

\titleformat{\chapter}[display]
  {\raggedleft\fontsize{14pt}{12pt}\sc}
  {{\chaptertitlename\ \thechapter}}{5pt}
  {{\raggedleft\bf\Huge #1}\vspace{5pt}\hrule}

% =====================================================================
%  Centered table column with line breaks, e.g. >{}C{3cm}
% =====================================================================
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
