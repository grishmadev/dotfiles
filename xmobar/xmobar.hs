Config { overrideRedirect = False
       , font = "ZedMono Nerd Font Mono 11"
       , bgColor = "#1a1b26"
       , fgColor = "#a9b1d6"
       , position = TopSize C 100 30
       , border = BottomB
       , borderColor = "#ad8ee6"
       , borderWidth = 2
       , commands =
            [ Run Weather "VEBD"
                [ "--template", "<weather> <tempC>°C"
                , "-L", "15"
                , "-H", "40"
                , "--low"   , "lightblue"
                , "--normal", "#f8f8f2"
                , "--high"  , "red"
                ] 36000
            , Run Cpu
                [ "--template", "CPU <total>%"
                , "-L", "3"
                , "-H", "50"
                , "--low"   , "#9ece6a"
                , "--normal", "#e0af68"
                , "--high"  , "#f7768e"
                , "-p", "3"
                ] 10
            , Run CoreTemp
                [ "--template", "Temp <core0>°C"
                , "-L", "50"
                , "-H", "75"
                , "--low"   , "#9ece6a"
                , "--normal", "#e0af68"
                , "--high"  , "#f7768e"
                ] 50
            , Run Memory
                [ "--template", "Mem <usedratio>%"
                , "-L", "40"
                , "-H", "80"
                , "--low"   , "#9ece6a"
                , "--normal", "#e0af68"
                , "--high"  , "#f7768e"
                , "-p", "3"
                ] 10
            , Run Swap ["--template", "Swap <usedratio>%"] 10
            , Run DiskU [("/", "Disk <used>/<size>")] [] 20
            , Run DiskIO [("/", "IO R <read> W <write>")] [] 10
            , Run Network "wlan0"
                [ "--template", "↓<rx> ↑<tx> KB/s" ] 10
            , Run Alsa "default" "Master"
                [ "--template", "<volumestatus>"
                , "--suffix"  , "True"
                , "--"
                , "--on", ""
                ]
            , Run Battery
                [ "--template", "<acstatus> <left>%"
                , "-L", "20"
                , "-H", "80"
                , "--low"   , "#f7768e"
                , "--normal", "#e0af68"
                , "--high"  , "#9ece6a"
                , "--"
                , "-o", "Bat"
                , "-O", "AC"
                , "-i", "AC"
                ] 50
            , Run Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
            , Run Com "sh"
                [ "-c"
                , "playerctl metadata --format '{{title}}' 2>/dev/null | cut -c1-40"
                ] "media" 20
            , Run XMonadLog
            ]
       , sepChar  = "%"
       , alignSep = "}{"
       , template = "%media% %XMonadLog% }{ %cpu% %coretemp% | %memory% %swap% | %disku% %diskio% | %wlan0% | %alsa:default:Master% | %battery% | %VEBD% | %date% "
       }
