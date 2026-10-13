# Tiny local web server for "My library". Only this computer can reach it.
# Started by "Start library (Windows).bat". Close the window to stop it.

$root = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))
$listener = $null
$port = 0
for ($p = 8642; $p -lt 8662; $p++) {
  try {
    $l = New-Object System.Net.HttpListener
    $l.Prefixes.Add("http://localhost:$p/")
    $l.Start()
    $listener = $l; $port = $p; break
  } catch { }
}
if (-not $listener) {
  Write-Host "Could not start the library (no free port). Opening the page directly instead."
  Start-Process (Join-Path $root "index.html")
  Start-Sleep -Seconds 5
  exit
}

$types = @{
  ".html" = "text/html; charset=utf-8"; ".js" = "text/javascript; charset=utf-8";
  ".css" = "text/css; charset=utf-8"; ".json" = "application/json; charset=utf-8";
  ".txt" = "text/plain; charset=utf-8"; ".pdf" = "application/pdf";
  ".png" = "image/png"; ".jpg" = "image/jpeg"; ".svg" = "image/svg+xml"
}

Write-Host ""
Write-Host "  En Noolagam / My library is running at http://localhost:$port/"
Write-Host "  Keep this window open while you read. Close it to stop."
Write-Host ""
Start-Process "http://localhost:$port/index.html"

while ($listener.IsListening) {
  try { $ctx = $listener.GetContext() } catch { break }
  $res = $ctx.Response
  try {
    $rel = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
    if ($rel -eq "") { $rel = "index.html" }
    $full = [IO.Path]::GetFullPath((Join-Path $root $rel))
    if (-not $full.StartsWith($root, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $full -PathType Leaf)) {
      $res.StatusCode = 404
    } else {
      $ext = [IO.Path]::GetExtension($full).ToLower()
      $ct = $types[$ext]
      if (-not $ct) { $ct = "application/octet-stream" }
      $res.ContentType = $ct
      $res.AddHeader("Cache-Control", "no-cache")
      $fs = [IO.File]::OpenRead($full)
      try { $res.ContentLength64 = $fs.Length; $fs.CopyTo($res.OutputStream) } finally { $fs.Close() }
    }
  } catch {
    try { $res.StatusCode = 500 } catch { }
  } finally {
    try { $res.Close() } catch { }
  }
}
