# MCP Servers Configuration

이 디렉토리는 SuperClaude 프레임워크에서 사용하는 추가 MCP 서버들의 설정 파일을 포함합니다.

## 📁 구조

```
mcp-servers/
├── README.md           # 이 파일
├── filesystem.json     # Filesystem MCP 서버 설정
└── [future-servers].json
```

## 🔧 현재 설정된 MCP 서버

### ✅ 활성화된 서버
- **filesystem** (`@modelcontextprotocol/server-filesystem`)
  - 워크스페이스 내 파일 시스템 접근
  - 경로: `/home/roboe/workspace`
  - 보안: 디렉토리 기반 샌드박싱

### 🔌 선택적 서버들 (설정에서 활성화 가능)
- **jenkins** - CI/CD 자동화
- **reddit** - Reddit 콘텐츠 검색
- **context7** - 라이브러리 문서 검색
- **stackoverflow** - 프로그래밍 Q&A
- **playwright** - 브라우저 자동화

## 📊 Filesystem MCP 서버 기능

### 🔍 파일 작업
- **파일 읽기**: 텍스트 파일, 설정 파일, 소스 코드 읽기
- **파일 쓰기**: 새 파일 생성, 기존 파일 수정
- **디렉토리 탐색**: 프로젝트 구조 분석, 파일 목록 조회
- **메타데이터**: 파일 크기, 수정 시간, 권한 정보

### 🛡️ 보안 기능
- **샌드박싱**: 지정된 디렉토리(`/home/roboe/workspace`) 내에서만 작업
- **접근 제어**: 상위 디렉토리 접근 차단
- **안전한 경로**: 경로 순회 공격 방지

### 💡 사용 예시

```bash
# 프로젝트 파일 분석
사용자: "현재 프로젝트의 package.json 파일을 분석해줘"
Claude: filesystem MCP로 파일 읽기 → 의존성 분석 및 개선 제안

# 설정 파일 생성
사용자: ".gitignore 파일을 생성하고 Node.js 프로젝트에 맞게 설정해줘"
Claude: filesystem MCP로 .gitignore 파일 생성 및 내용 작성

# 코드 구조 분석
사용자: "src 디렉토리의 구조를 분석하고 아키텍처 개선점 알려줘"
Claude: filesystem MCP로 디렉토리 탐색 → 구조 분석 및 리팩토링 제안
```

## 🔧 새 MCP 서버 추가 방법

1. **서버 정보 파일 생성**
   ```bash
   # 새 서버 설정 파일 생성
   cp filesystem.json new-server.json
   # 내용 편집
   ```

2. **Claude Desktop 설정 업데이트**
   ```json
   // ~/.config/claude-desktop/claude_desktop_config.json
   {
     "mcpServers": {
       "new-server": {
         "command": "npx",
         "args": ["-y", "package-name"],
         "env": {}
       }
     }
   }
   ```

3. **테스트 및 검증**
   ```bash
   # 패키지 테스트
   npx -y package-name
   
   # Claude Desktop 재시작
   # 기능 확인
   ```

## 📋 MCP 서버 관리

### 활성화/비활성화
- **활성화**: Claude Desktop 설정에서 `disabled: true` 제거
- **비활성화**: `disabled: true` 추가
- **재시작**: Claude Desktop 재시작 필요

### 문제 해결
```bash
# 패키지 설치 확인
npx -y @modelcontextprotocol/server-filesystem /tmp

# 설정 파일 검증
cat ~/.config/claude-desktop/claude_desktop_config.json | jq

# 로그 확인 (Claude Desktop 콘솔)
```

---

**업데이트**: 2025-07-21  
**관리자**: SuperClaude Framework Team