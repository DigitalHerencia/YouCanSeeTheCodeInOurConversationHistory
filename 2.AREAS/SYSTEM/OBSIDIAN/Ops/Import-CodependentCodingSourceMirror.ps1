# Import-CodependentCodingSourceMirror.ps1
[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$SourceRoot = 'D:\The Codependent Coding™ WebApp Architecture',

    [Parameter(Mandatory = $true)]
    [string]$VaultRoot,

    [Parameter(Mandatory = $false)]
    [string]$DestinationRelative = '60 CODEPENDENT CODING\Source Mirror',

    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$SourceRoot = (Resolve-Path -LiteralPath $SourceRoot).Path
$VaultRoot = (Resolve-Path -LiteralPath $VaultRoot).Path
$DestinationRoot = Join-Path $VaultRoot $DestinationRelative

$ExcludedDirectoryNames = @(
    '.git',
    'node_modules',
    '.next',
    'dist',
    'build',
    'coverage',
    'out',
    '.turbo',
    '.vercel',
    '.cache',
    '.parcel-cache',
    'tmp',
    'temp'
)

$SensitiveFilePatterns = @(
    '^\.env$',
    '^\.env\.(?!example$|sample$|template$).+',
    '\.(pem|key|pfx|p12|crt|cer)$',
    '^id_rsa',
    '^id_ed25519',
    '^keyless\.json$',
    '^\.npmrc$',
    '^\.pypirc$',
    '^\.netrc$',
    '(^|[._-])(secret|secrets|credential|credentials)([._-]|$)'
)

$LanguageByExtension = @{
    '.ts' = 'ts'
    '.tsx' = 'tsx'
    '.js' = 'javascript'
    '.jsx' = 'jsx'
    '.mjs' = 'javascript'
    '.cjs' = 'javascript'
    '.json' = 'json'
    '.jsonc' = 'jsonc'
    '.md' = 'markdown'
    '.mdx' = 'mdx'
    '.css' = 'css'
    '.scss' = 'scss'
    '.sass' = 'sass'
    '.less' = 'less'
    '.html' = 'html'
    '.htm' = 'html'
    '.xml' = 'xml'
    '.svg' = 'xml'
    '.yml' = 'yaml'
    '.yaml' = 'yaml'
    '.toml' = 'toml'
    '.ini' = 'ini'
    '.prisma' = 'prisma'
    '.sql' = 'sql'
    '.graphql' = 'graphql'
    '.gql' = 'graphql'
    '.sh' = 'bash'
    '.bash' = 'bash'
    '.zsh' = 'zsh'
    '.ps1' = 'powershell'
    '.psm1' = 'powershell'
    '.psd1' = 'powershell'
    '.py' = 'python'
    '.rb' = 'ruby'
    '.go' = 'go'
    '.rs' = 'rust'
    '.java' = 'java'
    '.kt' = 'kotlin'
    '.kts' = 'kotlin'
    '.cs' = 'csharp'
    '.c' = 'c'
    '.h' = 'c'
    '.cpp' = 'cpp'
    '.hpp' = 'cpp'
    '.txt' = 'text'
    '.csv' = 'csv'
    '.lock' = 'text'
}

function ConvertTo-YamlSingleQuoted([string]$Value) {
    if ($null -eq $Value) { return "''" }
    return "'" + $Value.Replace("'", "''") + "'"
}

function ConvertTo-Slug([string]$Value) {
    $slug = $Value.ToLowerInvariant()
    $slug = [regex]::Replace($slug, '[^a-z0-9]+', '-')
    $slug = $slug.Trim('-')
    if ([string]::IsNullOrWhiteSpace($slug)) { return 'source' }
    return $slug
}

function ConvertTo-Namespace([string]$RelativePath) {
    $value = $RelativePath.ToLowerInvariant().Replace('\', '.').Replace('/', '.')
    $value = [regex]::Replace($value, '[^a-z0-9.-]+', '-')
    $value = [regex]::Replace($value, '\.+', '.')
    $value = [regex]::Replace($value, '-+', '-')
    $value = $value.Trim('.', '-')
    return "codependentcoding.source.$value"
}

function Test-IsExcludedPath([string]$FullPath) {
    $relative = [System.IO.Path]::GetRelativePath($SourceRoot, $FullPath)
    $segments = $relative -split '[\\/]'
    foreach ($segment in $segments) {
        if ($ExcludedDirectoryNames -contains $segment) {
            return $true
        }
    }
    return $false
}

function Test-IsSensitiveFile([System.IO.FileInfo]$File) {
    foreach ($pattern in $SensitiveFilePatterns) {
        if ($File.Name -match $pattern) {
            return $true
        }
    }
    return $false
}

function Get-StrictUtf8Text([string]$Path) {
    $bytes = [System.IO.File]::ReadAllBytes($Path)

    # NUL bytes strongly indicate binary content.
    if ($bytes -contains 0) {
        return $null
    }

    try {
        $utf8 = [System.Text.UTF8Encoding]::new($false, $true)
        return $utf8.GetString($bytes)
    }
    catch {
        return $null
    }
}

function Get-CodeFence([string]$Content) {
    $maxRun = 0
    foreach ($match in [regex]::Matches($Content, '`+')) {
        if ($match.Value.Length -gt $maxRun) {
            $maxRun = $match.Value.Length
        }
    }
    $length = [Math]::Max(3, $maxRun + 1)
    return ('`' * $length)
}

function Get-Language([System.IO.FileInfo]$File) {
    $extension = $File.Extension.ToLowerInvariant()
    if ($LanguageByExtension.ContainsKey($extension)) {
        return $LanguageByExtension[$extension]
    }

    switch -Regex ($File.Name.ToLowerInvariant()) {
        '^dockerfile(\..+)?$' { return 'dockerfile' }
        '^makefile$' { return 'makefile' }
        '^\.gitignore$' { return 'text' }
        '^\.gitattributes$' { return 'text' }
        '^\.editorconfig$' { return 'ini' }
        default { return 'text' }
    }
}

function Get-Sha256([string]$Path) {
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}

function New-SourceMirrorNote(
    [System.IO.FileInfo]$File,
    [string]$RelativePath,
    [string]$TextContent,
    [string]$CreatedDate
) {
    $sourceTopLevel = ($RelativePath -split '[\\/]')[0]
    $sourceSlug = ConvertTo-Slug $sourceTopLevel
    $namespace = ConvertTo-Namespace $RelativePath
    $hash = Get-Sha256 $File.FullName
    $date = (Get-Date).ToString('yyyy-MM-dd')
    if ([string]::IsNullOrWhiteSpace($CreatedDate)) {
        $CreatedDate = $date
    }
    $language = Get-Language $File
    $fence = Get-CodeFence $TextContent

    $yamlTitle = ConvertTo-YamlSingleQuoted $RelativePath
    $yamlArtifact = ConvertTo-YamlSingleQuoted $RelativePath
    $yamlNamespace = ConvertTo-YamlSingleQuoted $namespace
    $yamlSourcePath = ConvertTo-YamlSingleQuoted $RelativePath
    $yamlSourceFile = ConvertTo-YamlSingleQuoted $File.Name
    $yamlHash = ConvertTo-YamlSingleQuoted $hash

    return @"
---
title: $yamlTitle
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: $yamlArtifact
kind: source-document
namespace: $yamlNamespace
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/$sourceSlug
created: $CreatedDate
updated: $date
source_path: $yamlSourcePath
source_file: $yamlSourceFile
source_sha256: $yamlHash
generated: true
---

# ``$($File.Name)``

> [!info] Generated source mirror
> Original path: ``$RelativePath``
> SHA-256: ``$hash``

$fence$language
$TextContent
$fence
"@
}

if (-not $DryRun) {
    New-Item -ItemType Directory -Path $DestinationRoot -Force | Out-Null
}

$files = Get-ChildItem -LiteralPath $SourceRoot -File -Recurse -Force
$imported = 0
$binary = 0
$sensitive = 0
$excluded = 0
$errors = @()

foreach ($file in $files) {
    try {
        if (Test-IsExcludedPath $file.FullName) {
            $excluded++
            continue
        }

        if (Test-IsSensitiveFile $file) {
            Write-Warning "Sensitive file skipped: $($file.FullName)"
            $sensitive++
            continue
        }

        $relative = [System.IO.Path]::GetRelativePath($SourceRoot, $file.FullName)
        $text = Get-StrictUtf8Text $file.FullName

        if ($null -eq $text) {
            Write-Warning "Binary/non-UTF8 file skipped: $relative"
            $binary++
            continue
        }

        # Keep the complete original file name and append .md so every imported file
        # becomes an Obsidian note: package.json -> package.json.md, README.md -> README.md.md
        $destinationRelative = $relative + '.md'
        $destinationPath = Join-Path $DestinationRoot $destinationRelative
        $destinationDirectory = Split-Path -Parent $destinationPath

        if ($DryRun) {
            Write-Host "[DRY RUN] $relative -> $destinationRelative"
            $imported++
            continue
        }

        New-Item -ItemType Directory -Path $destinationDirectory -Force | Out-Null

        $createdDate = ''
        if (Test-Path -LiteralPath $destinationPath) {
            $existing = [System.IO.File]::ReadAllText($destinationPath)
            $createdMatch = [regex]::Match(
                $existing,
                '(?m)^created:\s*(\d{4}-\d{2}-\d{2})\s*$'
            )
            if ($createdMatch.Success) {
                $createdDate = $createdMatch.Groups[1].Value
            }
        }

        $note = New-SourceMirrorNote `
            -File $file `
            -RelativePath $relative `
            -TextContent $text `
            -CreatedDate $createdDate

        [System.IO.File]::WriteAllText(
            $destinationPath,
            $note,
            [System.Text.UTF8Encoding]::new($false)
        )

        $imported++
    }
    catch {
        $errors += "$($file.FullName): $($_.Exception.Message)"
    }
}

Write-Host ''
Write-Host 'Source mirror import complete.'
Write-Host "Source:      $SourceRoot"
Write-Host "Destination: $DestinationRoot"
Write-Host "Imported:    $imported"
Write-Host "Excluded:    $excluded"
Write-Host "Sensitive:   $sensitive"
Write-Host "Binary:      $binary"
Write-Host "Errors:      $($errors.Count)"

if ($errors.Count -gt 0) {
    Write-Host ''
    Write-Warning 'Import errors:'
    $errors | ForEach-Object { Write-Warning $_ }
    exit 1
}
