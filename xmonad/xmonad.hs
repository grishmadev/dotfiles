import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.ThreeColumns

-- Constants
browser = "librewolf"

myLayoutHook = mkToggle (single NBFULL) $ avoidStruts $ spacingWithEdge 3 $ layoutHook def

myXmobarPP :: PP
myXmobarPP = def
    { ppCurrent = xmobarColor "#0db9d7" ""
    , ppHidden = xmobarColor "#a9b1d6" ""
    , ppHiddenNoWindows = xmobarColor "#444b6a" ""
    }

myStatusBar = statusBarProp "xmobar" (pure myXmobarPP)

myKeys =
    [ ("M-<Return>", spawn "kitty")
    , ("M-d", spawn "rofi -show drun")
    , ("M-f", sendMessage (Toggle NBFULL))
    , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
    , ("M-S-d", spawn "dmenu_run")
    , ("M-S-b", spawn browser)
    , ("M-S-s", spawn "maim $HOME/Pictures/Screenshots/SS_$(date +%Y%m%d%H%M%S.png) && notify-send \"Screenshot captured\"")
    , ("M-S-q", kill)
    ]

main = xmonad $ ewmhFullscreen $ ewmh $ withEasySB myStatusBar defToggleStrutsKey $ def
    { modMask = mod4Mask
    , borderWidth = 3
    , normalBorderColor = "#444b6a"
    , focusedBorderColor = "#ad8ee6"
    , layoutHook = myLayoutHook
    }
    `additionalKeysP` myKeys
