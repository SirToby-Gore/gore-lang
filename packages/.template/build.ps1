\$packageName = \"$1\"
\$outputDll = \"lib_\$packageName.dll\"
\$sourceFile = \"\$packageName.cpp\"

Write-Host \"Compiling \$sourceFile for Windows...\"

cl.exe /LD /EHsc /Fe:\$outputDll /D ${PACKAGE_UPPER}_EXPORTS \$sourceFile

if (\$LASTEXITCODE -ne 0) {
    Write-Error \"DLL compilation failed for \$packageName.\"
    exit 1
}

Write-Host \"Successfully built \$outputDll\"