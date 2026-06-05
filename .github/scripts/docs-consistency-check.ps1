[CmdletBinding()]
param(
    [switch]$AsJson
)

$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

function Get-FileText {
    param([string]$RelativePath)
    $path = Join-Path $repoRoot $RelativePath
    if (-not (Test-Path $path)) {
        return $null
    }

    Get-Content -Path $path -Raw
}

$checks = @()

$skillsOverview = Get-FileText 'docs\wiki\skills-overview.md'
$skillsDirExists = Test-Path (Join-Path $repoRoot '.github\skills')
$checks += [PSCustomObject]@{
    Check = 'Skills overview matches folder existence'
    Passed = -not ($skillsOverview -match 'does \*\*not\*\* contain a `\.github/skills/` directory' -and $skillsDirExists)
    Details = if ($skillsOverview -match 'does \*\*not\*\* contain a `\.github/skills/` directory' -and $skillsDirExists) { 'Wiki says skills directory is absent, but the folder exists.' } else { '' }
}

$indexText = Get-FileText 'docs\wiki\index.md'
$checks += [PSCustomObject]@{
    Check = 'Index mentions governance artifacts'
    Passed = ($indexText -match 'Repository governance')
    Details = if ($indexText -match 'Repository governance') { '' } else { 'docs/wiki/index.md does not mention AGENTS.md and lessons.md.' }
}

$workflowText = Get-FileText 'docs\wiki\workflow-overview.md'
$checks += [PSCustomObject]@{
    Check = 'Workflow overview mentions AGENTS and lessons'
    Passed = ($workflowText -match 'AGENTS.md' -and $workflowText -match 'lessons.md')
    Details = if ($workflowText -match 'AGENTS.md' -and $workflowText -match 'lessons.md') { '' } else { 'docs/wiki/workflow-overview.md is missing governance-file references.' }
}

$readmeText = Get-FileText 'README.md'
$checks += [PSCustomObject]@{
    Check = 'README mentions governance artifacts'
    Passed = ($readmeText -match 'AGENTS.md' -and $readmeText -match 'lessons.md')
    Details = if ($readmeText -match 'AGENTS.md' -and $readmeText -match 'lessons.md') { '' } else { 'README.md is missing governance-file references.' }
}

$result = [PSCustomObject]@{
    Repository = Split-Path $repoRoot -Leaf
    GeneratedAtUtc = (Get-Date).ToUniversalTime().ToString('u')
    Passed = ($checks.Passed -notcontains $false)
    FailedCount = @($checks | Where-Object { -not $_.Passed }).Count
    Results = $checks
}

if ($AsJson) {
    $result | ConvertTo-Json -Depth 5
    return
}

$result
