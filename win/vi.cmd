REM Bridge to use wsl vim as editor for Unity
REM External Script Editor Args: "$(File)" "+call cursor($(Line), $(Column))"
wt wsl vi "`wslpath '%~1'`" +%2
