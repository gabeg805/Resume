\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myresume}

% Set document class
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

% Header
\newcommand{\ResumeHeader}{
  \begin{tabular*}{7in}{l@{\extracolsep{\fill}}r}
    \textbf{\Large \Name} & \textbf{\href{mailto:\Email}{\Email}} \\
    \Address              & \textbf{Website:} \href{http://\Website}{\Website} \\
    \City                 & \textbf{Github:}  \href{http://\Github}{\Github} \\
    \Phone                & \textbf{LinkedIn:} \href{http://\Linkedin}{\Linkedin} \\
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

% Environments
\newenvironment{ResumeSection}[1]{
  \begin{tabular}{ p{0.1\textwidth} p{0.8\textwidth} }
    \SectionTitle{\SectionTitleStack{#1}}
}{
  \SectionEnd
  \end{tabular}
}

\newenvironment{WorkItemize}{
  \begin{minipage}[t]{0.97\linewidth}
    \begin{itemize}[parsep=0.125em]
}{
    \end{itemize}
  \end{minipage}
}

\DeclareDocumentCommand\sectiontitle{ m g }{
  & \textbf{#1} \IfNoValueF{#2}{\hfill \textbf{#2}} \\
}

\DeclareDocumentCommand\sectionsubtitle{ m g }{
  & \textsl{#1} \IfNoValueF{#2}{\hfill \textsl{#2}} \\
}

\newcommand{\sectiontext}[1]{ & #1 \\}
\newcommand{\explist}[2]{     & \textbf{#1:} #2 \\}
\newcommand{\quicklist}[2]{   & \textsl{#1: #2} \\}

\newcommand{\university}[2]{\sectiontitle{#1}{#2}}
\newcommand{\degree}[2]{\quicklist{#1}{#2}}
\newcommand{\workplace}[2]{\sectiontitle{#1}{#2}}
\newcommand{\workposition}[2]{\sectionsubtitle{#1}{#2}}
\newcommand{\worktask}[1]{ & \begin{WorkItemize} \item #1 \end{WorkItemize} \\}
\newcommand{\projectname}[1]{\sectiontitle{#1}}
\newcommand{\projecttype}[1]{\sectionsubtitle{#1}}
\newcommand{\projectdesc}[1]{\sectiontext{#1}}

\newcommand{\subsectionvspace}{\vspace{1em} \\}


% Resume section styling
\newcommand{\FontSize}{10pt}
\newcommand{\SectionTitleStack}[1]{\smash[b]{\begin{tabular}[t]{@{}c@{}}#1\end{tabular}}}
\newcommand{\SectionTitle}[1]{\textsc{\small #1}}
\newcommand{\SectionItem}[1]{   &         #1              \vspace{0.25em} \\}
\newcommand{\SectionItemB}[1]{  & \textbf{#1}             \vspace{0.25em} \\}
\newcommand{\SectionItemI}[1]{  & \textsl{#1}             \vspace{0.25em} \\}
\newcommand{\SectionItemBR}[2]{ & \textbf{#1}         #2  \vspace{0.25em} \\}
\newcommand{\SectionItemBI}[2]{ & \textbf{#1} \textsl{#2} \vspace{0.25em} \\}
\newcommand{\SectionEnd}{\vspace{1em} \\}

% Resume employment styling
\newcommand{\WorkEmployer}[1]{ & \textbf{#1} \hfill}
\newcommand{\WorkLocation}[1]{   \textbf{#1} \vspace{0.25em} \\}
\newcommand{\WorkPosition}[1]{ & \textsl{#1} \hfill}
\newcommand{\WorkDate}[1]{       \textsl{#1} \vspace{0.5em} \\}
\newcommand{\WorkItem}[1]{& \begin{WorkItemize} \item #1 \end{WorkItemize} \\}
