%=====================================================
%=== UCLA Working Papers in Linguistics Class File ===
%
% Copyright 2010 Thomas Graf
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{stylish}[2010/10/09 v1.2 Class based on uclawpl v1.2]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                       CHANGELOG                               %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    2011/03/09  v1.2   add option to load subfig
%                          (loading subfig directly breaks the caption fonts)
%                       switched from Avantgarde Book for Sans Serif
%                          back to Charter
%    2010/10/09  v1.1   references now allow for linebreaks
%                       deactivated showkeys for draft option
%                       reimplement typesetting of authors
%                       implemented small capitals for Charter font
%                       drafts are now marked as such in the header
%                       add warning messages for missing packages
%                       switched headers for odd and even pages
%    2010/08/03  v1.0   initial release;
%                       changes from uclawpl:
%                          - no headers
%                          - font-size



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 0. Overall Structure                          %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Essential Packages
% 2. Options
% 3. Load Packages
% 4. Metadata
% 5. Title
% 6. Page Headers
% 7. Layout Tweaks
% 8. User Macros



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 1. Essential Packages                         %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fixltx2e}
\RequirePackage{ifthen}
\RequirePackage{ifpdf}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 2. Options                                    %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define and initiate boolean variables,
% and associate them with option names
\newboolean{Load@BibHarvard}\setboolean{Load@BibHarvard}{false}
\DeclareOption{authoryear}{\setboolean{Load@BibHarvard}{true}\setboolean{Load@BibNumerical}{false}}

\newboolean{Load@BibNumerical}\setboolean{Load@BibNumerical}{false}
\DeclareOption{numerical}{\setboolean{Load@BibHarvard}{false}\setboolean{Load@BibNumerical}{true}}

\newboolean{Load@FontCharter}\setboolean{Load@FontCharter}{false}
\DeclareOption{charter}{\setboolean{Load@FontCharter}{true}\setboolean{Load@FontTimes}{false}}

\newboolean{Load@FontTimes}\setboolean{Load@FontTimes}{false}
\DeclareOption{times}{\setboolean{Load@FontCharter}{false}\setboolean{Load@FontTimes}{true}}

\newboolean{Load@GraphicsTikz}\setboolean{Load@GraphicsTikz}{false}
\DeclareOption{tikz}{\setboolean{Load@GraphicsTikz}{true}}

\newboolean{Load@LingGb5e}\setboolean{Load@LingGb5e}{false}
\DeclareOption{gb5e}{\setboolean{Load@LingGb5e}{true}\setboolean{Load@LingLinguex}{false}}

\newboolean{Load@LingLinguex}\setboolean{Load@LingLinguex}{false}
\DeclareOption{linguex}{\setboolean{Load@LingGb5e}{false},\setboolean{Load@LingLinguex}{true}}

\newboolean{Load@LingQtree}\setboolean{Load@LingQtree}{false}
\DeclareOption{qtree}{\setboolean{Load@LingQtree}{true}\setboolean{Load@LingXyling}{false}}
\DeclareOption{qtree-nocenter}{\setboolean{Load@LingQtree}{true}%
			       \setboolean{Load@LingXyling}{false}%
			       \PassOptionsToPackage{nocenter}{qtree}}

\newboolean{Load@LingTipa}\setboolean{Load@LingTipa}{false}
\DeclareOption{tipa}{\setboolean{Load@LingTipa}{true}}

\newboolean{Load@LingXyling}\setboolean{Load@LingXyling}{false}
\DeclareOption{xyling}{\setboolean{Load@LingQtree}{false}\setboolean{Load@LingXyling}{true}}

\newboolean{Load@MiscShowkeys}\setboolean{Load@MiscShowkeys}{false}
\DeclareOption{showkeys}{\setboolean{Load@MiscShowkeys}{true}}
\DeclareOption{grey-showkeys}{\setboolean{Load@MiscShowkeys}{true}\PassOptionsToPackage{color}{showkeys}}

\newboolean{Load@MiscSubfig}\setboolean{Load@MiscSubfig}{false}
\DeclareOption{subfig}{\setboolean{Load@MiscSubfig}{true}}

\newboolean{Show@AuthorComments}\setboolean{Show@AuthorComments}{false}
\DeclareOption{author-comments}{\setboolean{Show@AuthorComments}{true}}

