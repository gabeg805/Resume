% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myresume}
\LoadClass[10pt]{article}

% Include packages
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{cmap}
\RequirePackage{enumitem}
\RequirePackage{amsmath}
\RequirePackage[top=0.5in, bottom=0.5in, left=0.5in, right=0.5in]{geometry}
\RequirePackage{array}
\RequirePackage{microtype}
\RequirePackage{xparse}

% Header/footer margins 
\topmargin=-1in
\headheight=0pt
\headsep=0.5in
\footskip=0pt
\marginparwidth=0pt
\marginparpush=0pt

\renewcommand{\baselinestretch}{1.125}

% Itemize environment spacing
\setlist{leftmargin=1em}
\setlist[itemize,1]{label=--}

% Header information
\providecommand{\Name}{}
\providecommand{\Address}{}
\providecommand{\City}{}
\providecommand{\Phone}{}
\providecommand{\Email}{}
\providecommand{\Github}{}
\providecommand{\Linkedin}{}
\providecommand{\Website}{}

% ------------------------------------------------------------------------------
% Header
\newcommand{\ResumeHeader}{
  \begin{tabular*}{7in}{l@{\extracolsep{\fill}}r}
    \textbf{\Large \Name} & \textbf{\href{mailto:\Email}{\Email}} \\
    \Address          & \textbf{Website:} \href{http://\Website}{\Website} \\
    \City             & \textbf{Github:}  \href{http://\Github}{\Github} \\
    \Phone            & \textbf{LinkedIn:} \href{http://\Linkedin}{\Linkedin} \\
  \end{tabular*}

  \vspace{0.5em}
  \hspace{2mm}\rule{0.92\textwidth}{0.4pt}
  \vspace{1em}
}

\newcommand{\ResumeHeaderReduced}{
  \begin{tabular*}{7in}{l@{\extracolsep{\fill}}r}
    \textbf{\large \Name} & \textbf{\href{mailto:\Email}{\Email}} \\
  \end{tabular*}

  \vspace{-0.5em}
  \hspace{2mm}\rule{0.92\textwidth}{0.4pt} 
  \vspace{1em}
}

% ------------------------------------------------------------------------------
% Environments
\newenvironment{resumesection}[1]{
  \tabular{ p{0.1\textwidth} p{0.8\textwidth} }
    \sectiontitle{#1} & \tabular[t]{p{0.75\textwidth}}
}{
    \endtabular \\
    \vspace{1em} \\
  \endtabular
}

\newenvironment{workplace}[2]{
  \blocktitle{#1}{#2}
}{
  \vspace{1em} \\
}

\newenvironment{project}[2]{
  \blocktitle{#1}
  \blocksubtitle{#2}
}{
  \vspace{1em} \\
}

% ------------------------------------------------------------------------------
% Commands
\DeclareDocumentCommand\blocktitle{ m g }{
  \textbf{#1} \IfNoValueF{#2}{\hfill \textbf{#2}} \\
}

\DeclareDocumentCommand\blocksubtitle{ m g }{
  \textsl{#1} \IfNoValueF{#2}{\hfill \textsl{#2}} \\
}

\newcommand{\sectiontitle}[1]{
  \textsc{\small\smash[b]{\tabular[t]{@{}c@{}}#1\endtabular}}
}
\newcommand{\blocktext}[1]{#1 \\}
\newcommand{\explist}[2]{\textbf{#1:} #2 \\}
\newcommand{\quicklist}[2]{\textsl{#1: #2} \\}

\newcommand{\university}[2]{\blocktitle{#1}{#2}}
\newcommand{\degree}[2]{\quicklist{#1}{#2}}
\newcommand{\workposition}[2]{\blocksubtitle{#1}{#2}\vspace{-0.6em}}
\newcommand{\worktask}[1]{\minipage[t]{0.97\linewidth} \itemize \item #1 \enditemize \endminipage \\}
\newcommand{\projectname}[1]{\blocktitle{#1}}
\newcommand{\projecttype}[1]{\blocksubtitle{#1}}
\newcommand{\projectdesc}[1]{\blocktext{#1}}
