@echo off
echo ================================
echo  = AndroidScreenRecorder v1.0 =
echo  =      by @wakanameko2       =
echo ================================
pause

::save
:hozonsaki
cls
echo Please select a location to save files 
set "RootFolder=C:\"
set "Title=ファイルを保存するフォルダを選択してください"
set dialog="about:<script language=vbscript>resizeTo 0,0:Sub window_onload():
set dialog=%dialog%Set Shell=CreateObject("Shell.Application"):
set dialog=%dialog%Set Env=CreateObject("WScript.Shell").Environment("Process"):
set dialog=%dialog%Set Folder=Shell.BrowseForFolder(0, Env("Title"), 1, Env("RootFolder")):
set dialog=%dialog%If Folder Is Nothing Then ret="" Else ret=Folder.Items.Item.Path End If:
set dialog=%dialog%CreateObject("Scripting.FileSystemObject").GetStandardStream(1).Write ret:
set dialog=%dialog%Close:End Sub</script><hta:application caption=no showintaskbar=no />"
set folder=
for /f "delims=" %%p in ('MSHTA.EXE %dialog%') do  set "folder=%%p"
echo selected  folder is : "%folder%"
goto :SLO


::selectoptions
:SLO
cls
echo ScreenRecord:1 ScreenShot:2
set slo=
set /p slo=Enter number and pless enter:
if %slo%==1 goto :Screenshot
if %slo%==2 goto :Screenrec

:Screenshot
adb shell 
