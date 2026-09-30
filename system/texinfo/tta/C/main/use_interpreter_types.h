/* use_interpreter_types.h - types for interpreter use */
#ifndef USE_INTEPRETER_TYPES_H
#define USE_INTEPRETER_TYPES_H
/* Copyright 2025-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>. */

enum interpreter_use {
   txi_interpreter_use_none = -1,
   txi_interpreter_use_no_interpreter,
   txi_interpreter_use_embedded,
   txi_interpreter_use_interpreter,
};

#endif