\newboolean{Show@EditorComments}\setboolean{Show@EditorComments}{false}
\DeclareOption{editor-comments}{\setboolean{Show@EditorComments}{true}}

\newboolean{Show@PersonalComments}\setboolean{Show@PersonalComments}{false}
\DeclareOption{personal-comments}{\setboolean{Show@PersonalComments}{true}}

\newboolean{Show@SectionForTheorem}\setboolean{Show@SectionForTheorem}{false}
\DeclareOption{theorem-subnumbering}{\setboolean{Show@SectionForTheorem}{true}}


% define invalid options
\newcommand{\@OptionError}{\ClassError{uclawpl}
	{Option \CurrentOption cannot be used with uclawpl}
  	}
\DeclareOption{landscape}{\@OptionError}
\DeclareOption{oneside}{\@OptionError}
\DeclareOption{titlepage}{\@OptionError}
\DeclareOption{twocolumn}{\@OptionError}

% define other options (in alphabetical order)
\DeclareOption{black}{\def\WPLColorThemeLinks{black} \def\WPLColorThemeRef{black}}
\DeclareOption{black-links}{\def\WPLColorThemeLinks{black}}
\DeclareOption{black-ref}{\def\WPLColorThemeRef{black}}
\DeclareOption{blue}{\def\WPLColorThemeLinks{blue} \def\WPLColorThemeRef{blue}}
\DeclareOption{blue-links}{\def\WPLColorThemeLinks{blue}}
\DeclareOption{blue-ref}{\def\WPLColorThemeRef{blue}}
\DeclareOption{clubwidow-penalty}{\clubpenalty = 10000
				  \widowpenalty = 10000
				  \displaywidowpenalty = 10000}
\DeclareOption{comments}{\setboolean{Show@AuthorComments}{true}
			 \setboolean{Show@EditorComments}{true}
			 \setboolean{Show@PersonalComments}{true}
			}
\DeclareOption{draft}{\PassOptionsToClass{draft}{article}%
		      \setboolean{Show@AuthorComments}{true}%
		      \setboolean{Show@EditorComments}{true}%
		      \setboolean{Show@PersonalComments}{true}%
% 		      \setboolean{Load@MiscShowkeys}{true}%
		      \PassOptionsToPackage{draft}{graphicx}%
		      \PassOptionsToPackage{draft=true}{hyperref}%
		      \PassOptionsToPackage{draft=true}{microtype}%
		      \newcommand{\@DraftString}{Draft Version}}
