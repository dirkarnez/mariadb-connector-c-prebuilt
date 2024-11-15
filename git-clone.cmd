@REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

set PREFIX=D:\Softwares
@REM set PREFIX=%USERPROFILE%\Downloads

SET PATH=^
%PREFIX%\PortableGit\bin;^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64;^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin;^
%PREFIX%\cmake-3.29.3-windows-x86_64\bin;

set CD_LINUX=%CD:\=/%
gcc --version &&^
git clone -b v3.4.3 https://github.com/mariadb-corporation/mariadb-connector-c.git &&^
cd mariadb-connector-c &&^
cmake.exe -LH -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Release ^
-DBUILD_SHARED_LIBS=OFF ^
-DCMAKE_INSTALL_PREFIX="cmake-build/cmakeInstallationPath" -B./cmake-build &&^
cd cmake-build && ( cmake --build . --config Release && cmake --install . && cd .. && cmake.exe -LH -G"MinGW Makefiles" -B./cmake-build > "cmake-build\cmakeInstallationPath\cmake-lh-export.txt" || type .\CMakeFiles\CMakeError.log ) &&^
pause




