import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.Cursor (setDefaultCursor)
import XMonad.Layout.Spacing
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier (magnifiercz')
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks (ToggleStruts(..))
import XMonad.Hooks.EwmhDesktops
import Data.List (isInfixOf)

-- Constants
browser :: String
browser = "librewolf"
term :: String
term = "kitty"

-- Tokyo Night palette
colFgDark, colFg, colMuted, colGutter, colBlue, colPurple, colRed :: String
colFgDark = "#a9b1d6"
colFg     = "#c0caf5"
colMuted  = "#565f89"
colGutter = "#3b4261"
colBlue   = "#7aa2f7"
colPurple = "#bb9af7"
colRed    = "#f7768e"

-- Layouts
myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1
    ratio    = 1/2
    delta    = 3/100

-- withEasySB below already adds avoidStruts, so it is not needed here
myLayoutHook = mkToggle (single NBFULL) $ spacingWithEdge 3 $ myLayout

-- Bar: short layout name for the status bar
layoutName :: String -> String
layoutName l
    | "Mirror"   `isInfixOf` l = "Wide"
    | "ThreeCol" `isInfixOf` l = "3Col"
    | "Full"     `isInfixOf` l = "Full"
    | otherwise                = "Tall"

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = xmobarColor colMuted "" " | "
    , ppCurrent         = xmobarColor colBlue "" . wrap "[" "]"
    , ppHidden          = xmobarColor colFgDark ""
    , ppHiddenNoWindows = xmobarColor colMuted ""
    , ppUrgent          = xmobarColor colRed "" . wrap "!" "!"
    , ppLayout          = xmobarColor colPurple "" . layoutName
    , ppOrder           = \(ws : l : _) -> [ws, l]
    }

myStatusBar = statusBarProp "xmobar" (pure myXmobarPP)

myStartupHook :: X ()
myStartupHook = do
    setDefaultCursor xC_left_ptr
    spawnOnce "picom -b"
    spawnOnce "nitrogen --restore"
    spawnOnce "dunst"

myKeys =
    [ ("M-<Return>", spawn term)
    , ("M-d", spawn "rofi -show drun")
    , ("M-S-d", spawn "dmenu_run")
    , ("M-f", sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts)
    , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
    , ("M-S-b", spawn browser)
    , ("M-S-s", spawn "mkdir -p $HOME/Pictures/Screenshots && maim $HOME/Pictures/Screenshots/SS_$(date +%Y%m%d_%H%M%S).png && notify-send \"Screenshot captured\"")
    , ("M-S-q", kill)
    , ("<XF86MonBrightnessUp>", spawn "brightnessctl set +1%")
    , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 1%-")
    , ("<XF86AudioLowerVolume>", spawn "amixer -q sset Master 3%-")
    , ("<XF86AudioRaiseVolume>", spawn "amixer -q sset Master 3%+")
    , ("M-S-<Space>", spawn "playerctl play-pause")
    , ("M-C-M1-l", spawn "playerctl next")
    , ("M-C-M1-h", spawn "playerctl previous")
    , ("M-C-M1-<Left>", spawn "playerctl position 5-")
    , ("M-C-M1-<Right>", spawn "playerctl position 5+")
    ]

myConfig = def
    { modMask            = mod4Mask
    , terminal           = term
    , borderWidth        = 3
    , normalBorderColor  = colGutter
    , focusedBorderColor = colPurple
    , layoutHook         = myLayoutHook
    , startupHook        = myStartupHook
    }
    `additionalKeysP` myKeys

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB myStatusBar defToggleStrutsKey
     $ myConfig
