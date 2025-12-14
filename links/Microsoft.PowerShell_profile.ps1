# ----------------------------------------------------------
# CLEAN AND FAST POWERSHELL PROFILE
# ----------------------------------------------------------

# Import posh-git if available (only for commands, NOT prompt)
if (Get-Module -ListAvailable -Name posh-git) {
    Import-Module posh-git
}

# PSReadLine config
if (Get-Module -ListAvailable -Name PSReadLine) {
    Set-PSReadLineOption -EditMode Windows
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -HistorySaveStyle SaveAtExit

    # Dracula syntax colors
    Set-PSReadlineOption -Color @{
        "Command"   = [ConsoleColor]::Green
        "Parameter" = [ConsoleColor]::Gray
        "Operator"  = [ConsoleColor]::Magenta
        "Variable"  = [ConsoleColor]::White
        "String"    = [ConsoleColor]::Yellow
        "Number"    = [ConsoleColor]::Blue
        "Type"      = [ConsoleColor]::Cyan
        "Comment"   = [ConsoleColor]::DarkCyan
    }
}

# Dracula Prompt Configuration
Import-Module posh-git
$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
$GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::Cyan
$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# Dracula Git Status Configuration
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue

# Helpful aliases
Set-Alias ll Get-ChildItem
Set-Alias la "Get-ChildItem -Force"
function cdg { git status -s }
function .. { Set-Location .. }
function ... { Set-Location ../.. }

# Fast startup defaults
$PSModuleAutoloadingPreference = "All"
Set-Location $HOME
$ErrorActionPreference = "Continue"

# ----------------------------------------------------------
# CUSTOM PROMPT (GREEN GIT BRANCH)
# Format: (branch) directory>
# ----------------------------------------------------------

function Get-GitBranch {
    try {
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        if ($branch -and $branch -ne "HEAD") { return $branch }
    }
    catch {}
    return $null
}

function prompt {
    $dir = Split-Path -Leaf -Path (Get-Location)
    $branch = Get-GitBranch

    if ($branch) {
        Write-Host "(" -NoNewline
        Write-Host $branch -ForegroundColor Green -NoNewline
        Write-Host ") $dir> " -NoNewline
    }
    else {
        Write-Host "$dir> " -NoNewline
    }

    return " "
}

# Lazy loading helpers
function use-docker { Import-Module Docker; docker $args }
function use-git { Import-Module posh-git; git $args }

# ----------------------------------------------------------
# END PROFILE
# ----------------------------------------------------------
