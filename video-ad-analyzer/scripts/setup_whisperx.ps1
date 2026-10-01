# Default runtime root is per-user and outside the skill library; pass -RuntimeRoot to choose another location.
param([string]$RuntimeRoot)
if (-not $RuntimeRoot) {
    $base = if ($env:LOCALAPPDATA) { $env:LOCALAPPDATA } elseif ($env:XDG_DATA_HOME) { $env:XDG_DATA_HOME } else { Join-Path $HOME '.local/share' }
    $RuntimeRoot = Join-Path $base 'video-skill/whisperx'
}
$ErrorActionPreference = 'Stop'
$runtime = [System.IO.Path]::GetFullPath($RuntimeRoot)
$env:UV_CACHE_DIR = Join-Path $runtime 'uv-cache'
$env:UV_PYTHON_INSTALL_DIR = Join-Path $runtime 'python'
$python = Join-Path $runtime 'whisperx/Scripts/python.exe'
if (-not (Test-Path -LiteralPath $python)) {
    & uv venv --python 3.11 (Join-Path $runtime 'whisperx')
    if ($LASTEXITCODE -ne 0) { throw 'Python environment creation failed.' }
}
& uv pip sync --python $python (Join-Path $PSScriptRoot 'requirements-whisperx.txt') --index https://download.pytorch.org/whl/cu128 --index https://pypi.org/simple --index-strategy unsafe-best-match
if ($LASTEXITCODE -ne 0) { throw 'WhisperX dependency installation failed.' }
& $python -c "import torch; import importlib.metadata as m; print('WhisperX', m.version('whisperx')); print('CUDA available:', torch.cuda.is_available()); print(torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'CPU only')"
if ($LASTEXITCODE -ne 0) { throw 'WhisperX runtime check failed.' }
