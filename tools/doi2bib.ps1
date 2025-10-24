param(
  [Parameter(Position=0, ValueFromRemainingArguments=$true)]
  [string[]]$Doi,

  [string]$FromFile,

  [string]$BibPath = "references.bib"
)

function Get-BibTeXFromDoi {
  param([Parameter(Mandatory=$true)][string]$Doi)
  $enc = [System.Net.WebUtility]::UrlEncode($Doi)
  $url = "https://doi.org/$enc"
  $headers = @{ Accept = 'application/x-bibtex' }
  try {
    $resp = Invoke-WebRequest -UseBasicParsing -Headers $headers -Uri $url -MaximumRedirection 5 -ErrorAction Stop
    return ($resp.Content -replace "\r", "").Trim()
  } catch {
    Write-Warning "Fehler beim Abruf von DOI '$Doi': $($_.Exception.Message)"
    return $null
  }
}

if (-not $Doi -and -not $FromFile) {
  Write-Host "Verwendung: .\\tools\\doi2bib.ps1 <DOI> [<DOI> ...] [-FromFile pfad\\dois.txt] [-BibPath references.bib]" -ForegroundColor Yellow
  exit 1
}

$dois = @()
if ($FromFile) {
  if (-not (Test-Path $FromFile)) { throw "Datei nicht gefunden: $FromFile" }
  $dois += (Get-Content -Path $FromFile | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' })
}
if ($Doi) { $dois += ($Doi | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }) }

$existing = ""
if (Test-Path $BibPath) { $existing = Get-Content -Path $BibPath -Raw }

$added = 0
foreach ($d in $dois) {
  $bib = Get-BibTeXFromDoi -Doi $d
  if (-not $bib) { continue }
  $key = $null
  if ($bib -match '@\w+\{([^,]+),') { $key = $matches[1] }

  $duplicate = $false
  if ($key -and $existing) {
    if ($existing -match "@\\w+\\{$([Regex]::Escape($key)),") { $duplicate = $true }
  }
  if ($duplicate) {
    Write-Host "Übersprungen (bereits vorhanden): $key" -ForegroundColor DarkYellow
    continue
  }
  if ($existing -and $bib -and ($existing -like "*`n$bib*")) {
    Write-Host "Übersprungen (identischer Eintrag gefunden)" -ForegroundColor DarkYellow
    continue
  }
  if ($existing -and -not $existing.EndsWith("`n")) { $existing += "`n" }
  $append = ""; if (Test-Path $BibPath) { $append = "`n" } else { $append = "" }
  Add-Content -Path $BibPath -Value ($append + $bib + "`n")
  $existing += ($bib + "`n")
  $added++
  if ($key) { Write-Host "Hinzugefügt: $key" -ForegroundColor Green } else { Write-Host "Hinzugefügt (ohne Schlüssel-Erkennung)" -ForegroundColor Green }
}

Write-Host "Fertig. Neue Einträge: $added" -ForegroundColor Cyan

