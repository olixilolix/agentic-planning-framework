$ErrorActionPreference = 'Stop'

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$requiredFiles = @(
  'README.md',
  'AGENTS.template.md',
  'LICENSE',
  'docs/README.md',
  'docs/DEVELOPMENT_FRAMEWORK.md',
  'docs/DECISION_GATES.md',
  'docs/TEST_CHARTER.md',
  'framework/README.md',
  'framework/agent-policy.json',
  'scripts/generate-agents-template.ps1',
  'templates/README.md',
  'templates/STACK.template.md',
  'templates/SYSTEM_BOUNDARIES.template.md',
  'templates/ARCHITECTURE.template.md',
  'templates/ROADMAP.template.md',
  'templates/BACKLOG.template.md'
)

$failures = New-Object System.Collections.Generic.List[string]

foreach ($relativePath in $requiredFiles) {
  $resolvedPath = Join-Path $repoRoot $relativePath
  if (-not (Test-Path -LiteralPath $resolvedPath -PathType Leaf)) {
    $failures.Add("Missing required file: $relativePath")
  }
}

$generatorScript = Join-Path $repoRoot 'scripts\generate-agents-template.ps1'
try {
  & $generatorScript -Check | Out-Null
} catch {
  $failures.Add($_.Exception.Message)
}

$backlogTemplatePath = Join-Path $repoRoot 'templates\BACKLOG.template.md'
if (Test-Path -LiteralPath $backlogTemplatePath -PathType Leaf) {
  $backlogTemplateContent = Get-Content -Raw -LiteralPath $backlogTemplatePath
  $requiredBacklogFields = @(
    'change class:',
    'autonomy tier:',
    'allowed evolution seams:',
    'decision gate status:'
  )

  foreach ($field in $requiredBacklogFields) {
    if ($backlogTemplateContent -notmatch [regex]::Escape($field)) {
      $failures.Add("templates/BACKLOG.template.md is missing required governance field: $field")
    }
  }
}

$markdownFiles = Get-ChildItem -Path $repoRoot -Recurse -File -Filter *.md |
  Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }

$linkPattern = '\[[^\]]+\]\(([^)]+)\)'

foreach ($file in $markdownFiles) {
  $content = Get-Content -Raw -LiteralPath $file.FullName
  $matches = [regex]::Matches($content, $linkPattern)

  foreach ($match in $matches) {
    $target = $match.Groups[1].Value.Trim()

    if ([string]::IsNullOrWhiteSpace($target)) {
      continue
    }

    if ($target.StartsWith('#')) {
      continue
    }

    if ($target -match '^[a-zA-Z][a-zA-Z0-9+.-]*:') {
      continue
    }

    if ($target.StartsWith('//')) {
      continue
    }

    $pathPart = $target.Split('#')[0]

    if ([string]::IsNullOrWhiteSpace($pathPart)) {
      continue
    }

    $candidatePath = Join-Path $file.DirectoryName $pathPart

    if (-not (Test-Path -LiteralPath $candidatePath)) {
      $sourcePath = $file.FullName.Substring($repoRoot.Length).TrimStart('\', '/').Replace('\', '/')
      $failures.Add("$sourcePath links to missing path: $pathPart")
    }
  }
}

if ($failures.Count -gt 0) {
  $message = "Documentation validation failed:`n- " + ($failures -join "`n- ")
  throw $message
}

Write-Host "Documentation validation passed for $($markdownFiles.Count) Markdown files."
