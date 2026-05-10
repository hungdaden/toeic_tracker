Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "       TOEIC TRACKER BUILD SCRIPT        " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

$ErrorActionPreference = "Stop"

# Bước 1: Dọn dẹp bản build web và bản release cũ (nếu có)
Write-Host "`n[1/4] Don dep ban build cu..." -ForegroundColor Yellow
$webBuildPath = ".\electron_app\web_build"
$releasePath = ".\electron_app\release"

if (Test-Path $webBuildPath) {
    Remove-Item -Recurse -Force $webBuildPath
}
if (Test-Path $releasePath) {
    Remove-Item -Recurse -Force $releasePath
}
New-Item -ItemType Directory -Force -Path $webBuildPath | Out-Null

# Bước 2: Build Flutter Web
Write-Host "`n[2/4] Dang build Flutter Web. Qua trinh nay se mat mot luc..." -ForegroundColor Yellow
flutter build web
if ($LASTEXITCODE -ne 0) {
    Write-Host " Loi: Flutter build web that bai!" -ForegroundColor Red
    exit $LASTEXITCODE
}

# Bước 3: Copy sang electron_app
Write-Host "`n[3/4] Copy ban build sang thu muc Electron..." -ForegroundColor Yellow
Copy-Item -Path ".\build\web\*" -Destination $webBuildPath -Recurse -Force

# Bước 4: Chạy npm run build trong electron_app
Write-Host "`n[4/4] Dang dong goi ung dung Electron ra file cai dat (.exe)..." -ForegroundColor Yellow
Set-Location -Path ".\electron_app"
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host " Loi: Build Electron that bai!" -ForegroundColor Red
    Set-Location -Path ".."
    exit $LASTEXITCODE
}
Set-Location -Path ".."

Write-Host "`n=========================================" -ForegroundColor Green
Write-Host " XONG! Ung dung da duoc build thanh cong! " -ForegroundColor Green
Write-Host " Ban co the tim thay file cai dat .exe o thu muc: electron_app\release" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Green
