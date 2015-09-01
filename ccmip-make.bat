setlocal

cd "%CD%\build"

CALL "%VS120COMNTOOLS%\vsvars32.bat" > nul
msbuild vmime.sln /p:Configuration=Release || goto :error
msbuild INSTALL.vcxproj /p:Configuration=Release || goto :error

msbuild vmime.sln /p:Configuration=Debug || goto :error
msbuild INSTALL.vcxproj /p:Configuration=Debug || goto :error


echo Succeed
goto :EOF

:error
echo Failed
exit /b %errorlevel%