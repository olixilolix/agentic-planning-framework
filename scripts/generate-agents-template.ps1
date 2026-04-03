param(
  [switch]$Check
)

$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$policyPath = Join-Path $repoRoot 'framework\agent-policy.json'
$outputPath = Join-Path $repoRoot 'AGENTS.template.md'

if (-not (Test-Path -LiteralPath $policyPath -PathType Leaf)) {
  throw "Missing policy source: framework/agent-policy.json"
}

$policy = Get-Content -Raw -LiteralPath $policyPath | ConvertFrom-Json

function Add-Section {
  param(
    [System.Collections.Generic.List[string]]$Lines,
    [string]$Header,
    [string[]]$Body
  )

  $Lines.Add("## $Header")
  $Lines.Add('')
  for ($index = 0; $index -lt $Body.Count; $index++) {
    $line = $Body[$index]
    $Lines.Add($line)
    if ($index -lt ($Body.Count - 1)) {
      $Lines.Add('')
    }
  }
  $Lines.Add('')
}

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add("# $($policy.title)")
$lines.Add('')
$lines.Add($policy.introNote)
$lines.Add('')
$lines.Add("> [!NOTE]")
$lines.Add("> $($policy.generationNote)")
$lines.Add('')

Add-Section -Lines $lines -Header 'Role' -Body $policy.roleParagraphs

$lines.Add('## Project-Local Replacements')
$lines.Add('')
$lines.Add("Before using this template verbatim, replace these generic references with the project's actual file names:")
$lines.Add('')
foreach ($item in $policy.projectLocalReplacements) {
  $lines.Add("- $item")
}
$lines.Add('')

$lines.Add('## Read First')
$lines.Add('')
$lines.Add('Before making changes, read these in order:')
$lines.Add('')
for ($index = 0; $index -lt $policy.readFirst.Count; $index++) {
  $stepNumber = $index + 1
  $lines.Add("$stepNumber. $($policy.readFirst[$index])")
}
$lines.Add('')

$lines.Add('## Hard Rules')
$lines.Add('')
foreach ($rule in $policy.hardRules) {
  $lines.Add("- $rule")
}
$lines.Add('')

$lines.Add('## Ticket Rule')
$lines.Add('')
$lines.Add('When taking a ticket from the backlog:')
$lines.Add('')
foreach ($rule in $policy.ticketRule) {
  $lines.Add("- $rule")
}
$lines.Add('')

$lines.Add('## Phase Close Rule')
$lines.Add('')
$lines.Add('Before declaring a milestone, phase, or major ticket cluster complete, follow:')
$lines.Add('')
foreach ($rule in $policy.phaseCloseRule) {
  $lines.Add("- $rule")
}
$lines.Add('')
$lines.Add($policy.tailNote)

$generatedContent = ($lines -join "`n") + "`n"

if ($Check) {
  if (-not (Test-Path -LiteralPath $outputPath -PathType Leaf)) {
    throw 'AGENTS.template.md is missing. Regenerate it from framework/agent-policy.json.'
  }

  $existingContent = Get-Content -Raw -LiteralPath $outputPath
  if ($existingContent -ne $generatedContent) {
    throw 'AGENTS.template.md is out of date. Regenerate it with scripts/generate-agents-template.ps1.'
  }

  Write-Host 'AGENTS.template.md matches framework/agent-policy.json.'
  exit 0
}

Set-Content -LiteralPath $outputPath -Value $generatedContent -NoNewline
Write-Host 'Regenerated AGENTS.template.md from framework/agent-policy.json.'
