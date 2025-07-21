# SuperClaude + Task Master 자동 설정 스크립트
# Windows PowerShell용

# 관리자 권한 확인
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "❌ 이 스크립트는 관리자 권한으로 실행해야 합니다." -ForegroundColor Red
    exit 1
}

Write-Host "🚀 SuperClaude + Task Master 설정 시작..." -ForegroundColor Green

# 1. 전제 조건 확인
Write-Host "📋 전제 조건 확인 중..." -ForegroundColor Yellow

try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js가 설치되지 않았습니다. Node.js v18 이상을 설치해주세요." -ForegroundColor Red
    exit 1
}

try {
    $npmVersion = npm --version
    Write-Host "✅ npm: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm이 설치되지 않았습니다." -ForegroundColor Red
    exit 1
}

try {
    $claudeVersion = claude --version
    Write-Host "✅ Claude Code: $claudeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Claude Code가 설치되지 않았습니다. Claude Code를 먼저 설치해주세요." -ForegroundColor Red
    exit 1
}

# 2. Claude 설정 디렉토리 생성
Write-Host "📁 Claude 설정 디렉토리 준비 중..." -ForegroundColor Yellow
$claudeDir = "$env:USERPROFILE\.claude"
New-Item -ItemType Directory -Force -Path $claudeDir | Out-Null

# 3. 설정 파일들 복사
Write-Host "📄 설정 파일들 복사 중..." -ForegroundColor Yellow

if (Test-Path ".claude.json") {
    Copy-Item ".claude.json" "$env:USERPROFILE\.claude.json" -Force
    Write-Host "✅ .claude.json 복사 완료" -ForegroundColor Green
} else {
    Write-Host "❌ .claude.json 파일을 찾을 수 없습니다." -ForegroundColor Red
    exit 1
}

if (Test-Path "settings.json") {
    Copy-Item "settings.json" "$claudeDir\settings.json" -Force
    Write-Host "✅ settings.json 복사 완료" -ForegroundColor Green
}

if (Test-Path ".superclaude-metadata.json") {
    Copy-Item ".superclaude-metadata.json" "$claudeDir\.superclaude-metadata.json" -Force
    Write-Host "✅ .superclaude-metadata.json 복사 완료" -ForegroundColor Green
}

# SuperClaude 마크다운 파일들 복사
Get-ChildItem "*.md" | Where-Object { $_.Name -ne "SETUP_GUIDE.md" } | ForEach-Object {
    Copy-Item $_.FullName "$claudeDir\$($_.Name)" -Force
    Write-Host "✅ $($_.Name) 복사 완료" -ForegroundColor Green
}

# 4. API 키 설정 안내
Write-Host ""
Write-Host "🔑 API 키 설정이 필요합니다!" -ForegroundColor Cyan
Write-Host "다음 명령어로 .claude.json 파일을 편집하여 API 키를 설정하세요:" -ForegroundColor White
Write-Host ""
Write-Host "notepad `"$env:USERPROFILE\.claude.json`"" -ForegroundColor Yellow
Write-Host ""
Write-Host "변경해야 할 API 키들:" -ForegroundColor White
Write-Host "- ANTHROPIC_API_KEY (권장)" -ForegroundColor White
Write-Host "- OPENAI_API_KEY" -ForegroundColor White
Write-Host "- PERPLEXITY_API_KEY" -ForegroundColor White
Write-Host "- 기타 필요한 서비스들..." -ForegroundColor White
Write-Host ""

# 5. 설치 확인
Write-Host "🔍 설치 확인 중..." -ForegroundColor Yellow
Write-Host "MCP 서버 목록을 확인합니다..." -ForegroundColor White
claude mcp list

Write-Host ""
Write-Host "✅ SuperClaude + Task Master 설정이 완료되었습니다!" -ForegroundColor Green
Write-Host ""
Write-Host "🧪 테스트해볼 명령어들:" -ForegroundColor Cyan
Write-Host "claude" -ForegroundColor Yellow
Write-Host "그 후 다음 명령어들 시도:" -ForegroundColor White
Write-Host "/analyze" -ForegroundColor Yellow
Write-Host "/build" -ForegroundColor Yellow
Write-Host "/implement" -ForegroundColor Yellow
Write-Host "/improve" -ForegroundColor Yellow
Write-Host ""
Write-Host "📚 더 많은 정보는 SETUP_GUIDE.md를 참조하세요." -ForegroundColor White
