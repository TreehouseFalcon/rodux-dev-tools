# Contributing Guide

This guide covers everything you need to know about contributing to the project.

## Getting started

To get started, you will need to have a few tools set up on your computer. You will need to have [git](https://git-scm.com/) installed, as well as [npm](https://www.npmjs.com/).

## Script runner

There's a few scripts that are used to lint or format the code. To run these scripts, you will need to have [Just](https://github.com/casey/just) installed on your computer.

## Pre-commit tools

This project uses a tool called `husky` to run scripts before and after commits. This is to ensure that the code is formatted correctly and will be able to run properly before a commit is made. Husky will use `lint-staged` to run scripts on files that are staged for commit. To install both of these tools, make sure you have npm installed on your computer and run `npm install` in the root directory of the project. At this point, Husky should configure itself and will lint & format code on each commit. To bypass this behavior, use the `git commit --no-verify` flag. Keep in mind that you will need to resolve any CI issues before your PR can be merged.

## Aftman

This project also uses [Aftman](https://github.com/LPGhatguy/aftman) to handle some of the tool installations. Run `aftman install` to install the tools needed for this project.

## Wally

To install the project's library dependencies, run `wally install` in the root directory of the project.

## Extensions

There's some recommended extensions in `.vscode/extensions.json`. These are not required, but are recommended.

---

By this point, everything should be working!
