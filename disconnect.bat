@echo off
setlocal EnableDelayedExpansion

echo ZeroTier auto disconnect
echo -----------------------------------------

rem Get Connected Network Id / Name
:GETNWID
set nwid="-",
for /f "tokens=1,2" %%i in ('zerotier-cli -j listnetworks') do (
    if "%%i"==""nwid":" set nwid=%%j
)
set nwid=%nwid:~1,-2%
if %nwid%==- (
    echo All zerotier networks are disconnected
    exit /b 0
) else (
    echo Connected to %nwid%
)

:LEAVE
for /f "tokens=1,2-3" %%i in ('zerotier-cli leave %nwid%') do (
    if "%%i"=="200" (
        echo zerotier networks are successful disconnected
        timeout /t 2
    ) else (
        echo Auto Disconnect Error, Please do manual leave
        pause
    )
)

exit /b 0
