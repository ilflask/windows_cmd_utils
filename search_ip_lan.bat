@echo off 
cls 

set inputIp1="";
set /p inputIp1="Enter number 1 (default: 192) - " 
if %inputIp1% == "" (set ip1=192) else (
        set ip1=%inputIp1%)

set inputIp2="";
set /p inputIp2="Enter number 2 (default: 168) - " 
if %inputIp2% == "" (set ip2=168) else (
        set ip2=%inputIp2%)

set inputIp3="";
set /p inputIp3="Enter number 3 (default: 1) - " 
if %inputIp3% == "" (set ip3=1) else (
        set ip3=%inputIp3%)

set inputIp4="";
set /p inputIp4="Enter number 4 (default: 1) - " 
if %inputIp4% == "" (set ip4=1) else (
        set ip4=%inputIp4%)

set ip=%ip1%.%ip2%.%ip3%.%ip4%
set /A ip4Stop=254 - ip4
set /A ip4=ip4+ip4Stop

echo Range scanning ip: %ip% - %ip4%

for /l %%i in (ip4,1,254) do ping -n 1 -w 400 -l 1 %ip1%.%ip2%.%ip3%.%%i | arp -a %ip1%.%ip2%.%ip3%.%%i | findstr %ip1%.%ip2%.%ip3%.%%i