[CmdletBinding()]
param(
    [switch]$AsJson
)

$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

$checks = @(
    @{
        Name = 'Governance files exist'
        Path = 'AGENTS.md'
        Type = 'exists'
    },
    @{
        Name = 'Lessons file exists'
        Path = 'lessons.md'
        Type = 'exists'
    },
    @{
        Name = 'Lean asset instructions exist'
        Path = '.github\instructions\agentic-assets.instructions.md'
        Type = 'exists'
    },
    @{
        Name = 'Agent template mentions file:line evidence'
        Path = '.github\templates\agent.template.md'
        Type = 'contains'
        Pattern = 'file:line'
    },
    @{
        Name = 'Prompt template mentions single primary outcome'
        Path = '.github\templates\prompt.template.md'
        Type = 'contains'
        Pattern = 'single primary outcome'
    },
    @{
        Name = 'Execution agent caps retries'
        Path = '.github\agents\execute-delivery-plan.agent.md'
        Type = 'contains'
        Pattern = 'Stop after three failed attempts'
    },
    @{
        Name = 'Instruction authoring prompt reviews AGENTS and lessons'
        Path = '.github\prompts\create-instructions.prompt.md'
        Type = 'contains'
        Pattern = 'AGENTS.md'
    }
)

$results = foreach ($check in $checks) {
    $fullPath = Join-Path $repoRoot $check.Path
    $passed = $false
    $details = ''

    if ($check.Type -eq 'exists') {
        $passed = Test-Path $fullPath
        if (-not $passed) {
            $details = 'Missing file.'
        }
    }
    elseif ($check.Type -eq 'contains') {
        if (Test-Path $fullPath) {
            $content = Get-Content -Path $fullPath -Raw
            $passed = $content -match [regex]::Escape($check.Pattern)
            if (-not $passed) {
                $details = "Pattern '$($check.Pattern)' not found."
            }
        }
        else {
            $details = 'Target file missing.'
        }
    }

    [PSCustomObject]@{
        Check = $check.Name
        Path = $check.Path
        Passed = $passed
        Details = $details
    }
}

$summary = [PSCustomObject]@{
    Repository = Split-Path $repoRoot -Leaf
    GeneratedAtUtc = (Get-Date).ToUniversalTime().ToString('u')
    Passed = ($results.Passed -notcontains $false)
    CheckCount = $results.Count
    FailedCount = @($results | Where-Object { -not $_.Passed }).Count
    Results = $results
}

if ($AsJson) {
    $summary | ConvertTo-Json -Depth 6
    return
}

$summary