\DeclareOption{fleqn}{\PassOptionsToPackage{\CurrentOption}{amsmath}}
\DeclareOption{flush-bottom}{\flushbottom}
\DeclareOption{leqno}{\PassOptionsToPackage{\CurrentOption}{amsmath}}
\DeclareOption{longnamesfirst}{\PassOptionsToPackage{\CurrentOption}{natbib}}
\DeclareOption{no-links}{\PassOptionsToPackage{draft=true}{hyperref}}
\DeclareOption{nonamebreak}{\PassOptionsToPackage{\CurrentOption}{natbib}}
\DeclareOption{notcite}{\PassOptionsToPackage{\CurrentOption}{showkeys}}
\DeclareOption{notref}{\PassOptionsToPackage{\CurrentOption}{showkeys}}
\DeclareOption{manuscript}{\newcommand{\@DraftString}{Draft Version}}
\DeclareOption{ragged-bottom}{\raggedbottom}
\DeclareOption{section-numbers-in-margins}{%
	\def\@seccntformat#1{\protect\makebox[0pt][r]{\csname  the#1\endcsname\quad}}}

% pass undefined options to article-class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% define defaults and initiate
\ExecuteOptions{authoryear,blue,charter,leqno,longnamesfirst,ragged-bottom,section-numbers-in-margins}
\ProcessOptions\relax

\LoadClass[onecolumn,twoside]{article}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 3. Packages                                   %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%================================================
%================ Bibliography ==================
% load natbib with the right settings
\ifthenelse{\boolean{Load@BibNumerical}}{%
	\RequirePackage[numbers,square,sort&compress,sectionbib]{natbib}%
}{}
\ifthenelse{\boolean{Load@BibHarvard}}{%
	\RequirePackage[authoryear]{natbib}%
	\bibpunct[:]{(}{)}{;}{a}{}{,}%
}{}
\bibliographystyle{linquiry2}


%================================================
%================== Fonts =======================
% has to be loaded before microtype
\RequirePackage[utf8]{inputenc}	% not working with ð and þ; use \eth and \thorn instead
\RequirePackage[T1]{fontenc}	% scalable EC fonts

% we load microtype only if the style file is installed and
% the user is using pdfLaTeX; if the package is not installed
% LaTeX prints an error-message to warn the editor
\ifpdf
\IfFileExists{microtype.sty}{\RequirePackage[kerning]{microtype}}{\ClassWarningNoLine{uclawpl}{Package microtype not found. If you are the editor of this submission, make sure microtype is installed!}}
\fi

% load a mathdesign font only if the style file is installed;
% once again LaTeX will print an error message if this is not the case
\IfFileExists{mathdesign.sty}{
	\ifthenelse{\boolean{Load@FontTimes}}{%
		\RequirePackage{mathptmx}
	}{}
	\ifthenelse{\boolean{Load@FontCharter}}{%
		\RequirePackage[bitstream-charter]{mathdesign}% math fonts matched for charter, garamond, times, utopia
		\def\rmdefault{bch}		% non-scaled version of charter for standard font face
		\DeclareMathAlphabet{\mathsc}{T1}{mdbch}{m}{fsc} % enable small capitals in math mode
	}{}
	}
	{\RequirePackage{mathptmx}
    \ifthenelse{\boolean{Load@FontCharter}}{
      \ClassWarningNoLine{uclawpl}{Package mathdesign not found, using mathptmx instead. If you are the editor of this submission, make sure mathdesign is installed!}
   }{}
   }

% charter comes without small capitals for text mode
% so we use the math mode small capitals;
% this is an ugly hack: commands with arguments
% cannot be redefined within IfFileExists,
% so we define a variable instead and then check
% if it has been instantiated;
% if so, we redefine textsc as intended
\IfFileExists{mathdesign.sty}{
   \ifthenelse{\boolean{Load@FontCharter}}{
      \newcommand{\@TextscRedefined}{}
   }{}
}{}
\ifthenelse{\isundefined{\@TextscRedefined}}{}{
   \renewcommand{\textsc}[1]{\ensuremath{\mathsc{#1}}}
}


%================================================
%================ Graphics ======================
% load xcolor with those color sets that are
% compatible with LaTeX as well as pdfLaTeX
\RequirePackage[usenames,svgnames,x11names]{xcolor}

% load the graphicx package with the optimal settings
% for the backend used and declare the appropriate
% graphics extension
\ifpdf
	\usepackage[pdftex]{graphicx}
	\DeclareGraphicsExtensions{.pdf,.png,.jpg,.mps}
\else
	\usepackage[dvips]{graphicx}
	\DeclareGraphicsExtensions{.eps}
\fi

% if tikz is used, it has to be loaded after graphicx
\ifthenelse{\boolean{Load@GraphicsTikz}}{\RequirePackage{tikz}}{}


%================================================
%================ Linguistics ===================
% load qtree without pict2e to be able to
% specify the appropriate backend driver
\ifthenelse{\boolean{Load@LingQtree}}{%
	\RequirePackage[noload]{qtree}%
	%
	\ifpdf%
	\RequirePackage[pdftex]{pict2e}%
	\else%
	\RequirePackage[dvips]{pict2e}%
	\fi%
}{}

\ifthenelse{\boolean{Load@LingTipa}}{\RequirePackage{tipa}}{}
\ifthenelse{\boolean{Load@LingGb5e}}{\RequirePackage{gb5e}}{}
\ifthenelse{\boolean{Load@LingLinguex}}{\RequirePackage{linguex}}


%================================================
%=============== Mathematics ====================
% load packages for advanced math typesetting;
% amsthm must be loaded after amsmath
\RequirePackage{amsmath}
\RequirePackage{amsthm}


%================================================
%================ Misc ==========================
% load several packages that enhance the user experience;
% -- babel manages language-specific typesetting conventions and
%    loads the correct hyphenation patterns
% -- lastpage is used for automatically inserting the last page
%    number in the header of the front page
% -- marginnote allows margin-notes in fragile environments,
%    e.g. footnotes; required for hidden comments
% -- mdwlist adds starred versions of the common list environments
%    with reduced interline spacing
% -- varioref isn't required by uclawpl, but it must be loaded
%    before hyperref, so the users can't do it themselves
% -- xspace is required for the definition of \dash
\RequirePackage[USenglish]{babel}\selectlanguage{USenglish}
\RequirePackage{lastpage}
\usepackage{marginnote}
\RequirePackage{mdwlist}
\ifthenelse{\boolean{Load@MiscSubfig}}{%
   \RequirePackage{subfig}
}{}
\RequirePackage{varioref}
\RequirePackage{xspace}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 4. Metadata                                   %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% first we redefine \title and \author so that we can explicitly refer to
% their short versions, which will be used in the page headers if specified;
% after some tinkering of my own, I copied this code snippet from the
% Semantics & Pragmatics class file
\renewcommand*{\title}[2][]{\gdef\@ShortTitleName{#1}\gdef\@title{#2}}
\renewcommand*{\author}[2][]{\gdef\@ShortAuthorName{#1}\gdef\@author{#2}}

% now we add user commands for the remaining pieces of metadata;
% if unsure about their use, consult the manual
\renewcommand{\abstract}[1]{\newcommand{\@Abstract}{#1}}
\newcommand{\article}[1]{\newcommand{\@ArticleNumber}{#1}}
\newcommand{\copyrightname}[1]{\newcommand{\@CopyrightAuthorName}{#1}}
\newcommand{\keywords}[1]{\newcommand{\@KeywordsList}{#1}}
\newcommand{\pubyear}[1]{\newcommand{\@PublicationYear}{#1}}
\newcommand{\specialissue}[1]{\newcommand{\@SpecialIssue}{#1}}
\newcommand{\subtitle}[1]{\newcommand{\@SubtitleName}{#1}}
\newcommand{\volume}[1]{\newcommand{\@VolumeNumber}{#1}}

% the \license command is probably of little use;
% if you want to change the license for good, change
% the text in the argument of \@License
\newcommand{\@License}{This is an open-access article distributed under the terms of a Creative Commons Non-Commercial License (\protect\url{http://creativecommons.org/licenses/by-nc/3.0/}).}
\newcommand{\license}[1]{\gdef\@License{#1}}

% hyperref must be loaded as late as possible, so we put it
% into the argument of \AtEndOfClass;
% if the user runs pdfLaTeX, load hyperxmp for xmp-metadata and
% hyperref for clickable links and references as well as pdf-metadata;
% see the hyperref manual for detailed explanations of the options;
% the colors can be changed in the layout section later on;
% NEVER REMOVE THE pdftex OPTION!
\AtEndOfClass{
	\ifpdf
	\IfFileExists{hyperxmp.sty}{\RequirePackage{hyperxmp}}{\ClassWarningNoLine{uclawpl}{Package hyperxmp not found. If you are the editor of this submission, make sure hyperxmp is installed!}}
	\RequirePackage[pdftex,%
				backref=false,%		add link to section of citation to each item in bibliography
				bookmarks=true,%	show bookmarks?
				bookmarksnumbered=true,% show section numbers in bookmarks panel
				bookmarksopen=true,%	show bookmarks when PDF is opened
				breaklinks=true,%	allow link texts to break across lines
				colorlinks=true,%	false: boxed links; true: colored links
				pagebackref=false,%	add link to page of citation to each item in bibliography
				pageanchor=true,%	if set to false, the TOC will have no links
				pdftoolbar=true,%	show Acrobat’s toolbar?
				pdfmenubar=true,%	show Acrobat’s menu?
				pdffitwindow=true,%	page fit to window when opened
				pdfnewwindow=true,%	links in new window
				unicode=true,%		non-Latin characters in Acrobat’s bookmarks
				linkcolor=WPLintlinkcolor,%	color of internal links
				citecolor=WPLcitecolor,%	color of links to bibliography
				filecolor=WPLfilecolor,%	color of file links
				urlcolor=WPLurlcolor%		color of external links
			]{hyperref}%
	%
	% as hyperref links to captions, it takes you to the bottom of tables and figures;
	% in order to fix this problem, the hypcap package redefines table, table*, figure, and figure*
	% such that their caption is at the top;
	% CAUTION: This means it will clash with any package that redefines \caption or \@caption
	\IfFileExists{hypcap.sty}{\RequirePackage[all]{hypcap}}{\ClassWarningNoLine{uclawpl}{Package hypcap not found. If you are the editor of this submission, make sure hypcap is installed!}}
	%
	\else
	% if you're not running pdfLaTeX,
	% load the url-package instead and redefine \href for hyperlinks
	\RequirePackage{url}
	\newcommand{\href}[2]{#2}
	\fi

	\newcommand{\email}[1]{\href{mailto:#1}{#1}}
}

\AtEndOfClass{
	\def\@pdfauthor{\relax}
	\newcommand{\pdfauthor}[1]{\gdef\@pdfauthor{#1}}
	\def\@pdftitle{\relax}
	\newcommand{\pdftitle}[1]{\gdef\@pdftitle{#1}}
	\def\@pdfkeywords{\relax}
	\newcommand{\pdfkeywords}[1]{\gdef\@pdfkeywords{#1}}

	\ifpdf
	\hypersetup{pdfauthor=\@pdfauthor,
               pdftitle=\@pdftitle,
            	pdfkeywords=\@pdfkeywords}
        \fi
}

% showkeys must be loaded after hyperref, so we can't load it in section 3
\AtEndOfClass{\ifthenelse{\boolean{Load@MiscShowkeys}}{\RequirePackage{showkeys}}{}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 5. Title                                      %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the title has to be redefined at the end of the class,
% so we put it into the argument of \AtEndOfClass
\AtEndOfClass{
	\renewcommand{\maketitle}{
		\begin{flushright}
			% tell LaTeX to use the plain pagestyle
			% for the first page
			\thispagestyle{plain}
			%
			% insert an invisible dot so that
			% \vskip below can take effect
			\phantom{.}
			\vskip 3em
			%
			%set the title in \Large and bold face
			{\Large\bfseries\@title\\}
			%
			% add some vertical space and insert
			% the subttitle in \large and
			% bold face, if defined;
			% if the subtitle isn't defined,
			% \vskip will take no effect
			{\vskip .5em
				\large\bfseries
				\ifthenelse{\isundefined{\@SubtitleName}}
					{}
					{\@SubtitleName\\}
			}
			%
			% add some vertical white space and
			% insert the author in \large
			\vskip 2em
			{\large
			 \@author
			}
			%
			% again some vertical white space
			% then deactive an indentation and
			% insert the abstract in \small as
			% a separate minipage spanning 75%
			% of the page; shows keywords, if defined
			\vskip 2em
			\noindent
			\begin{minipage}[t]{.75\linewidth}
				\small
				\@Abstract\medskip

				\ifthenelse{\isundefined{\@KeywordsList}}
					{}
					{\footnotesize\textit{Keywords}\quad \@KeywordsList}
			\end{minipage}
			%
			% some more white space to separate
			% the abstract from the main body
			\vskip 4em
		\end{flushright}
	}

	% automatically call \maketitle after \begin{document}
	\AtBeginDocument{\maketitle}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 6. Page headers                               %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fancyhdr must be loaded after geometry in section 7,
% so we push it to the end of the class file by use of \AtEndOfClass
\AtEndOfClass{
\RequirePackage{fancyhdr}

% increase the header height to fit in all the text on the front page;
\addtolength{\headheight}{\baselineskip}

% set some basic parameters of the header layout
\newcommand{\@HeaderFontSize}{\footnotesize}
\newcommand{\@WPLheadrulewidth}{.6pt}

% headers don't have a separating line on a page consisting only of floats,
% else they use the separator defined by \@WPLheadrulewidth above;
% foots never have a separating line
\renewcommand{\headrulewidth}{\iffloatpage{0pt}{\@WPLheadrulewidth}}
\renewcommand{\footrulewidth}{0pt}


% define the page headers for everything but the front page;
% first we remove the standard headers and footers
\fancyhf{}

% now we set the headers for even pages as follows:
% -- the text is left-justified
% -- \iffloatpage{} tells LaTeX that we don't want a
%    header on pages only containing floats
% -- all the text is set in size \@HeaderFontSize,
%    defined above
% -- we first have the page number, then a \quad whitespace
% -- if a short author name is supplied, use it, else show
%    the full author name
\fancyhead[OL]{\iffloatpage{}{\@HeaderFontSize \thepage \quad%
				\ifthenelse{\equal{\@ShortAuthorName}{}}
					{\ifthenelse{\isundefined{\@DraftString}}%
							{\@author}%
							{\@author\ {\color{red} [\@DraftString]}}}
					{\ifthenelse{\isundefined{\@DraftString}}%
							{\@ShortAuthorName}%
							{\@ShortAuthorName\ {\color{red} [\@DraftString]}}}
					{\@ShortAuthorName}}}

% and now we set the headers for odd pages:
% -- the text is right-justified
% -- \iffloatpage{} tells LaTeX that we don't want a
%    header on pages only containing floats
% -- all the text is set in size \@HeaderFontSize,
%    defined aboe
% -- if a short title name is supplied, use it, else show
%    the full author name
% -- after the tile, insert a \quad white space and the page number
\fancyhead[ER]{\iffloatpage{}{\@HeaderFontSize%
				\ifthenelse{\equal{\@ShortTitleName}{}}
					{\ifthenelse{\isundefined{\@DraftString}}%
							{\@title}%
							{{\color{red} [\@DraftString]} \@title}}
					{\ifthenelse{\isundefined{\@DraftString}}%
							{\@ShortTitleName}%
							{{\color{red} [\@DraftString]} \@ShortTitleName}}
				\quad \thepage}}


% define the page headers for the front page
\fancypagestyle{plain}{
	% first we remove the standard header and footer
	\fancyhf{}

	% we don't want any separating lines
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}

	% set the metadata in \@HeaderFontSize;
	% if some value is undefined, substitute a generic value
	\fancyhead[L]{}%
	% the footer is also typeset in \@HeaderFontSize;
	% it contains the copyright and the license
	\fancyfoot[L]{}
}

% use our custom headers instead of the normal ones
\pagestyle{fancy}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 7. Layout Tweaks                              %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[letterpaper,left=1.5in,right=1.5in,top=1.2in,bottom=1in]{geometry}

% this changes the caption font to a different type size;
% unfortunately I don't remember where I got this from,
% but the code is definitely way above my skills
\newcommand{\captionfonts}{\small}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\captionfonts #1: #2}}%
  \ifdim \wd\@tempboxa >\hsize
    {\captionfonts #1: #2\par}
  \else
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% we redefine the \and-command used for multiple authors
% such that a vertically centered dot is inserted between authors
\def\and{$\cdot$\ }

% layout of section headers
% don't forget about the section-numbers-in-margins option
\renewcommand{\section}{\@startsection{section}{1}{\z@}{2em}{1em}{\noindent\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}{2em}{1em}{\noindent\normalsize\itshape}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}{1em}{1pt}{\noindent\normalsize\itshape}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}{1em}{-1em}{\noindent\normalsize\bfseries}}
\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}{1em}{-1em}{\noindent\normalsize\itshape}}

% define the colors used by hyperref and several user macros
\definecolor{WPLblue}{rgb}{0.02.,0.04,0.48}
\ifthenelse{\equal{\WPLColorThemeLinks}{black}}
		{\colorlet{WPLlinkcolor}{black}}
		{\colorlet{WPLlinkcolor}{WPLblue}}
\ifthenelse{\equal{\WPLColorThemeRef}{black}}
		{\colorlet{WPLrefcolor}{black}}
		{\colorlet{WPLrefcolor}{WPLblue}}
\colorlet{WPLintlinkcolor}{WPLrefcolor}
\colorlet{WPLcitecolor}{WPLrefcolor}
\colorlet{WPLfilecolor}{WPLrefcolor}
\colorlet{WPLurlcolor}{WPLlinkcolor}
\colorlet{AuthorComments}{Crimson}
\colorlet{EditorComments}{PaleGreen4}
\colorlet{PersonalComments}{Sienna4}

% define new math environments
% the numbering is specified through option theorem-subnumbering
\theoremstyle{plain}
\ifthenelse{\boolean{Show@SectionForTheorem}}%
	{\newtheorem{theorem}{Theorem}[section]}
	{\newtheorem{theorem}{Theorem}}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{conjecture}[theorem]{Conjecture}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{problem}[theorem]{Problem}

\theoremstyle{remark}
\newtheorem*{remark}{Remark}
\newtheorem*{example}{Example}
\newtheorem{case}{Case}
\newtheorem*{ucase}{Case}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                               %%
%%                 8. User Commands                              %%
%%                                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \is - defines
\newcommand{\is}{\ensuremath{\mathrel{\mathop:}=}}

% \defequal - yet another defines
\newcommand{\defequal}{\ensuremath{\stackrel{\text{\tiny def}}{=}}}

% \setof - set with auto-sized brackets
\newcommand{\setof}[1]{\ensuremath{\left \{ #1 \right \}}}

% \tuple - tuple with auto-sized brackets
\newcommand{\tuple}[1]{\ensuremath{\left \langle #1 \right \rangle }}

% \den - semantic denotation brackets
\newcommand{\den}[1]{\ensuremath{\llbracket \text{#1} \rrbracket}}

% \col - Colon for logic and set notation
% The typed colon ':' has the same spacing as a relation in math mode,
% so instead you should use this command for logic and set notation
\newcommand{\col}{\ensuremath{\colon\thinspace}}

% \tsp & \tsb - shorthands for \textsuperscript and \textsubscript
\newcommand{\tsb}[1]{\textsubscript{#1}}
\newcommand{\tsp}[1]{\textsuperscript{#1}}

% citations - various macros for citations
% I got those from the class stylesheet of the Semantics & Pragmatics Open Publishing Journal;
% see their guide for authors on how to put them to good use
\newcommand{\posscitet}[1]{\citeauthor{#1}'s (\citeyear{#1})}
\newcommand{\possciteauthor}[1]{\citeauthor{#1}'s}
\newcommand{\pgposscitet}[2]{\citeauthor{#1}'s (\citeyear{#1}:~#2)}
\newcommand{\secposscitet}[2]{\citeauthor{#1}'s (\citeyear{#1}:~$\S$#2)}
\newcommand{\pgcitealt}[2]{\citealt{#1}:~#2}
\newcommand{\seccitealt}[2]{\citealt{#1}:~$\S$#2}
\newcommand{\pgcitep}[2]{(\citealt{#1}:~#2)}
\newcommand{\seccitep}[2]{(\citealt{#1}:~$\S$#2)}
\newcommand{\pgcitet}[2]{\citeauthor{#1} (\citeyear{#1}:~#2)}
\newcommand{\seccitet}[2]{\citeauthor{#1} (\citeyear{#1}:~$\S$#2)}

% conditional comments
\setlength{\marginparwidth}{1.2in}
\let\oldmarginpar\marginpar
\renewcommand\marginpar[1]{\-\oldmarginpar%
		[\raggedleft\footnotesize\bfseries #1]%
		{\raggedright\footnotesize\bfseries #1}}

\newcommand{\atoa}[1]{%
	\ifthenelse{\boolean{Show@PersonalComments}}%
		{{\bfseries\color{PersonalComments} \lbrack{#1}\rbrack}}%
		{}%
}
\newcommand{\atoe}[1]{%
	\ifthenelse{\boolean{Show@AuthorComments}}%
		{{\bfseries\color{AuthorComments} \lbrack{#1}\rbrack}}%
		{}%
}
\newcommand{\etoa}[1]{%
	\ifthenelse{\boolean{Show@EditorComments}}%
		{\marginpar{\color{EditorComments} {#1}}}%
		{}%
}

% \dash - long hyphen (---) with better spacing
% another command which I got from the class stylesheet of
% the Semantics & Pragmatics Open Publishing Journal;
\AtEndOfClass{
	\ifpdf
	\DeclareRobustCommand\dash{%
		\unskip\nobreak\thinspace\textemdash\thinspace\ignorespaces}
		\pdfstringdefDisableCommands{\renewcommand{\dash}{ - }}
	\else
	\newcommand{\dash}{---\xspace}
	\fi
}