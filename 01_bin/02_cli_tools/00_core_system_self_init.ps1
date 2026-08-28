<#
.SYNOPSIS
    Self-initializes the CoreSystem directory layout.

.DESCRIPTION
    Loads configuration from 00_core_system_self_init.psd1 and creates all required directories
    under RootPath. This script only creates missing directories and supports standard
    PowerShell manifest loading.

.TARGET DIRECTORY LAYOUT
    CoreSystem
    ├── 01_bin
    │   ├── 01_sys_control
    │   ├── 02_cli_tools
    │   └── 03_hooks
    ├── 02_local_ai
    │   ├── 01_models
    │   ├── 02_runtimes
    │   └── 03_scripts
    ├── 03_gateway_ai
    │   ├── 01_proxies
    │   ├── 02_configs
    │   └── 03_clients
    ├── 04_persona_godview
    │   ├── 01_core_identify
    │   ├── 02_personas
    │   │   ├── 01_developer
    │   │   ├── 02_life_manager
    │   │   └── 03_strategist
    │   └── 03_shared_memory
    ├── 05_media_vault
    │   ├── 01_raw_media
    │   ├── 02_processed
    │   └── 03_shared_links
    └── 06_ai_training_lab
        ├── 01_sources
        ├── 02_pipelines
        ├── 03_datasets
        └── 04_training_jobs

.VERSION
    2.0.0

.CHANGELOG
    2.0.0 - Added extension support: ExecutionPolicyBypass launcher
#>
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $false)]
    [string]$RootOverride
)

$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$configPath = Join-Path -Path $scriptDir -ChildPath '00_core_system_self_init.psd1'

if (-not (Test-Path -Path $configPath -PathType Leaf)) {
    throw "Configuration file not found: $configPath"
}

$config = Import-PowerShellDataFile -Path $configPath
if (-not $config.ContainsKey('RootPath') -or -not $config.ContainsKey('Directories')) {
    throw "Configuration file must define RootPath and Directories."
}

$rootPath = if ($RootOverride -and $RootOverride.Trim() -ne '') {
    $RootOverride
} else {
    $config.RootPath
}

if (-not $rootPath -or $rootPath.Trim() -eq '') {
    throw "RootPath is empty."
}

$rootPath = Resolve-Path -Path $rootPath -ErrorAction SilentlyContinue
if (-not $rootPath) {
    New-Item -Path $config.RootPath -ItemType Directory -Force | Out-Null
    $rootPath = Resolve-Path -Path $config.RootPath
}
$rootPath = $rootPath.ProviderPath

foreach ($relativeDir in $config.Directories) {
    if ([string]::IsNullOrWhiteSpace($relativeDir)) {
        continue
    }

    $targetPath = Join-Path -Path $rootPath -ChildPath $relativeDir
    if (-not (Test-Path -Path $targetPath -PathType Container)) {
        $should = $PSCmdlet.ShouldProcess($targetPath, 'Create directory')
        if ($should) {
            try {
                New-Item -Path $targetPath -ItemType Directory -Force | Out-Null
                Write-Host "Created: $targetPath" -ForegroundColor Green
            } catch {
                Write-Host "Failed to create: $targetPath - $_" -ForegroundColor Red
            }
        } else {
            Write-Host "Would create: $targetPath" -ForegroundColor Cyan
        }
    } else {
        Write-Host "Exists: $targetPath" -ForegroundColor Yellow
    }
}

# --- Extensions handling (config-driven) ---------------------------------
if ($config.ContainsKey('Extensions') -and $config.Extensions -and $config.Extensions.ExecutionPolicyBypass) {
    $launcherPath = Join-Path -Path $rootPath -ChildPath '00_ps_bypass_launcher.bat'
    $launcherContent = @'
@echo off
pushd "%%~dp0"
powershell.exe -NoExit -ExecutionPolicy Bypass -NoProfile -Command "Set-Location -LiteralPath '%%~dp0'"
popd
'@
    try {
        $launcherContent | Set-Content -Path $launcherPath -Encoding UTF8
        Write-Host "Extension: created launcher at $launcherPath" -ForegroundColor Green
    } catch {
        Write-Host "Extension: failed to create launcher - $_" -ForegroundColor Red
    }
}
