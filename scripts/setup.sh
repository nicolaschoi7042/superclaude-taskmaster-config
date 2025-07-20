#!/bin/bash

# SuperClaude + Task Master 통합 설정 스크립트
# Linux/macOS/WSL용 - MCP Workspace 포함

set -e

echo "🚀 SuperClaude + Task Master + MCP Workspace 설정 시작..."

# 1. 전제 조건 확인
echo "📋 전제 조건 확인 중..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js가 설치되지 않았습니다. Node.js v18 이상을 설치해주세요."
    echo "설치 링크: https://nodejs.org"
    exit 1
fi

NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js 버전이 낮습니다. v18 이상이 필요합니다. 현재: $(node --version)"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm이 설치되지 않았습니다."
    exit 1
fi

if ! command -v claude &> /dev/null; then
    echo "❌ Claude Code가 설치되지 않았습니다. Claude Code를 먼저 설치해주세요."
    exit 1
fi

echo "✅ Node.js: $(node --version)"
echo "✅ npm: $(npm --version)"
echo "✅ Claude Code: $(claude --version)"

# 2. MCP Workspace 설정 (package.json 기반)
echo ""
echo "📦 MCP Workspace 설정 중..."

# config 디렉토리에서 package.json 찾기
if [ -f "../config/package.json" ]; then
    echo "✅ ../config/package.json 발견"
    cd ../config
    echo "의존성을 설치하고 MCP를 설정합니다..."
    npm install
    
    # setup-mcp 스크립트가 있다면 실행
    if npm run setup-mcp 2>/dev/null; then
        echo "✅ MCP 설정 완료"
    else
        echo "⚠️ setup-mcp 스크립트를 찾을 수 없습니다. 수동으로 MCP를 설정해야 할 수 있습니다."
    fi
    cd ../scripts
elif [ -f "../package.json" ]; then
    echo "✅ ../package.json 발견"
    cd ..
    echo "의존성을 설치하고 MCP를 설정합니다..."
    npm install
    
    if npm run setup-mcp 2>/dev/null; then
        echo "✅ MCP 설정 완료"
    else
        echo "⚠️ setup-mcp 스크립트를 찾을 수 없습니다."
    fi
    cd scripts
else
    echo "⚠️ package.json을 찾을 수 없습니다. MCP 설정을 건너뜁니다."
fi

# 3. Claude 설정 디렉토리 생성
echo ""
echo "📁 Claude 설정 디렉토리 준비 중..."
mkdir -p ~/.claude

# 4. 설정 파일들 복사
echo "📄 설정 파일들 복사 중..."

# .claude.json 파일 복사
if [ -f "../.claude.json" ]; then
    cp ../.claude.json ~/.claude.json
    echo "✅ .claude.json 복사 완료"
elif [ -f "../config/.claude.json" ]; then
    cp ../config/.claude.json ~/.claude.json
    echo "✅ config/.claude.json 복사 완료"
else
    echo "❌ .claude.json 파일을 찾을 수 없습니다."
    echo "⚠️ 수동으로 API 키를 설정해야 합니다."
fi

# settings.json 파일 복사
if [ -f "../config/settings.json" ]; then
    cp ../config/settings.json ~/.claude/settings.json
    echo "✅ settings.json 복사 완료"
elif [ -f "../settings.json" ]; then
    cp ../settings.json ~/.claude/settings.json
    echo "✅ settings.json 복사 완료"
fi

# .superclaude-metadata.json 파일 복사
if [ -f "../.superclaude-metadata.json" ]; then
    cp ../.superclaude-metadata.json ~/.claude/.superclaude-metadata.json
    echo "✅ .superclaude-metadata.json 복사 완료"
elif [ -f "../config/.superclaude-metadata.json" ]; then
    cp ../config/.superclaude-metadata.json ~/.claude/.superclaude-metadata.json
    echo "✅ .superclaude-metadata.json 복사 완료"
fi

# SuperClaude 설정 파일들 복사 (CLAUDE.md는 루트에서, 나머지는 config에서)
if [ -f "../CLAUDE.md" ]; then
    cp ../CLAUDE.md ~/.claude/
    echo "✅ CLAUDE.md 복사 완료"
