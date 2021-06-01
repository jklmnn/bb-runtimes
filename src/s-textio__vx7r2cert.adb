------------------------------------------------------------------------------
--                                                                          --
--                         GNAT RUN-TIME COMPONENTS                         --
--                                                                          --
--                        S Y S T E M . T E X T _ I O                       --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
--          Copyright (C) 2011-2021, Free Software Foundation, Inc.         --
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

with Interfaces.C;

package body System.Text_IO is

   Stdin_FD  : constant Interfaces.C.int := 0;
   Stdout_FD : constant Interfaces.C.int := 1;

   procedure Initialize
   is
   begin
      Initialized := True;
   end Initialize;

   function Is_Tx_Ready return Boolean is (True);

   procedure Put (C : Character)
   is
      procedure fdprintf
        (File   : Interfaces.C.int;
         Format : String;
         Value  : Character) with
        Import,
        Convention    => C_Variadic_2,
        External_Name => "fdprintf";
   begin
      fdprintf (Stdout_FD, "%c" & ASCII.NUL, C);
   end Put;

   function Use_Cr_Lf_For_New_Line return Boolean is (False);

   function Is_Rx_Ready return Boolean is (True);

   function Get return Character
   is
      use type Interfaces.C.int;
      function read
        (fd       : Interfaces.C.int;
         buffer   : System.Address;
         maxbytes : Interfaces.C.size_t) return Interfaces.C.int with
        Import,
        Convention    => C,
        External_Name => "read";
      Result : Interfaces.C.int;
      Buffer : Interfaces.C.char;
   begin
      Result := read (Stdin_FD, Buffer'Address, 1);
      pragma Assert (Result = 0);
      return Character (Buffer);
   end Get;

end System.Text_IO;
