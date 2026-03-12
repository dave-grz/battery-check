<#
.SYNOPSIS
Generate a Windows battery health report using PowerShell *.ps1 script.

.DESCRIPTION
Runs the Windows powercfg battery report command and saves the result as a timestamped HTML file in a user-specified directory.

.AUTHOR
David Graciano (itslearning.dave@gmail.com)

.VERSION
1.0

.LICENSE
MIT License

.COPYRIGHT
Copyright © 2026 David Graciano
#>

# Define variables
$VerbosePreference = "Continue"
$Date = Get-Date -Format "yyyyMMdd-HHmmss"
$User = $env:USERNAME

# Verbose progress in Terminal
Write-Verbose "Starting Battery Report generation..."
Write-Verbose "Current User: $User"
Write-Verbose "Current Date: $Date"

# Get the path from user input
    # Use this if you want to choose specific path every time of Battery Check

$OutPath = Read-Host "Enter the path directory to save the battery report"
$OutPath = $OutPath.Trim()

if ([string]::IsNullOrWhiteSpace($OutPath)) {
    Write-Host "No path provided. Operation cancelled." -ForegroundColor Yellow
    exit
}

if (!(Test-Path $OutPath)) {
    Write-Host "The specified path does not exist. Creating it..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $OutPath -Force | Out-Null
}

# Predetermine path for Battery Check
    # Use this if you already choose specific path for the output of Battery Check

#$OutPath = "DriveLetter:\ParentDir\<Enter your specific destination directory here>"

#if (!(Test-Path $OutPath)) {
    #Write-Host "The specified path does not exist. Creating it..." -ForegroundColor Yellow
    #New-Item -ItemType Directory -Path $OutPath -Force | Out-Null
#}

# Verbose progress in Terminal
Write-Verbose "Selected output folder: $OutPath"

# Define final variables and verbose progress
$OutputFile = "$OutPath\$Date-BatteryReport-$User.html"
Write-Verbose "Generating battery report: $OutputFile"

# Run the Battery Report Command
powercfg /batteryreport /output "$OutputFile"

# Verbose progress in Terminal
Write-Host "Battery report generated successfully!" -ForegroundColor Green
Write-Host "File saved to: $OutputFile" -ForegroundColor Cyan

