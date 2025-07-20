#!/bin/bash

# SuperClaude + Task Master 자동 설정 스크립트
# Linux/macOS/WSL용

set -e

echo "🚀 SuperClaude + Task Master 설정 시작..."

# 1. 전제 조건 확인
echo "📋 전제 조건 확인 중..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js가 설치되지 않았습니다. Node.js v18 이상을 설치해주세요."
    exit 1
fi

NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js 버전이 낮습니다. v18 이상이 필요합니다. 현재: $(node --version)"
    exit 1
fi

if ! command -v claude &> /dev/null; then
    echo "❌ Claude Code가 설치되지 않았습니다. Claude Code를 먼저 설치해주세요."
    exit 1
fi

echo "✅ Node.js: $(node --version)"
echo "✅ npm: $(npm --version)"
echo "✅ Claude Code: $(claude --version)"

# 2. Claude 설정 디렉토리 생성
echo "📁 Claude 설정 디렉토리 준비 중..."
mkdir -p ~/.claude

# 3. 설정 파일들 복사
echo "📄 설정 파일들 복사 중..."

if [ -f ".claude.json" ]; then
    cp .claude.json ~/.claude.json
    echo "✅ .claude.json 복사 완료"
else
    echo "❌ .claude.json 파일을 찾을 수 없습니다."
    exit 1
fi

if [ -f "settings.json" ]; then
    cp settings.json ~/.claude/settings.json
    echo "✅ settings.json 복사 완료"
fi

if [ -f ".superclaude-metadata.json" ]; then
    cp .superclaude-metadata.json ~/.claude/.superclaude-metadata.json
    echo "✅ .superclaude-metadata.json 복사 완료"
fi

# SuperClaude 마크다운 파일들 복사
for file in *.md; do
    if [ -f "$file" ] && [ "$file" != "SETUP_GUIDE.md" ]; then
        cp "$file" ~/.claude/
        echo "✅ $file 복사 완료"
    fi
done

# 4. 권한 설정
echo "🔒 파일 권한 설정 중..."
chmod 600 ~/.claude.json
chmod -R 644 ~/.claude/*.md
chmod 644 ~/.claude/settings.json ~/.claude/.superclaude-metadata.json

# 5. API 키 설정 안내
echo ""
echo "🔑 API 키 설정이 필요합니다!"
echo "다음 명령어로 .claude.json 파일을 편집하여 API 키를 설정하세요:"
echo ""
echo "nano ~/.claude.json"
echo ""
echo "변경해야 할 API 키들:"
echo "- ANTHROPIC_API_KEY (권장)"
echo "- OPENAI_API_KEY"
echo "- PERPLEXITY_API_KEY"
echo "- 기타 필요한 서비스들..."
echo ""

# 6. 설치 확인
echo "🔍 설치 확인 중..."
echo "MCP 서버 목록을 확인합니다..."
claude mcp list

echo ""
echo "✅ SuperClaude + Task Master 설정이 완료되었습니다!"
echo ""
echo "🧪 테스트해볼 명령어들:"
echo "claude"
echo "그 후 다음 명령어들 시도:"
echo "/analyze"
echo "/build"
echo "/implement"
echo "/improve"
echo ""
echo "📚 더 많은 정보는 SETUP_GUIDE.md를 참조하세요."