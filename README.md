# Exam Introduction

This repository contains presentations for use before and during an exam. The presentations contain the most important things students should be taught before an exam. In addition, the presentation contains a built-in timer for the exam.

[[_TOC_]]

## Get the presentations as PDF files

With each commit and at the beginning of each month, the latest version of the presentations is built automatically:

[![Download the PDFs here](https://cs6-gitlab.cs6.fau.de/cs6-lehrstuhl/exam-introduction/-/jobs/artifacts/main/raw/pdfs.svg?job=badges)](https://cs6-gitlab.cs6.fau.de/api/v4/projects/423/jobs/artifacts/main/download?job=presentations)

This build includes a "demo" version for each exam, where the exam page count is not specified, and a version for each page count between 10 and 30. For real use, the version with the correct page count should be chosen.

## Reader compatibility 

To use the timer functionality of the presentation, the PDF reader must support JavaScript-driven animations.

Here is a small list of tested compatible/not compatible readers:

### Compatible 

| PDF Reader | Operating System | Tested Version of the PDF Reader |
| ---      | ---      | ---      |
| Adobe Acrobat Pro | Windows 11 Pro | 22.003.20322 |
| Adobe Acrobat Pro | macOS Sonoma 14.2.1 | 23.8.20470.0 |
| Okular | Debian 11 | 20.12.3 |

It can be assumed that the compatible PDF readers are compatible regardless of operating system and version (at least if newer than the tested one). A short test before the exam is nevertheless recommended.

### Not Compatible 

| PDF Reader | Operating System | Tested Version of the PDF Reader |
| ---      | ---      | ---      |
| Google Chrome | Windows 11 Pro | 110.0.5481.178 |

## Settings

For each module with a written exam, a file `exam-introduction-[name of module].tex` should be created. In this file the most important settings for the presentation (name of the exam, duration of the exam, language, etc.) can be specified.

It should look like this:

```latex
% Settings
\def\exam{KDDmUe}
\def\duration{90} % Set the duration of the exam in minutes
\def\pages{?} % Set the number of pages of the exam before using
\def\cheatsheetAllowed{1} % Comment in if a cheat sheet is allowed
			  % Set to 1 if only one-side of a DIN A4 paper is allowed to be used, 
			  % Set to 2 if a double-sided DIN A4 paper may be used
%\def\german{1} % Comment in if the language of the exam is german (english is default)

% Import the presentation
\include{src/presentation}
```


