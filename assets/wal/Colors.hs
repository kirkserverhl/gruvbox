--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/home/kirk/wallpaper/default.jpg"

-- Special
background="#151311"
foreground="#c4c4c3"
cursor="#c4c4c3"

-- Colors
color0="#151311"
color1="#926E5F"
color2="#D7724A"
color3="#CD6B52"
color4="#798672"
color5="#999273"
color6="#DAB071"
color7="#c4c4c3"
color8="#6f645a"
color9="#926E5F"
color10="#D7724A"
color11="#CD6B52"
color12="#798672"
color13="#999273"
color14="#DAB071"
color15="#c4c4c3"
