---
title: Notes of Vim Operations
date: 2017-08-25
tags:
---

&nbsp;

<!-- more -->

## help

| &nbsp;          | &nbsp;                       |
| --------------- | ---------------------------- |
| `:h` or `:help` | help                         |
| `:h x`          | help for command `x`         |
| `:h 'number'`   | help for option `number`     |
| `:h E37`        | help for error message 'E37' |

---

## modes

| &nbsp;      | &nbsp;  |
| ----------- | ------- |
| normal mode | `<esc>` |
| insert mode | `i`     |
| visual mode | `v`     |

---

## scroll

| &nbsp;   | &nbsp;                         |
| -------- | ------------------------------ |
| `ctrl-d` | scroll downwards half a window |
| `ctrl-u` | scroll upwards half a window   |

## undo

| &nbsp;   | &nbsp; |
| -------- | ------ |
| `u`      | undo   |
| `ctrl-r` | redo   |

## motion

| &nbsp;   | &nbsp;                             |
| -------- | ---------------------------------- |
| `h`      | ←                                  |
| `j`      | ↓                                  |
| `k`      | ↑                                  |
| `l`      | →                                  |
| `w`      | words forward                      |
| `b`      | words backward                     |
| `e`      | to end of word                     |
| `0`      | to begin of line                   |
| `$`      | to end of line                     |
| `gg`     | to first line                      |
| `G`      | to last line                       |
| `:5`     | to 5th line                        |
| `%`      | to matched pair                    |
| `fx`     | to next occurrence of char 'x'     |
| `Fx`     | to previous occurrence of char 'x' |
| `ctrl-o` | to older position                  |
| `ctrl-i` | to newer position                  |

## insert

| &nbsp; | &nbsp;                  |
| ------ | ----------------------- |
| `i`    | insert                  |
| `I`    | insert at begin of line |
| `a`    | append                  |
| `A`    | append at end of line   |
| `o`    | new line below          |
| `O`    | new line above          |

## pattern

| &nbsp;     | &nbsp;                   |
| ---------- | ------------------------ |
| `/pattern` | search forward           |
| `?pattern` | search backward          |
| `*`        | search forward for word  |
| `#`        | search backward for word |
| `n`        | next                     |
| `N`        | previous                 |
| `:noh`     | stop highlighting        |

## change

### delete

| &nbsp;             | &nbsp;                |
| ------------------ | --------------------- |
| `x` or `dl`        | delete char           |
| `dd`               | delete line           |
| `daw`              | delete a word         |
| `d` in visual mode | delete selected chars |
| `:1,5 d`           | delete lines 1 - 5    |

### copy

| &nbsp;             | &nbsp;                           |
| ------------------ | -------------------------------- |
| `yy`               | yank line                        |
| `y` in visual mode | yank selected chars              |
| `:1,5 co 6`        | copy lines 1 - 5 to below line 6 |

### replace

| &nbsp;          | &nbsp;                |
| --------------- | --------------------- |
| `rx`            | replace char with 'x' |
| `:s/old/new/`   | substitute            |
| `:%s/old/new/g` | substitute all        |

### put

| &nbsp;     | &nbsp;                           |
| ---------- | -------------------------------- |
| `p`        | put                              |
| `:1,5 m 6` | move lines 1 - 5 to below line 6 |

## editing

| &nbsp;           | &nbsp;                     |
| ---------------- | -------------------------- |
| `ZZ` or `:x`     | write if modified and exit |
| `ZQ` or `:q!`    | quit without writing       |
| `:w [file]`      | write                      |
| `:r [file]`      | read and insert            |
| `:e!`            | re-edit                    |
| `:f` or `ctrl-g` | print file status          |
| `g ctrl-g`       | print word count           |

## windows

| &nbsp;           | &nbsp;                  |
| ---------------- | ----------------------- |
| `:split [file]`  | split window            |
| `:vsplit [file]` | split window vertically |
| `:close`         | close window            |
| `:only`          | close all other windows |
| `ctrl-w w`       | move to next window     |

## repeat

| &nbsp; | &nbsp;         |
| ------ | -------------- |
| `5x`   | do `x` 5 times |

## macros

| &nbsp;     | &nbsp;                  |
| ---------- | ----------------------- |
| `qx ... q` | record macro named 'x'  |
| `@x`       | execute macro named 'x' |

## shell

| &nbsp; | &nbsp;                  |
| ------ | ----------------------- |
| `:!ls` | execute `ls` with shell |

## auto-complete

| &nbsp;   | &nbsp;             |
| -------- | ------------------ |
| `ctrl-d` | list matched names |
| `<tab>`  | complete           |

---
