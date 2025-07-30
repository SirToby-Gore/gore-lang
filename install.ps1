<#
.SYNOPSIS
    Installs the Gore Language components on a Windows system.

.DESCRIPTION
    This script performs the following actions:
    1. Checks for administrative privileges and re-runs itself as administrator if necessary.
    2. Sets the script to exit immediately on any command error.
    3. Prints messages about required administrative actions.
    4. Defines an installation directory analogous to /usr/lib (C:\ProgramData\gore_lang).
    5. Creates the installation directory.
    6. Moves non-hidden files and directories from the current script location.
    7. Moves hidden files and directories from the current script location.
    8. Navigates to the parent directory of the installation path (C:\ProgramData).
    9. Provides a conceptual note about changing ownership (no direct 1:1 Windows equivalent).
    10. Navigates into the installation directory (gore_lang).
    11. Navigates into the 'packages' sub-directory and executes 'build_packages.py'.
        (Requires Python to be installed and in the system's PATH.)
    12. Navigates back to the main installation directory.
    13. Compiles the 'gore_lang.dart' binary using the Dart SDK.
        (Requires Dart SDK to be installed and in the system's PATH.)
    14. Creates a 'bin' sub-directory within the installation directory.
    15. Moves the compiled 'gore_lang.exe' binary into this new 'bin' sub-directory.
    16. Provides instructions on how to add the 'bin' directory to the system's PATH
        environment variable for global access to the 'gore_lang.exe' command.

.NOTES
    - The 'chown' equivalent is omitted as Windows handles file permissions differently.
    - Requires Python and Dart SDKs to be installed and in the system's PATH.
#>

#region Administrative Privileges Check
# Check if the script is running with administrative privileges.
# If not, it will attempt to re-launch itself as administrator.
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "This script requires administrative privileges to perform the installation." -ForegroundColor Red
    Write-Host "Attempting to re-launch as Administrator..." -ForegroundColor Yellow

    # Get the path of the current script
    $scriptPath = $MyInvocation.MyCommand.Path

    # Re-launch PowerShell with administrative privileges
    Start-Process powershell.exe -Verb RunAs -ArgumentList "-File `"$scriptPath`""
    Exit # Exit the current non-elevated script instance
}
#endregion

#region Error Handling
$ErrorActionPreference = 'Stop' # Mimics 'set -e' - exits on error if any command fails
#endregion

Write-Host "this program requires administrative privileges to:" -ForegroundColor Yellow
Write-Host "  - make the gore lang directory" -ForegroundColor Yellow
Write-Host "  - move items into the directory" -ForegroundColor Yellow
Write-Host "  - change ownership of the directory (conceptually)" -ForegroundColor Yellow
Write-Host "  - move the binary into its final location within the program folder" -ForegroundColor Yellow

Write-Host "`nStarting" -ForegroundColor Green # Mimics 'sudo echo "Starting"'

# Define the installation directory, analogous to /usr/lib on Linux
# C:\ProgramData is a common system-wide application data folder in Windows.
$installDir = "C:\ProgramData\gore_lang"

#region Directory Creation
Write-Host "making the gore lang dir: $installDir" -ForegroundColor Cyan
New-Item -ItemType Directory -Path $installDir -Force # -Force creates if not exists, doesn't error if exists
#endregion

#region File Movement (Mimicking ./* and ./.* separately for one-to-one translation)
Write-Host "moving the files (non-hidden) into the gore lang dir" -ForegroundColor Cyan
# This section mimics `mv ./*`
# It gets all non-hidden items (files and directories) from the current location.
Get-ChildItem -Path (Get-Location) | Where-Object { $_.PSIsContainer -or $_.Name -notmatch "^\." } | ForEach-Object {
    Write-Host "  Moving $($_.Name)..." -ForegroundColor DarkCyan
    Move-Item -Path $_.FullName -Destination $installDir -Force
}

Write-Host "moving the files (hidden) into the gore lang dir" -ForegroundColor Cyan
# This section mimics `mv ./.*`
# It gets all hidden items (files and directories) from the current location,
# excluding the special '.' (current) and '..' (parent) directory entries.
Get-ChildItem -Path (Get-Location) -Force -Hidden | Where-Object { $_.Name -match "^\." -and $_.Name -ne "." -and $_.Name -ne ".." } | ForEach-Object {
    Write-Host "  Moving $($_.Name)..." -ForegroundColor DarkCyan
    Move-Item -Path $_.FullName -Destination $installDir -Force
}
#endregion

#region Navigating and Permissions
Write-Host "changing to $(Split-Path $installDir -Parent)" -ForegroundColor Cyan
Set-Location -Path (Split-Path $installDir -Parent) # Mimics 'cd /usr/lib'

Write-Host "changing ownership to $env:USERNAME (conceptually)" -ForegroundColor Yellow
Write-Host "Note: 'chown' has no direct 1:1 equivalent in Windows for system directories." -ForegroundColor DarkYellow
Write-Host "When created by an administrator, permissions are usually adequate for all users." -ForegroundColor DarkYellow
# Explicit 'Set-Acl' (Windows permission command) is omitted as it's complex and rarely a literal replacement for chown in this context.

Write-Host "going into the gore lang dir: $installDir" -ForegroundColor Cyan
Set-Location -Path $installDir # Mimics 'cd gore_lang'
#endregion

#region Building Packages and Binary
Write-Host "going into the packages sub dir" -ForegroundColor Cyan
Set-Location -Path (Join-Path $installDir "packages") # Mimics 'cd packages'

Write-Host "building the packages" -ForegroundColor Green
& python.exe .\build_packages.py # Mimics './build_packages.py' - Assumes Python is in PATH

# Go back to the main install directory as the Dart compile command outputs to the current directory
Write-Host "changing back to $installDir" -ForegroundColor Cyan
Set-Location -Path $installDir

Write-Host "building the binary" -ForegroundColor Green
$binaryName = "gore_lang.exe" # Windows executables typically have a .exe extension
$binarySourcePath = Join-Path $installDir $binaryName # Expected output path of the dart compile command
& dart.exe compile exe bin/gore_lang.dart -o $binarySourcePath # Mimics 'dart compile exe bin/gore_lang.dart -o gore_lang' - Assumes Dart SDK is in PATH
#endregion

#region Moving Binary within Program Folder and PATH Instruction
$globalBinPath = Join-Path $installDir "bin"
Write-Host "Creating binary sub-directory: $globalBinPath" -ForegroundColor Cyan
New-Item -ItemType Directory -Path $globalBinPath -Force

Write-Host "moving the binary into its dedicated 'bin' folder: $globalBinPath" -ForegroundColor Green
Move-Item -Path $binarySourcePath -Destination $globalBinPath -Force

Write-Host "`nInstallation complete!" -ForegroundColor Green
Write-Host "To run 'gore_lang.exe' from any location in your terminal, you need to add" -ForegroundColor Yellow
Write-Host "'$globalBinPath' to your system's PATH environment variable." -ForegroundColor Yellow
Write-Host "You can do this manually via System Properties > Environment Variables, or by running" -ForegroundColor Yellow
Write-Host "the following command in an ADMINISTRATOR PowerShell session (you may need to restart your terminal or computer for changes to take effect):" -ForegroundColor Yellow
Write-Host "[Environment]::SetEnvironmentVariable('Path', `$([Environment]::GetEnvironmentVariable('Path', 'Machine')) + ';$globalBinPath', 'Machine')" -ForegroundColor DarkYellow
#endregion

Write-Host "`nDone" -ForegroundColor Green
