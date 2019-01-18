setlocal

set arch=x86
::this VSCMD_START_DIR is a workaround so VsDevCmd does not change current dir
set "VSCMD_START_DIR=%CD%"
CALL "%VS150COMNTOOLS%\VsDevCmd.bat" -arch=%arch% || exit /b 1

msbuild vmime.sln /p:Configuration=Release || goto :error
msbuild INSTALL.vcxproj /p:Configuration=Release || goto :error

msbuild vmime.sln /p:Configuration=Debug || goto :error
msbuild INSTALL.vcxproj /p:Configuration=Debug || goto :error


echo Succeed
goto :EOF

:error
echo Failed
exit /b %errorlevel%