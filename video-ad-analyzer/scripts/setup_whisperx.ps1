param([string]$RuntimeRoot = (Join-Path $PSScriptRoot '../../.runtime'))
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
