# Set error action preference to 'Stop' so the script will stop on most non-terminating errors.
$ErrorActionPreference = 'Stop'

. "./vars.ps1"

$binaryName = "gore.exe"
$binaryOutputPath = Join-Path $globalBinPath $binaryName
$dartSourceFile = "bin/gore_lang.dart" 

$compilationSuccessful = $false
$pathAdded = $false

function Test-IsAdministrator {
    return ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-IsAdministrator)) {
    Write-Host "This script requires administrative privileges to modify system PATH and compile." -ForegroundColor Red
    Write-Host "Attempting to re-launch as Administrator..." -ForegroundColor Yellow

    # Get the full path of the current script.
    $scriptPath = $MyInvocation.MyCommand.Path

    # Re-launch PowerShell (using 'pwsh.exe' for modern PowerShell) with administrative privileges.
    # -NoProfile speeds up the launch by not loading user profiles.
    # -File specifies the script to execute.
    Start-Process pwsh.exe -Verb RunAs -ArgumentList "-NoProfile -File `"$scriptPath`""

    # Exit the current non-elevated script instance, as the elevated one will take over.
    Exit
}

try {
    $dartExePath = Get-Command dart.exe -ErrorAction Stop | Select-Object -ExpandProperty Source
} catch {
    Write-Host "Error: dart.exe not found in your system PATH." -ForegroundColor Red
    Write-Host "Please ensure Dart SDK is installed and added to your PATH." -ForegroundColor Yellow
    exit 1
}

Write-Host "`n--- Compiling Binary ---" -ForegroundColor Cyan
try {
    if (-not (Test-Path $globalBinPath)) {
        New-Item -ItemType Directory -Path $globalBinPath -Force | Out-Null
        Write-Host "Created output directory: $globalBinPath" -ForegroundColor DarkYellow
    }

    & dart.exe compile exe $dartSourceFile -o $binaryOutputPath

    if ($LASTEXITCODE -ne 0) {
        throw "Dart compilation failed with exit code $LASTEXITCODE."
    }

    Write-Host "Compilation successful! Binary created at: '$binaryOutputPath'" -ForegroundColor Green
    $compilationSuccessful = $true
} catch {
    Write-Host "Error during Dart compilation: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Please check your Dart source file and ensure Dart SDK is correctly installed." -ForegroundColor Yellow
}

Write-Host "`n--- Managing System PATH ---" -ForegroundColor Cyan

$currentPath = [Environment]::GetEnvironmentVariable('Path', 'Machine')

$globalBinPathLower = $globalBinPath.ToLowerInvariant()
$pathDirs = $currentPath.Split(';') | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" } | ForEach-Object { $_.ToLowerInvariant() }

$alreadyInPath = $pathDirs | Where-Object { $_ -eq $globalBinPathLower } | Measure-Object | Select-Object -ExpandProperty Count

if ($alreadyInPath -eq 0) {
    Write-Host "'$globalBinPath' was not found in your system PATH." -ForegroundColor Yellow
    Write-Host "Attempting to add it now..." -ForegroundColor Yellow

    try {
        [Environment]::SetEnvironmentVariable('Path', "$currentPath;$globalBinPath", 'Machine')
        Write-Host "Success! '$globalBinPath' has been added to your system PATH." -ForegroundColor Green
        Write-Host "Important: You might need to restart your terminal (like PowerShell or Command Prompt)" -ForegroundColor Yellow
        Write-Host "or even your computer for these changes to take effect in new sessions." -ForegroundColor Yellow
        $pathAdded = $true
    } catch {
        Write-Host "Error: Failed to add '$globalBinPath' to system PATH." -ForegroundColor Red
        Write-Host "Details: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "You might need to add it manually if the issue persists." -ForegroundColor Yellow
    }
}

Write-Host "`n--- Script Finished ---" -ForegroundColor Cyan

if ($compilationSuccessful -or (-not $compilationSuccessful -and $LASTEXITCODE -ne 0) -or $pathAdded -or (-not $pathAdded -and $alreadyInPath -eq 0)) {
    if ($compilationSuccessful) {
        Write-Host "Binary compilation: SUCCESS" -ForegroundColor Green
    } else {
        Write-Host "Binary compilation: FAILED (check errors above)" -ForegroundColor Red
    }

    if ($pathAdded) {
        Write-Host "System PATH: '$globalBinPath' ADDED" -ForegroundColor Green
        Write-Host "Important: Remember to restart your terminal for changes to apply." -ForegroundColor Yellow
    } elseif ($alreadyInPath -eq 0) {
        Write-Host "System PATH: FAILED to add '$globalBinPath' (check errors above)" -ForegroundColor Red
    }
} else {
    Write-Host "No new compilation or PATH changes were needed." -ForegroundColor White
}
