# SuperClaude + Task Master 설정 이전 가이드

이 가이드는 현재 PC의 SuperClaude와 Task Master 설정을 다른 PC로 완전히 이전하는 방법을 설명합니다.

## 📁 포함된 파일들

이 폴더에는 다음과 같은 설정 파일들이 포함되어 있습니다:

### SuperClaude 프레임워크 파일들

- `CLAUDE.md` - SuperClaude 메인 진입점
- `COMMANDS.md` - 명령어 실행 프레임워크
- `FLAGS.md` - 플래그 시스템 레퍼런스
- `PRINCIPLES.md` - 핵심 개발 원칙
- `RULES.md` - 실행 가능한 규칙들
- `MCP.md` - MCP 서버 통합 레퍼런스
- `PERSONAS.md` - 전문화된 페르소나 시스템
- `ORCHESTRATOR.md` - 지능형 라우팅 시스템
- `MODES.md` - 운영 모드 레퍼런스

### Claude Code 설정 파일들

- `.claude.json` - Claude Code 전체 설정 (MCP 서버 설정 포함)
- `settings.json` - Claude Code 기본 설정
- `.superclaude-metadata.json` - SuperClaude 메타데이터

## 🚀 다른 PC에서 설정하는 방법

### 1단계: 전제 조건 확인

```bash
# Node.js 설치 확인 (v18 이상 필요)
node --version
npm --version

# Claude Code 설치 확인
claude --version
```

### 2단계: Claude Code 설정 디렉토리 준비

```bash
# Linux/macOS/WSL인 경우
mkdir -p ~/.claude

# Windows 네이티브인 경우
mkdir -p C:\Users\%USERNAME%\.claude
```

### 3단계: 설정 파일들 복사

```bash
# Linux/macOS/WSL인 경우
cp .claude.json ~/.claude.json
cp settings.json ~/.claude/settings.json
cp .superclaude-metadata.json ~/.claude/.superclaude-metadata.json
cp *.md ~/.claude/

# Windows 네이티브인 경우 (PowerShell)
Copy-Item .claude.json C:\Users\$env:USERNAME\.claude.json
Copy-Item settings.json C:\Users\$env:USERNAME\.claude\settings.json
Copy-Item .superclaude-metadata.json C:\Users\$env:USERNAME\.claude\.superclaude-metadata.json
Copy-Item *.md C:\Users\$env:USERNAME\.claude\
```

### 4단계: API 키 설정

`.claude.json` 파일을 편집하여 실제 API 키들을 입력하세요:

```bash
# Linux/macOS/WSL
nano ~/.claude.json

# Windows
notepad C:\Users\%USERNAME%\.claude.json
```

다음 API 키들을 실제 값으로 변경하세요:

- `ANTHROPIC_API_KEY`: "your_api_key_here" → 실제 Anthropic API 키
- `OPENAI_API_KEY`: "your_api_key_here" → 실제 OpenAI API 키
- `PERPLEXITY_API_KEY`: "your_api_key_here" → 실제 Perplexity API 키
- 기타 필요한 API 키들...

### 5단계: 설치 확인

```bash
# Claude Code 시작
claude

# MCP 서버 목록 확인
claude mcp list

# 다음이 나타나야 합니다:
# task-master-ai: npx -y --package=task-master-ai task-master-ai
# context7: npx -y @upstash/context7-mcp
# playwright: npx -y @playwright/mcp@latest
# memory-keeper: npx -y @modelcontextprotocol/server-memory
```

### 6단계: SuperClaude 명령어 테스트

Claude Code 세션에서 다음 명령어들을 테스트해보세요:

```
/analyze
/build
/implement
/improve
```

## 🔧 문제 해결

### MCP 서버가 로드되지 않는 경우

```bash
# 디버그 모드로 실행
claude --debug

# 2분 정도 기다린 후 MCP 명령어 실행
/mcp
```

### API 키 오류가 발생하는 경우

- `.claude.json` 파일에서 API 키가 올바르게 설정되었는지 확인
- 최소 1개의 AI 서비스 API 키는 반드시 필요 (Anthropic 권장)

### Windows 경로 문제

- JSON 파일에서 경로 구분자는 `\\\\` (이중 이스케이프) 사용
- 환경 변수 확장이 안 되는 경우 절대 경로 사용

## 📝 주의사항

1. **API 키 보안**: API 키가 포함된 파일들은 안전하게 보관하세요
2. **권한 설정**: Linux/macOS에서 `.claude.json` 파일은 600 권한으로 설정하는 것을 권장
3. **Node.js 버전**: Node.js v18 이상이 필요합니다
4. **네트워크**: MCP 서버들이 인터넷에서 패키지를 다운로드하므로 인터넷 연결이 필요합니다

## ✅ 성공 확인

모든 설정이 완료되면:

- SuperClaude 명령어들 (`/analyze`, `/build`, etc.)이 정상 작동
- Task Master 도구들이 사용 가능
- MCP 서버들이 모두 로드됨
- API 키 관련 오류가 없음

이제 원본 PC와 동일한 SuperClaude + Task Master 환경을 사용할 수 있습니다!
