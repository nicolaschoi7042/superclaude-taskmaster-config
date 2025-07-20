# 🚀 MCP Workspace with Jenkins Integration

**모든 PC에서 한 번의 명령어로 Jenkins MCP 서버를 자동 설정하는 워크스페이스**

이 레파지토리는 Jenkins CI/CD 통합을 포함한 완전한 MCP (Model Context Protocol) 환경을 어떤 컴퓨터에서든 쉽게 구축할 수 있도록 구성된 이식 가능한 워크스페이스입니다.

## ✨ 주요 특징

- 🎯 **One-Command Setup**: `./setup.sh` 하나로 모든 설정 완료
- 🔄 **Portable**: Git clone 후 즉시 사용 가능
- 🛡️ **Secure**: 환경 변수로 민감 정보 관리
- 🌍 **Cross-Platform**: Windows, macOS, Linux 모두 지원
- 📦 **Project-Based**: 프로젝트별 독립적인 MCP 환경

## 🔧 설치된 MCP 서버

### ✅ 기본 설치 (자동)
- **Jenkins** - CI/CD 자동화, 빌드 관리 (11개 도구)
- **Playwright** - 브라우저 자동화, E2E 테스트

### 🔌 선택적 설치 (설정에서 활성화)
- **Reddit** - Reddit API 통합
- **Context7** - 문서화 도구
- **StackOverflow** - 질의응답 검색

## 📊 Jenkins MCP 도구

Jenkins 서버와 연동하여 다음 작업을 자동화할 수 있습니다:

| 도구 | 기능 |
|------|------|
| `jenkins_get_job_status` | 작업 상태 조회 |
| `jenkins_start_job` | 빌드 시작 |
| `jenkins_stop_job` | 빌드 중지 |
| `jenkins_get_build_steps` | 빌드 단계 상세 정보 |
| `jenkins_get_node_status` | Jenkins 노드 상태 |
| `jenkins_get_pending_actions` | 대기 중인 액션 목록 |
| `jenkins_submit_input_action` | 입력 액션 제출 |
| `jenkins_get_coverage_report` | 코드 커버리지 보고서 |
| `jenkins_get_coverage_lines` | 커버리지 라인별 분석 |
| `jenkins_get_coverage_paths` | 커버리지 경로 분석 |
| `jenkins_get_git_branches` | Git 브랜치 정보 |

## 🚀 빠른 시작

### 새 컴퓨터에서 5분 만에 설정하기

```bash
# 1. 저장소 클론
git clone [이 저장소 URL]
cd mcp

# 2. 자동 설정 실행
./setup.sh

# 3. Jenkins 설정 (선택사항)
nano .env  # Jenkins URL과 자격 증명 입력

# 4. Claude Desktop 재시작
# → 완료! 🎉
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