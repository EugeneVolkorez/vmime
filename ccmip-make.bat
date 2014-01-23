setlocal

cd "%CD%\build"

CALL "%VS90COMNTOOLS%\vsvars32.bat" > nul
msbuild vmime.sln /p:Configuration=Release || goto :error
msbuild INSTALL.vcproj /p:Configuration=Release || goto :error

msbuild vmime.sln /p:Configuration=Debug || goto :error
msbuild INSTALL.vcproj /p:Configuration=Debug || goto :error


echo Succeed
goto :EOF

:error
echo Failed
exit /b %errorlevel%