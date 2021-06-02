------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                          A D A . T E X T _ I O                           --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--          Copyright (C) 1992-2021, Free Software Foundation, Inc.         --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

--  Note: this package is not compliant with the one defined in the Ada
--  Reference Manual. It is a stripped down version for ZFP and bare-board
--  runtimes.

with GNAT.IO;

package body Ada.Text_IO is

   procedure Get (C : out Character)
   is
   begin
      GNAT.IO.Get (C);
   end Get;

   procedure Put (Item : Character)
   is
   begin
      GNAT.IO.Put (Item);
   end Put;

   procedure Put (Item : String)
   is
   begin
      GNAT.IO.Put (Item);
   end Put;

   procedure Put_Line (Item : String)
   is
   begin
      GNAT.IO.Put_Line (Item);
   end Put_Line;

   procedure New_Line
   is
   begin
      GNAT.IO.New_Line;
   end New_Line;

end Ada.Text_IO;
