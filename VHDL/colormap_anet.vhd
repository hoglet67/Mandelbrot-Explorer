
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity colormap_anet is
   port(
      clk: in std_logic;
      addr: in std_logic_vector(7 downto 0);
      data: out std_logic_vector(11 downto 0)
   );
end colormap_anet;

architecture arch of colormap_anet is
   constant ADDR_WIDTH: integer:=8;
   constant DATA_WIDTH: integer:=12;
   type rom_type is array (0 to 2**ADDR_WIDTH-1)
        of std_logic_vector(DATA_WIDTH-1 downto 0);
   -- ROM definition
   constant colormap: rom_type:=(  -- 2^4-by-12
      x"000",
      x"867",
      x"867",
      x"977",
      x"977",
      x"976",
      x"976",
      x"976",
      x"976",
      x"986",
      x"986",
      x"a86",
      x"a86",
      x"a86",
      x"a96",
      x"a96",
      x"a96",
      x"a96",
      x"a96",
      x"a96",
      x"ba6",
      x"ba5",
      x"ba5",
      x"ba5",
      x"ba5",
      x"bb5",
      x"bb5",
      x"bb5",
      x"cb5",
      x"cb5",
      x"cc5",
      x"cc5",
      x"cc5",
      x"cc5",
      x"cc5",
      x"cc5",
      x"cd5",
      x"dd4",
      x"dd4",
      x"dd4",
      x"dd4",
      x"de4",
      x"ff0",
      x"ff9",
      x"ff5",
      x"ee4",
      x"de4",
      x"de4",
      x"dd4",
      x"dd4",
      x"cc4",
      x"cc4",
      x"cc4",
      x"cb4",
      x"bb4",
      x"ba4",
      x"ba4",
      x"b94",
      x"a94",
      x"a94",
      x"a84",
      x"984",
      x"974",
      x"974",
      x"974",
      x"864",
      x"864",
      x"854",
      x"854",
      x"745",
      x"745",
      x"745",
      x"735",
      x"635",
      x"625",
      x"625",
      x"515",
      x"515",
      x"625",
      x"625",
      x"626",
      x"626",
      x"626",
      x"736",
      x"737",
      x"737",
      x"737",
      x"737",
      x"848",
      x"848",
      x"848",
      x"848",
      x"859",
      x"959",
      x"959",
      x"959",
      x"959",
      x"96a",
      x"a6a",
      x"a6a",
      x"a6a",
      x"a6b",
      x"a7b",
      x"b7b",
      x"b7b",
      x"b7c",
      x"b7c",
      x"b8c",
      x"c8c",
      x"c8d",
      x"c8d",
      x"c8d",
      x"c9d",
      x"d9e",
      x"d9e",
      x"d9e",
      x"d9d",
      x"d9d",
      x"d9d",
      x"d9d",
      x"c67",
      x"c57",
      x"c58",
      x"c58",
      x"c58",
      x"d58",
      x"d58",
      x"d48",
      x"d48",
      x"d48",
      x"d49",
      x"e49",
      x"e49",
      x"e39",
      x"e39",
      x"e39",
      x"f39",
      x"f39",
      x"f3a",
      x"f2a",
      x"f2a",
      x"f2a",
      x"e3a",
      x"d3a",
      x"d3a",
      x"c4a",
      x"b4a",
      x"a5a",
      x"a5a",
      x"95a",
      x"86a",
      x"86b",
      x"76b",
      x"67b",
      x"57b",
      x"57b",
      x"48b",
      x"38b",
      x"39b",
      x"29b",
      x"19b",
      x"0ab",
      x"0ab",
      x"28c",
      x"46d",
      x"64d",
      x"92e",
      x"92e",
      x"92e",
      x"92e",
      x"93d",
      x"93d",
      x"93d",
      x"83d",
      x"84d",
      x"84c",
      x"84c",
      x"84c",
      x"85c",
      x"85b",
      x"85b",
      x"85b",
      x"86b",
      x"86b",
      x"86a",
      x"77a",
      x"77a",
      x"77a",
      x"77a",
      x"789",
      x"789",
      x"789",
      x"789",
      x"799",
      x"798",
      x"798",
      x"798",
      x"7a8",
      x"6a7",
      x"6a7",
      x"6b7",
      x"6b7",
      x"6b7",
      x"6b6",
      x"6c6",
      x"6c6",
      x"6c6",
      x"6c6",
      x"6d5",
      x"6d5",
      x"5d5",
      x"5d5",
      x"5e4",
      x"5e4",
      x"5e4",
      x"5e4",
      x"5e4",
      x"5e4",
      x"5e4",
      x"5e4",
      x"5e4",
      x"5e4",
      x"5e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"4e4",
      x"3e4",
      x"3e4",
      x"3e4",
      x"3e4",
      x"3e4",
      x"3e4",
      x"3e4",
      x"3e4",
      x"3e3",
      x"3e3",
      x"3e3",
      x"3e3",
      x"2e3",
      x"2e3",
      x"2e3",
      x"2e3",
      x"2e3",
      x"2e3",
      x"2e3",
      x"867"
   );
   signal addr_reg: std_logic_vector(ADDR_WIDTH-1 downto 0);
begin
   -- addr register to infer block RAM
   process (clk)
   begin
      if (clk'event and clk = '1') then
        addr_reg <= addr;
      end if;
   end process;
   data <= colormap(to_integer(unsigned(addr_reg)));
end arch;