fi

# config 디렉토리의 마크다운 파일들 복사
if [ -d "../config" ]; then
    for file in ../config/*.md; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            cp "$file" ~/.claude/
            echo "✅ $filename 복사 완료"
        fi
    done
fi

# mcp 디렉토리의 마크다운 파일들 복사
if [ -d "../mcp" ]; then
    for file in ../mcp/*.md; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            cp "$file" ~/.claude/
            echo "✅ $filename 복사 완료"
        fi
    done
fi

# 5. 권한 설정
echo ""
echo "🔒 파일 권한 설정 중..."
if [ -f ~/.claude.json ]; then
    chmod 600 ~/.claude.json
fi
chmod -R 644 ~/.claude/*.md 2>/dev/null || true
if [ -f ~/.claude/settings.json ]; then
    chmod 644 ~/.claude/settings.json
fi
if [ -f ~/.claude/.superclaude-metadata.json ]; then
    chmod 644 ~/.claude/.superclaude-metadata.json
fi

# 6. 환경 변수 설정 안내
echo ""
echo "🔧 환경 설정 안내..."

if [ -f "../config/.env.template" ]; then
    echo "📝 .env 파일 설정:"
    echo "config/.env.template을 참조하여 .env 파일을 생성하세요"
elif [ -f "../.env.template" ]; then
    echo "📝 .env 파일 설정:"
    echo ".env.template을 참조하여 .env 파일을 생성하세요"
fi

# 7. API 키 설정 안내
echo ""
echo "🔑 API 키 설정이 필요합니다!"
if [ -f ~/.claude.json ]; then
    echo "다음 명령어로 .claude.json 파일을 편집하여 API 키를 설정하세요:"
    echo ""
    echo "nano ~/.claude.json"
    echo ""
    echo "변경해야 할 API 키들:"
    echo "- ANTHROPIC_API_KEY (권장)"
    echo "- OPENAI_API_KEY"
    echo "- PERPLEXITY_API_KEY"
    echo "- 기타 필요한 서비스들..."
else
    echo "⚠️ .claude.json 파일이 없습니다. 수동으로 생성하고 API 키를 설정해주세요."
fi

# 8. 설치 확인
echo ""
echo "🔍 설치 확인 중..."
echo "MCP 서버 목록을 확인합니다..."
if claude mcp list 2>/dev/null; then
    echo "✅ MCP 서버 목록 확인 완료"
else
    echo "⚠️ MCP 서버 목록을 확인할 수 없습니다. Claude Desktop을 재시작해보세요."
fi

# 9. 최종 안내
echo ""
echo "✅ SuperClaude + Task Master + MCP Workspace 설정이 완료되었습니다!"
echo ""
echo "📋 다음 단계:"
echo "1. Claude Desktop을 재시작하세요"
echo "2. .env 파일을 편집하여 필요한 설정을 입력하세요"
if [ -f "../config/package.json" ] && npm run test-jenkins --prefix ../config 2>/dev/null; then
    echo "3. 'cd config && npm run test-jenkins'로 Jenkins MCP 서버를 테스트하세요"
elif [ -f "../package.json" ] && npm run test-jenkins --prefix .. 2>/dev/null; then
    echo "3. 'npm run test-jenkins'로 Jenkins MCP 서버를 테스트하세요"
fi

echo ""
echo "🧪 테스트해볼 명령어들:"
echo "claude"
echo "그 후 다음 명령어들 시도:"
echo "/analyze"
echo "/build"
echo "/implement"
echo "/improve"
echo ""
echo "📚 더 많은 정보:"
echo "- 설정 가이드: docs/SETUP_GUIDE.md"
echo "- 포터블 설정: docs/PORTABLE_SETUP_GUIDE.md"
echo "- Jenkins 설정: docs/jenkins-setup-guide.md"
echo ""
echo "💡 팁: 다른 프로젝트에서도 이 설정을 사용하려면"
echo "   이 전체 폴더를 복사하거나 git clone 후 ./scripts/setup.sh를 실행하세요"