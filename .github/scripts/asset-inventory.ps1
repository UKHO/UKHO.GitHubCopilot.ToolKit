[CmdletBinding()]
param(
    [switch]$AsJson
)

$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)

$groups = @(
    @{ Name = 'Agents'; Path = Join-Path $repoRoot '.github\agents'; Filter = '*.agent.md' },
    @{ Name = 'Prompts'; Path = Join-Path $repoRoot '.github\prompts'; Filter = '*.prompt.md' },
    @{ Name = 'Instructions'; Path = Join-Path $repoRoot '.github\instructions'; Filter = '*.instructions.md' },
    @{ Name = 'Templates'; Path = Join-Path $repoRoot '.github\templates'; Filter = '*.template.md' }
)

$inventory = foreach ($group in $groups) {
    $files = @()
    if (Test-Path $group.Path) {
        $files = Get-ChildItem -Path $group.Path -Filter $group.Filter -File | Sort-Object Name
    }

    [PSCustomObject]@{
        AssetType = $group.Name
        Count = $files.Count
        Files = @($files | ForEach-Object { $_.Name })
    }
}

$skillsPath = Join-Path $repoRoot '.github\skills'
$skillFolders = @()
if (Test-Path $skillsPath) {
    $skillFolders = Get-ChildItem -Path $skillsPath -Directory | Sort-Object Name
}

$result = [PSCustomObject]@{
    Repository = Split-Path $repoRoot -Leaf
    GeneratedAtUtc = (Get-Date).ToUniversalTime().ToString('u')
    AssetInventory = $inventory
    SkillsDirectoryExists = Test-Path $skillsPath
    SkillFolderCount = $skillFolders.Count
    SkillFolders = @($skillFolders | ForEach-Object { $_.Name })
}

if ($AsJson) {
    $result | ConvertTo-Json -Depth 6
    return
}

$result
