Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "       TOEIC TRACKER BUILD SCRIPT        " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

$ErrorActionPreference = "Stop"

# Bước 1: Xóa bản build web cũ trong electron_app (nếu có)
Write-Host "`n[1/4] Dọn dẹp bản build web cũ..." -ForegroundColor Yellow
$webBuildPath = ".\electron_app\web_build"
if (Test-Path $webBuildPath) {
    Remove-Item -Recurse -Force $webBuildPath
}
New-Item -ItemType Directory -Force -Path $webBuildPath | Out-Null

# Bước 2: Build Flutter Web
Write-Host "`n[2/4] Đang build Flutter Web. Quá trình này có thể mất một lúc..." -ForegroundColor Yellow
flutter build web
if ($LASTEXITCODE -ne 0) {
    Write-Host " Lỗi: Flutter build web thất bại!" -ForegroundColor Red
    exit $LASTEXITCODE
}

# Bước 3: Copy sang electron_app
Write-Host "`n[3/4] Copy bản build sang thư mục Electron..." -ForegroundColor Yellow
Copy-Item -Path ".\build\web\*" -Destination $webBuildPath -Recurse -Force

# Bước 4: Chạy npm run build trong electron_app
Write-Host "`n[4/4] Đang đóng gói ứng dụng Electron ra file cài đặt (.exe)..." -ForegroundColor Yellow
Set-Location -Path ".\electron_app"
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host " Lỗi: Build Electron thất bại!" -ForegroundColor Red
    Set-Location -Path ".."
    exit $LASTEXITCODE
}
Set-Location -Path ".."

Write-Host "`n=========================================" -ForegroundColor Green
Write-Host " XONG! Ứng dụng đã được build thành công! " -ForegroundColor Green
Write-Host " Bạn có thể tìm thấy file cài đặt .exe ở thư mục: electron_app\release" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Green
