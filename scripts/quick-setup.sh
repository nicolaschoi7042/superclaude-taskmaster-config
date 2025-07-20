#!/bin/bash
# MCP Workspace 빠른 설정 스크립트

echo "🚀 MCP Workspace 빠른 설정을 시작합니다..."

# Node.js 확인
if ! command -v node &> /dev/null; then
    echo "❌ Node.js가 설치되어 있지 않습니다."
    echo "Node.js를 먼저 설치해주세요: https://nodejs.org"
    exit 1
fi

# npm 확인
if ! command -v npm &> /dev/null; then
    echo "❌ npm이 설치되어 있지 않습니다."
    exit 1
fi

echo "✅ Node.js 및 npm이 설치되어 있습니다."

# 현재 디렉토리에 package.json이 있는지 확인
if [ ! -f "package.json" ]; then
    echo "❌ package.json을 찾을 수 없습니다."
    echo "MCP workspace 디렉토리에서 실행해주세요."
    exit 1
fi

# 의존성 설치 및 MCP 설정
echo "📦 의존성을 설치하고 MCP를 설정합니다..."
npm install && npm run setup-mcp

echo ""
echo "🎉 설정이 완료되었습니다!"
echo ""
echo "📋 다음 단계:"
echo "1. .env 파일을 편집하여 Jenkins 설정을 입력하세요"
echo "2. Claude Desktop을 재시작하세요"
echo "3. 'npm run test-jenkins'로 Jenkins MCP 서버를 테스트하세요"
echo ""
echo "💡 팁: 다른 프로젝트에서도 이 설정을 사용하려면"
echo "   이 전체 폴더를 복사하거나 git clone 후 ./scripts/quick-setup.sh를 실행하세요"