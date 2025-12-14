# Windows Setup Script

# Ensure script is run as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as Administrator." -ForegroundColor Red
    exit
}

# Update and install Chocolatey
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install essential packages
$packages = @(
    "git",
    "vim",
    "7zip",
    "notepadplusplus",
    "python",
    "starship"
)

foreach ($package in $packages) {
    choco install $package -y
}

# Install or update PSReadLine
if (-not (Get-Module -ListAvailable -Name PSReadLine)) {
    Install-Module -Name PSReadLine -Force -SkipPublisherCheck
    Write-Host "PSReadLine module installed." -ForegroundColor Green
}
else {
    Write-Host "PSReadLine module is already available." -ForegroundColor Yellow
}

# Set up symlinks
$dotfilesPath = "$PSScriptRoot\..\..\links"
$homePath = $HOME

$symlinks = @{
    "Microsoft.PowerShell_profile.ps1" = "$homePath\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    "starship.toml"                    = "$homePath\.config\starship.toml"
    "vim\vimrc"                        = "$homePath\.vimrc"
}

foreach ($link in $symlinks.GetEnumerator()) {
    $target = Join-Path -Path $dotfilesPath -ChildPath $link.Key
    $destination = $link.Value

    # Ensure the parent directory of the destination exists
    $parentDirectory = Split-Path -Path $destination -Parent
    if (-not (Test-Path $parentDirectory)) {
        New-Item -ItemType Directory -Path $parentDirectory
    }

    # Debugging output for symbolic link paths
    Write-Host "Creating symbolic link..." -ForegroundColor Yellow
    Write-Host "Target: $target" -ForegroundColor Cyan
    Write-Host "Destination: $destination" -ForegroundColor Cyan

    # Check if parent directory exists
    if (-not (Test-Path $parentDirectory)) {
        Write-Host "Parent directory does not exist. Creating: $parentDirectory" -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $parentDirectory
    }

    # Check if destination already exists
    if (Test-Path $destination) {
        Write-Host "Destination already exists: $destination" -ForegroundColor Red
    }
    else {
        # Create symbolic link
        New-Item -ItemType SymbolicLink -Path $destination -Target $target
    }
}

Write-Host "Windows setup completed successfully!" -ForegroundColor Green