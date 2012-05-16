% brookes-assignment.cls
% By William Hart, 2012
%
% Based on interlake-assignment.cls ---
% Copyright 2009 Ankur Dave <ankurdave@gmail.com>
% See http://ankurdave.com/tex for more document classes.
%
% Licensed under the CC-GNU GPL version 2.0 or later.
% See http://creativecommons.org/licenses/GPL/2.0

\ProvidesClass{brookes-assignment}

\LoadClass{article}

% fields that user can set (in addition to title, author, etc)
\makeatletter
	\newcommand{\studentnumber}[1]{\def \@studentnumber{#1}}
	\newcommand{\module}[1]{\def \@module {#1}}
	\newcommand{\subtitle}[1]{\def \@subtitle {#1}}
	\newcommand{\wordcount}[1]{\def \@wordcount {#1}}
	\newcommand{\assignmentname}[1]{\def \@assignmentname {#1}}
	\newcommand{\executivesummary}[1]{\def \@executivesummary {#1}}
	\newcommand{\studentname}[1]{\def \@studentname {#1}}
	
	\studentnumber{}
	\subtitle{}
	\module{}
	\wordcount{}
	\assignmentname{}
	\executivesummary{}
	\studentname{}
	
	% redefine the author command
	\renewcommand{\author}[1]{\studentname{#1}}
\makeatother

% margins
\usepackage[top=0.75in,bottom=0.75in,left=1in,right=1in]{geometry}

% fonts
\renewcommand{\familydefault}{cmss}

% alignment
% (must be before indentation because raggedright clears parindent)
\raggedright

% indentation
\usepackage{indentfirst}
\setlength{\parindent}{25pt}
\setlength{\parskip}{3pt}

% spacing
\usepackage{setspace}

% references
\usepackage{varioref}

% figures
\usepackage[pdftex]{graphicx}

% maths
\usepackage{amsmath}

% headers and footers
\usepackage{fancyhdr}
\pagestyle{fancy}

% redefine header
\fancyhf{}
\makeatletter
	\newcommand{\customheader}{%
		\ifx\@assignmentname\@empty\relax\else\@assignmentname{} --- \fi 
		 \@studentname, \ifx\@studentnumber\@empty\relax\else\@studentnumber\fi 
	}%
	\newcommand{\customfooter}{%
		\thepage
	}%
\makeatother
\chead[\customheader]{\customheader}
\cfoot[\customfooter]{\customfooter}

% title
\makeatletter
\def \@maketitle {%

	%\noindent \rule{\textwidth}{0.5mm}
	\vspace{1mm}
	
	\noindent \begin{minipage}{0.49\textwidth}
		\begin{flushleft}
			\@studentname, \@studentnumber \\
			\ifx \@module \@empty \relax \else
				\emph{\@module} \\
			\fi
			\ifx \@assignmentname \@empty \relax \else
				\emph{\@assignmentname} \\
			\fi
		\end{flushleft}
	\end{minipage}
	\noindent \begin{minipage}{0.49\textwidth}
		\begin{flushright}
			{\LARGE \bf{\@title}} \\[7pt]
			\ifx \@subtitle \@empty \relax \else
				{\@subtitle} \\
			\fi
			\ifx \@wordcount \@empty \relax \else
				Word Count: \@wordcount \\[10mm]
			\fi
		\end{flushright}
	\end{minipage}\\
	\vspace{0.5cm}
	\ifx \@executivesummary \@empty \relax \else
		\vspace{1cm}
		\noindent\rule{\textwidth}{0.1mm}
		\begin{center}
			\textbf{Executive Summary}
		\end{center}
		\@executivesummary \\[5mm]
	\fi
	
	\noindent \rule{\textwidth}{0.1mm}
}
\makeatother

% bibliography command
\newcommand{\makebibliography}[2]{%
	\ifx #2 \@empty \relax \else
		\nocite{*}
	\fi
	\bibliographystyle{plain}
	\bibliography{#1}
}
\makeatother


% load the microtype library to make text nicer
% must be included after all fonts
\usepackage{microtype}