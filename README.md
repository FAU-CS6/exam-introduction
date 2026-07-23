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
\documentclass[aspectratio=169,t]{beamer}

%%%%%%%%%%%%
% Settings %
%%%%%%%%%%%%

% Set the name of the exam (should be short and unique, e.g. EDB, EBTEIS, POIS, KonzMod, ...)
%
\def\exam{KDDmUe}

% Set the duration of the exam in minutes
%
\def\duration{90}

% Optional: Set comma-separated percentage-based time extensions (maximum five
% unique values greater than 0 and at most 100). If defined, the timer counts up
% to the longest extension and replaces attendance/early-hand-in arms with one
% arm per end time.
% The values may be given in any order.
%
%\def\timeExtensionPercentages{20,25,30,50}

% Comment in if the start of the attendance check should be visible in the timer
% Set the time for the start of the attendance check in minutes after the start of the exam 
% (should always be in between 0 and \duration/2). 
%
\def\startAttendanceCheck{5}

% Comment in if the latest time for the early hand-in should be visible in the timer
% Set the latest time for the early hand-in in minutes after the start of the exam 
% (should always be in between \duration/2 and \duration). 
%
\def\latestEarlyHandIn{75}

% Set the number of pages of the exam before using
%
\def\pages{?}

% Comment in if a cheat sheet is allowed. 
% Set to 1 is only one-side of a DIN A4 paper is allowed to be used
% Set to 2 if a double-sided DIN A4 paper may be used.
%
\def\cheatsheetAllowed{1}

% Comment in if an exam inspection link (replace the standard link if necessary) is available
% and the exam inspection is done directly after the grade is published
%
\def\examInspectionLink{https://www.cs6.tf.fau.de/kdd-einsicht}

% Comment in if the language of the exam is german (english is default)
%
%\def\german{1}


%%%%%%%%%%%%%%%%%%%
% Import the code %
%%%%%%%%%%%%%%%%%%%

% Import the presentation
\include{src/presentation}
```
