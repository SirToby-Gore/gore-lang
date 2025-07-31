# exits on error
$ErrorActionPreference = 'Stop'

. "./vars.ps1"

Write-Host "this program requires administrative privileges to:" -ForegroundColor Yellow
Write-Host "  - make the gore lang directory" -ForegroundColor Yellow
Write-Host "  - move items into the directory" -ForegroundColor Yellow
Write-Host "  - change ownership of the directory" -ForegroundColor Yellow
Write-Host "  - move the binary into its final location within the program folder" -ForegroundColor Yellow

# checks for admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script requires administrative privileges to perform the installation." -ForegroundColor Red
    Write-Host "Attempting to re-launch as Administrator..." -ForegroundColor Yellow

    # Get the path of the current script
    $scriptPath = $MyInvocation.MyCommand.Path

    # Re-launch PowerShell with administrative privileges
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-File `"$scriptPath`""

    # Exit the current non-elevated script instance
    Exit
}

Write-Host "`nStarting" -ForegroundColor Green

Write-Host "making the gore lang directory: $installDir" -ForegroundColor Cyan
New-Item -ItemType Directory -Path $installDir -Force 

Write-Host "moving the files into the gore lang directory" -ForegroundColor Cyan
Get-ChildItem -Path (Get-Location) | Where-Object { $_.PSIsContainer -or $_.Name -notmatch "^\." } | ForEach-Object {
    Write-Host "  Moving $($_.Name)..." -ForegroundColor DarkCyan
    Move-Item -Path $_.FullName -Destination $installDir -Force
}
Get-ChildItem -Path (Get-Location) -Force -Hidden | Where-Object { $_.Name -match "^\." -and $_.Name -ne "." -and $_.Name -ne ".." } | ForEach-Object {
    Write-Host "  Moving $($_.Name)..." -ForegroundColor DarkCyan
    Move-Item -Path $_.FullName -Destination $installDir -Force
}

Write-Host "changing to $(Split-Path $installDir -Parent)" -ForegroundColor Cyan
# Mimics 'cd /usr/lib'
Set-Location -Path (Split-Path $installDir -Parent)

Write-Host "going into the gore lang dir: $installDir" -ForegroundColor Cyan
Set-Location -Path $installDir

Write-Host "going into the packages sub dir" -ForegroundColor Cyan
Set-Location -Path (Join-Path $installDir "packages")

Write-Host "building the packages" -ForegroundColor Green
& python.exe .\build_packages.py

Write-Host "changing back to $installDir" -ForegroundColor Cyan
Set-Location -Path $installDir

Write-Host "building the binary" -ForegroundColor Green
& ./build_gore_lang.ps1

Write-Host "`nDone" -ForegroundColor Green
