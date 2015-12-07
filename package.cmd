@echo off

mkdir .\build

.\tool\nuget.exe pack .\mysql.nuspec -BasePath .\content -OutputDirectory .\build