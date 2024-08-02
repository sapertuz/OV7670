library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package OV7670_utils is
  function get_image_width(resolution : string) return integer;
  function get_image_height(resolution : string) return integer;
end package OV7670_utils;

package body OV7670_utils is
  function get_image_width(resolution : string) return integer is
  begin
    if resolution = "VGA" then
      return 640;
    elsif resolution = "CIF" then
      return 352;
    elsif resolution = "qCIF" then
      return 176;
    else
      return 0; -- default or error value
    end if;
  end function get_image_width;
  
  function get_image_height(resolution : string) return integer is
  begin
    if resolution = "VGA" then
      return 480;
    elsif resolution = "CIF" then
      return 288;
    elsif resolution = "qCIF" then
      return 144;
    else
      return 0; -- default or error value
    end if;
  end function get_image_height;
  
end package body OV7670_utils;