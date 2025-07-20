# SuperClaude + Task Master Configuration Package

**완전한 SuperClaude 프레임워크와 Task Master AI 설정 패키지**

이 레파지토리는 Claude Code에서 SuperClaude 프레임워크와 Task Master AI를 포함한 완전한 개발 환경을 다른 PC로 쉽게 이전할 수 있도록 구성된 설정 패키지입니다.

## 🚀 포함된 기능들

### SuperClaude 프레임워크
- **고급 명령어 시스템**: `/analyze`, `/build`, `/implement`, `/improve` 등
- **지능형 페르소나**: 도메인별 전문 AI 어시스턴트 자동 활성화
- **MCP 서버 통합**: Context7, Playwright, Memory-keeper 자동 연동
- **파라미터 플래그**: `--think`, `--ultrathink`, `--uc` 등 고급 옵션

### Task Master AI
- **프로젝트 관리**: AI 기반 작업 추적 및 관리
- **31개 도구**: 프로젝트 초기화부터 완료까지 전체 워크플로 지원
- **다중 AI 모델**: Anthropic, OpenAI, Perplexity 등 통합 지원

### MCP 서버들
- **Context7**: 라이브러리 문서화 및 연구
- **Playwright**: 브라우저 자동화 및 E2E 테스트
- **Memory-keeper**: 지식 그래프 및 메모리 관리
- **Task Master**: AI 기반 프로젝트 관리

## 📦 설치 방법

### 빠른 설치

```bash
# 레파지토리 클론
git clone [REPO_URL]
cd superclaude-taskmaster-config

# Linux/macOS/WSL
./setup.sh

# Windows PowerShell (관리자 권한)
.\setup.ps1
```

### 수동 설치

1. **전제 조건 확인**
   - Node.js v18+ 
   - Claude Code 최신 버전

2. **설정 파일 복사**
   ```bash
   # Linux/macOS/WSL
   cp .claude.json ~/.claude.json
   cp settings.json ~/.claude/settings.json
   cp .superclaude-metadata.json ~/.claude/.superclaude-metadata.json
   cp *.md ~/.claude/
   ```

3. **API 키 설정**
   ```bash
   nano ~/.claude.json
   ```
   다음 키들을 실제 값으로 변경:
   - `ANTHROPIC_API_KEY` (권장)
   - `OPENAI_API_KEY`
   - `PERPLEXITY_API_KEY`

## 🎯 SuperClaude 명령어 예제

```bash
# 프로젝트 분석
/analyze --think-hard --focus security

# UI 컴포넌트 구현
/implement --magic "사용자 로그인 폼"

# 성능 최적화
/improve --focus performance --loop

# 프로젝트 빌드
/build --validate --uc
```

## 🔧 Task Master 사용법

```bash
# Claude Code 세션에서:
# 프로젝트 초기화
> Can you initialize Task Master in my project?

# 첫 작업 추가
> Can you help me add my first task: 사용자 인증 시스템 구현

# 작업 상태 확인
> What's the next task I should work on?

# 작업 완료 표시
> Can you mark task [ID] as done?
```

## 📋 파일 구조

```
├── CLAUDE.md              # SuperClaude 메인 진입점
├── COMMANDS.md             # 명령어 실행 프레임워크
├── FLAGS.md                # 플래그 시스템 레퍼런스
├── PRINCIPLES.md           # 핵심 개발 원칙
├── RULES.md                # 실행 가능한 규칙들
├── MCP.md                  # MCP 서버 통합 레퍼런스
├── PERSONAS.md             # 전문화된 페르소나 시스템
├── ORCHESTRATOR.md         # 지능형 라우팅 시스템
├── MODES.md                # 운영 모드 레퍼런스
├── .claude.json            # Claude Code 전체 설정
├── settings.json           # Claude Code 기본 설정
├── .superclaude-metadata.json # SuperClaude 메타데이터
├── SETUP_GUIDE.md          # 상세한 설정 가이드
├── setup.sh                # Linux/macOS 자동 설정 스크립트
└── setup.ps1               # Windows PowerShell 자동 설정 스크립트
```

## 🔍 설치 확인

설치 완료 후 다음으로 확인:

```bash
# MCP 서버들이 로드되었는지 확인
claude mcp list

# 예상 출력:
# task-master-ai: npx -y --package=task-master-ai task-master-ai
# context7: npx -y @upstash/context7-mcp
# playwright: npx -y @playwright/mcp@latest
# memory-keeper: npx -y @modelcontextprotocol/server-memory
```

Claude Code 세션에서 SuperClaude 명령어들 테스트:
- `/analyze` ✅
- `/build` ✅  
- `/implement` ✅
- `/improve` ✅

## 🛠️ 문제 해결

### MCP 서버 로드 실패
```bash
# 디버그 모드로 실행
claude --debug
# 2분 후 /mcp 명령어 실행
```

### API 키 오류
- `.claude.json`에서 API 키가 올바르게 설정되었는지 확인
- 최소 1개의 AI 서비스 API 키 필요 (Anthropic 권장)

### Windows 경로 문제
- JSON에서 경로 구분자는 `\\\\` (이중 이스케이프) 사용

## 📚 추가 자료

- [SETUP_GUIDE.md](./SETUP_GUIDE.md) - 상세한 설정 가이드
- [Task Master 공식 문서](https://github.com/eyaltoledano/claude-task-master)
- [Claude Code 문서](https://docs.anthropic.com/en/docs/claude-code)

## 🤝 기여하기

이 설정 패키지 개선에 기여하고 싶으시다면:
1. Fork 하기
2. Feature 브랜치 생성
3. 변경사항 커밋
4. Pull Request 생성

## 📄 라이선스

이 설정 패키지는 MIT 라이선스 하에 배포됩니다.

---

**🎉 이제 Claude Code에서 SuperClaude의 모든 기능을 활용하여 더 효율적이고 지능적인 개발 환경을 경험하세요!**