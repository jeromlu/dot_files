# Make default encoding utf8 for all commands and scripts.
$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

# Set some useful environmental variables.
$Env:HOME = "C:\Users\jeromlu2\LukaFiles"
$Env:homepath = "C:\Users\jeromlu2\LukaFiles"
$Env:SSH_CONFIG = "$Env:HOME\.ssh\config"
$Env:PIPX_HOME = "$Env:HOME\.local\"
$Env:PIPX_BIN_DIR = "$Env:HOME\.local\bin\"
#$Env:SDZ_VS_DIR  = "C:\Program Files\Microsoft Visual Studio\2022\Professional"
$Env:SDZ_VS_DIR = "C:/Program Files (x86)/Microsoft Visual Studio/2019/BuildTools"


# Dot sourcing some useful functions.
#. $PSScriptRoot/ctps_utility_functions.ps1

# To show only last folder. Git posh stops working.
function prompt {
    $p = & $GitPromptScriptBlock
    $p += Split-Path -leaf -path (Get-Location)
    "$p> " 
}

# Third party  modules.
Import-Module posh-git
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptWriteStatusFirst = $true
# By default
# $GitPromptSettings.DefaultPromptPath.Text = "$(Split-Path -leaf -path (Get-Location))"
$GitPromptSettings.DefaultPromptPath.Text = ""
$GitPromptSettings.DefaultPromptSuffix.Text = ""

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}

function Edit-Profile {gvim $PROFILE.CurrentUserCurrentHost} 
function Edit-LjeromelModule {
    $ljeromelModulePath = (Get-Module ljeromelModule).path
    $ljeromelModuleDir = (Get-Item (Get-Module ljeromelModule).path).Directory
    gvim $ljeromelModuleDir
}
# Some more great functions.
function Initialize-DevEnv {
    # To execute script 
    #cmd /C "CALL `"$($Env:SDZ_VS_DIR)\VC\Auxiliary\Build\vcvarsall.bat`" x64 && powershell"
    cmd /C "CALL `"$($Env:SDZ_VS_DIR)\VC\Auxiliary\Build\vcvarsall.bat`" x64 && pwsh"
}

function Get-CmdletAlias ($cmdletname) {
    Get-Alias |
        Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
            Format-Table -Property Definition, Name -AutoSize
}

function touch {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$Path
  )

  if (Test-Path -LiteralPath $Path) {
    (Get-Item -Path $Path).LastWriteTime = Get-Date
  } else {
    New-Item -Type File -Path $Path
  }
}

#Ne dela.
Import-Module PSReadLine
#Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PsReadLineOption -EditMode vi
#Set-PsReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PsReadlineKeyHandler -Key Tab -Function Complete
#Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $OnViModeChange
# Predictive IntelliSense setting.
# Can be changed by pressing F2, right arrow accepts the suggestion.
Set-PsReadLineOption -PredictionViewStyle ListView
# Can be onw of None, History, Plugin, HistoryAndPlugin
# To use 3rd party module install CompletionPredictor from PS gallery.
# Sadly works only with PS 7.2 and above, which is hard to install on SDZ laptops.
# Install-Module -Name CompletionPredictor
#Import-Module -Name CompletionPredictor
Set-PsReadLineOption -PredictionSource History
Set-PsReadLineKeyHandler -Chord "Ctrl+f" -Function AcceptSuggestion
# Accepts only next word not whole command.
Set-PsReadLineKeyHandler -Chord "Ctrl+n" -Function AcceptNextSuggestionWord
Set-PsReadLineKeyHandler -Chord "Ctrl+m" -Function ForwardWord

# Import personal modules
Import-Module ljeromelModule

# Aliases.
New-Alias which get-command
#New-Alias python python3.11.exe
# To have below command, third party tool has to be installed:
# Install-Module PSTree -Scope CurrentUser
New-Alias tree get-pstree

