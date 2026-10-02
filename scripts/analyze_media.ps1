param(
    [string]$Root = ".",
    [string]$Ffprobe = "",
    [string]$Output = ""
)

$ErrorActionPreference = "Stop"

if (-not $Ffprobe) {
    $found = Get-Command ffprobe -ErrorAction SilentlyContinue
    if ($found) {
        $Ffprobe = $found.Source
    } elseif (Test-Path -LiteralPath "C:\Program Files\EVCapture\ffprobe.exe") {
        $Ffprobe = "C:\Program Files\EVCapture\ffprobe.exe"
    } else {
        throw "ffprobe was not found. Install FFmpeg or pass -Ffprobe with its full path."
    }
}

$extensions = @(
    ".mp4", ".mov", ".mkv", ".avi", ".m4v", ".webm",
    ".mp3", ".wav", ".m4a", ".aac", ".flac", ".ogg",
    ".jpg", ".jpeg", ".png", ".webp", ".bmp", ".heic"
)
$imageExtensions = @(".jpg", ".jpeg", ".png", ".webp", ".bmp", ".heic")

$items = foreach ($file in Get-ChildItem -LiteralPath $Root -File -Recurse) {
    if ($extensions -notcontains $file.Extension.ToLowerInvariant()) { continue }

    $probeText = & $Ffprobe -v error -show_entries "format=duration:stream=index,codec_type,width,height,avg_frame_rate:stream_tags=rotate" -of json -- $file.FullName
    if ($LASTEXITCODE -ne 0) { continue }
    $probe = $probeText | ConvertFrom-Json
    $video = $probe.streams | Where-Object { $_.codec_type -eq "video" } | Select-Object -First 1
    $audio = $probe.streams | Where-Object { $_.codec_type -eq "audio" } | Select-Object -First 1

    $width = if ($video) { [int]$video.width } else { 0 }
    $height = if ($video) { [int]$video.height } else { 0 }
    $rotation = if ($video.tags.rotate) { [int]$video.tags.rotate } else { 0 }
    if ([Math]::Abs($rotation) % 180 -eq 90) {
        $swap = $width; $width = $height; $height = $swap
    }

    $fps = 0.0
    if ($video.avg_frame_rate -and $video.avg_frame_rate -match "^(\d+)/(\d+)$" -and [double]$Matches[2] -ne 0) {
        $fps = [Math]::Round(([double]$Matches[1] / [double]$Matches[2]), 3)
    }

    $isImage = $imageExtensions -contains $file.Extension.ToLowerInvariant()
    $kind = if ($isImage) { "image" } elseif ($video) { "video" } else { "audio" }
    $orientation = if (-not $video) { "n/a" } elseif ($width -gt $height) { "landscape" } elseif ($height -gt $width) { "portrait" } else { "square" }

    [pscustomobject]@{
        name        = $file.Name
        relative    = [IO.Path]::GetRelativePath((Resolve-Path -LiteralPath $Root), $file.FullName)
        kind        = $kind
        duration_s  = if ($isImage) { 0 } elseif ($probe.format.duration) { [Math]::Round([double]$probe.format.duration, 3) } else { 0 }
        width       = $width
        height      = $height
        orientation = $orientation
        fps         = $fps
        has_audio   = [bool]$audio
        size_bytes  = $file.Length
    }
}

$json = $items | Sort-Object relative | ConvertTo-Json -Depth 4
if ($Output) {
    Set-Content -LiteralPath $Output -Value $json -Encoding utf8
    Write-Output "Wrote $($items.Count) records to $Output"
} else {
    Write-Output $json
}
