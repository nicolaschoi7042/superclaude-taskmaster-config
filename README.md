# 🚀 SuperClaude TaskMaster Configuration Package

**Claude Code SuperClaude 프레임워크를 위한 완전한 설정 패키지**

이 저장소는 Claude Code에서 SuperClaude 프레임워크를 사용하기 위한 모든 설정과 MCP (Model Context Protocol) 서버 통합을 포함한 완전한 구성 패키지입니다.

## ✨ 주요 특징

- 🧠 **SuperClaude Framework**: 11개 전문 페르소나와 지능형 명령 시스템
- 🎯 **One-Command Setup**: `./scripts/setup.sh` 하나로 모든 설정 완료
- 🔄 **Portable**: Git clone 후 즉시 사용 가능
- 🛡️ **Secure**: 환경 변수로 민감 정보 관리
- 🌍 **Cross-Platform**: Windows, macOS, Linux 모두 지원
- 📦 **MCP Integration**: Jenkins, Playwright 등 MCP 서버 자동 설정

## 🚀 빠른 시작

### 새 컴퓨터에서 5분 만에 설정하기

```bash
# 1. 저장소 클론
git clone [이 저장소 URL]
cd superclaude-taskmaster-config

# 2. 자동 설정 실행
./scripts/setup.sh

# 3. API 키 설정
nano ~/.claude.json  # Anthropic API 키 등 설정

# 4. Claude Desktop 재시작
# → 완료! 🎉
```

## 🔧 설치된 MCP 서버

### ✅ 기본 설치 (자동)
- **Playwright** - 브라우저 자동화, E2E 테스트
- **Task Master AI** - 작업 관리 및 오케스트레이션
- **Filesystem** - 안전한 파일 시스템 접근 (@modelcontextprotocol/server-filesystem)

### 🔌 선택적 설치 (설정에서 활성화)
- **Jenkins** - CI/CD 자동화, 빌드 관리 (개발 환경용)
- **Reddit** - Reddit 콘텐츠 검색 및 상호작용 (systemprompt-mcp-reddit)
- **Context7** - 라이브러리 문서화 및 패턴 검색
- **StackOverflow** - 프로그래밍 Q&A 검색 (@notalk-tech/stackoverflow-mcp)

## 📊 MCP 서버 기능

### 🎭 Playwright MCP
브라우저 자동화 및 E2E 테스트:
- 멀티 브라우저 지원 (Chrome, Firefox, Safari, Edge)
- 스크린샷 및 영상 캡처
- 성능 메트릭 측정
- 접근성 테스트 자동화

### 🤖 Task Master AI MCP
작업 관리 및 오케스트레이션:
- 복잡한 작업의 다단계 분해
- 진행 상황 추적 및 관리
- 작업 우선순위 및 의존성 관리

### 📁 Filesystem MCP
안전한 파일 시스템 접근:
- 워크스페이스 내 파일 읽기/쓰기
- 디렉토리 구조 탐색 및 분석
- 프로젝트 파일 관리 및 생성
- 샌드박스 보안 (지정 디렉토리 내에서만 작업)

### 📚 선택적 MCP 서버들

#### Reddit MCP (systemprompt-mcp-reddit)
- Reddit 콘텐츠 검색 및 분석
- 트렌드 및 토론 모니터링
- AI 에이전트 통합 상호작용

#### StackOverflow MCP (@notalk-tech/stackoverflow-mcp)
- 프로그래밍 Q&A 검색
- 기술 문제 해결 지원
- 코딩 패턴 및 모범 사례 검색

#### Context7 MCP
- 라이브러리 공식 문서 조회
- 프레임워크 패턴 검색
- 코드 예제 및 베스트 프랙티스

#### Jenkins MCP (개발 환경용)
CI/CD 자동화 도구 (11개 기능):
- 빌드 관리, 상태 조회, 커버리지 분석 등

## ⚙️ 환경 설정

### API 키 설정
SuperClaude 프레임워크 사용을 위한 필수 설정:

```bash
# ~/.claude.json 편집
{
  "anthropic_api_key": "your-anthropic-api-key"
}
```

### 선택적 MCP 서버 활성화
Claude Desktop 설정 파일(`~/.config/claude-desktop/claude_desktop_config.json`)에서 원하는 서버의 `disabled: true`를 제거:

```json
{
  "mcpServers": {
    "reddit": {
      "command": "npx",
      "args": ["-y", "systemprompt-mcp-reddit"],
      "env": {
        "SYSTEMPROMPT_API_KEY": "your-key",
        "REDDIT_CLIENT_ID": "your-id"
      }
    },
    "stackoverflow": {
      "command": "npx", 
      "args": ["-y", "@notalk-tech/stackoverflow-mcp"],
      "env": {}
    }
  }
}
```

### 개발 환경용 Jenkins 설정 (선택사항)
```bash
# config/.env 파일 편집
JENKINS_URL=http://your-jenkins-server:8080
JENKINS_USERNAME=your-username
JENKINS_PASSWORD=your-api-token
```

## 🏢 회사 프로젝트에서 사용하기

### 방법 1: 팀 공유용 설정 (권장)
```bash
# 1. 회사 Git에 이 저장소를 복사
# 2. 팀 공통 Jenkins URL을 .env.template에 설정
# 3. 각 개발자가 clone 후 setup 실행
git clone your-company/mcp-workspace
cd mcp-workspace
./scripts/setup.sh
```

### 방법 2: 기존 프로젝트에 통합
```bash
# 기존 프로젝트에 MCP 설정 추가
cd your-existing-project
git submodule add [저장소 URL] .mcp
cd .mcp
./scripts/setup.sh
```

## 🔍 문제 해결

### 일반적인 문제들

**Node.js 버전 오류**
```bash
# Node.js v16 이상 필요
node --version
```

**권한 오류**
```bash
chmod +x scripts/*.sh
```

**Claude Desktop 연결 실패**
1. Claude Desktop 완전 재시작
2. 설정 파일 경로 확인
3. MCP 서버 로그 확인

### 테스트 명령어

```bash
# Jenkins MCP 서버 테스트
npm run test-jenkins

# 설정 파일 위치 확인
node -e "console.log(require('./scripts/setup-mcp.js').getClaudeConfigPath())"

# 전체 재설정
rm -rf node_modules && npm run setup-mcp
```

## 📁 프로젝트 구조

```
superclaude-taskmaster-config/
├── CLAUDE.md                 # SuperClaude 진입점 및 통합 참조
├── README.md                 # 이 파일
├── config/                   # 핵심 설정 파일들
│   ├── COMMANDS.md          # 명령어 시스템 프레임워크
│   ├── FLAGS.md             # 플래그 시스템 참조
│   ├── PRINCIPLES.md        # 핵심 개발 원칙
│   ├── RULES.md             # 실행 가능한 규칙들
│   ├── PERSONAS.md          # 11개 전문 페르소나 시스템
│   ├── ORCHESTRATOR.md      # 지능형 라우팅 시스템
│   ├── MODES.md             # 운영 모드 참조
│   ├── package.json         # MCP 의존성 및 스크립트
│   └── settings.json        # Claude 설정
├── mcp/                     # MCP 서버 설정
│   ├── MCP.md              # MCP 서버 통합 참조
│   └── MCP_SERVERS_GUIDE.md # MCP 서버 가이드
├── docs/                    # 문서화
│   ├── SETUP_GUIDE.md      # 상세 설정 가이드
│   ├── PORTABLE_SETUP_GUIDE.md # 이식 가능한 설정
│   └── jenkins-setup-guide.md # Jenkins 특화 가이드
└── scripts/                 # 설정 스크립트
    ├── setup.sh            # Linux/macOS/WSL 설정
    ├── setup.ps1           # Windows PowerShell 설정
    └── setup-mcp.js        # MCP 서버 설정 스크립트
```

## 🎯 SuperClaude 사용 예시

### 지능형 명령어 시스템
```bash
# 코드 분석 (analyzer 페르소나 자동 활성화)
/analyze @src/ --focus security

# UI 컴포넌트 구현 (frontend 페르소나 + Magic MCP)
/implement "사용자 로그인 폼 컴포넌트"

# 성능 최적화 (performance 페르소나 + Sequential MCP)
/improve @components/ --focus performance

# 시스템 설계 (architect 페르소나 + Context7 MCP)
/design "마이크로서비스 아키텍처"
```

### Wave 모드 자동 활성화
```bash
# 복잡도 ≥0.7 + 파일 수 >20 + 작업 유형 >2 → Wave 모드 자동 활성화
/improve @entire-system/ --comprehensive

# 다단계 분석과 점진적 개선
사용자: "전체 시스템을 체계적으로 개선해줘"
Claude: Wave 모드로 분석 → 계획 → 구현 → 검증의 다단계 실행
```

### MCP 서버 통합
```bash
# Playwright E2E 테스트
사용자: "로그인 플로우 E2E 테스트 실행해줘"
Claude: Playwright MCP로 자동 브라우저 테스트 실행

# StackOverflow 기술 검색
사용자: "React hooks 사용법에 대한 질문들 찾아줘"
Claude: StackOverflow MCP로 관련 Q&A 검색 및 분석

# Reddit 커뮤니티 모니터링
사용자: "AI 개발 관련 최신 트렌드 확인해줘"
Claude: Reddit MCP로 관련 서브레딧 분석

# Context7 문서 검색
사용자: "Next.js 최신 라우팅 패턴 알려줘"
Claude: Context7 MCP로 공식 문서 패턴 검색

# Filesystem 파일 관리
사용자: "프로젝트의 package.json을 분석하고 최적화 제안해줘"
Claude: Filesystem MCP로 파일 읽기 → 의존성 분석 및 개선 제안

# 설정 파일 생성
사용자: "TypeScript 프로젝트용 .gitignore 파일 생성해줘"
Claude: Filesystem MCP로 .gitignore 파일 생성 및 내용 작성
```

## 🤝 기여하기

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 라이선스

MIT License - 자유롭게 사용, 수정, 배포 가능합니다.

## 🙋‍♂️ 지원

- 📋 [이슈 트래커](./issues)에서 버그 신고 및 기능 요청
- 📖 [상세 설정 가이드](./PORTABLE_SETUP_GUIDE.md) 참조
- 💬 팀 내 Slack/Discord에서 질문

---

## 📋 SuperClaude 핵심 구성 요소

### 🧠 페르소나 시스템 (11개)
- **architect**: 시스템 아키텍처 전문가
- **frontend**: UI/UX 및 접근성 전문가  
- **backend**: 신뢰성 엔지니어, API 전문가
- **analyzer**: 근본 원인 분석 전문가
- **security**: 위협 모델링, 취약점 전문가
- **performance**: 최적화 전문가
- **qa**: 품질 보증, 테스팅 전문가
- **refactorer**: 코드 품질 전문가
- **devops**: 인프라 전문가
- **mentor**: 지식 전수 전문가
- **scribe**: 전문 문서 작성가

### ⚡ 지능형 라우팅
- **자동 페르소나 활성화**: 작업 유형별 전문가 자동 배정
- **MCP 서버 선택**: 작업에 최적화된 서버 자동 활성화
- **Wave 모드**: 복잡한 작업의 다단계 오케스트레이션
- **품질 게이트**: 8단계 검증 사이클

### 🌊 Wave 오케스트레이션
복잡도 ≥0.7 + 파일 수 >20 + 작업 유형 >2일 때 자동 활성화되는 다단계 실행 시스템

## 🔄 워크플로우

### 팀 설정 (한 번만)
```bash
# 1. 팀 저장소에 설정 공유
git clone your-team/superclaude-taskmaster-config
cd superclaude-taskmaster-config

# 2. 팀 환경에 맞게 설정 커스터마이징
nano config/.env.template  # 팀 공통 설정

# 3. 팀 저장소에 푸시
git add . && git commit -m "Add team SuperClaude config"
git push
```

### 개발자 개별 설정 (5분)
```bash
# 1. 클론 및 설정
git clone your-team/superclaude-taskmaster-config
cd superclaude-taskmaster-config
./scripts/setup.sh

# 2. 개인 API 키 설정
nano ~/.claude.json

# 3. Claude Desktop 재시작
# 완료! 🎉
```

---

## 📎 부록: Jenkins CI/CD 통합 가이드

### Jenkins MCP 서버 상세 기능

Jenkins 서버와 연동하여 다음 11개 도구를 사용할 수 있습니다:

| 도구 | 기능 | 사용 예시 |
|------|------|----------|
| `jenkins_get_job_status` | 작업 상태 조회 | 빌드 진행 상황 확인 |
| `jenkins_start_job` | 빌드 시작 | 자동 배포 트리거 |
| `jenkins_stop_job` | 빌드 중지 | 문제 발생 시 긴급 중단 |
| `jenkins_get_build_steps` | 빌드 단계 상세 정보 | 실패 지점 분석 |
| `jenkins_get_node_status` | Jenkins 노드 상태 | 인프라 모니터링 |
| `jenkins_get_pending_actions` | 대기 중인 액션 목록 | 승인 대기 작업 확인 |
| `jenkins_submit_input_action` | 입력 액션 제출 | 수동 승인 프로세스 |
| `jenkins_get_coverage_report` | 코드 커버리지 보고서 | 품질 게이트 검증 |
| `jenkins_get_coverage_lines` | 커버리지 라인별 분석 | 상세 코드 분석 |
| `jenkins_get_coverage_paths` | 커버리지 경로 분석 | 모듈별 품질 확인 |
| `jenkins_get_git_branches` | Git 브랜치 정보 | 브랜치 전략 관리 |

### Jenkins 환경 설정

#### 1. Jenkins MCP 서버 활성화
```json
// ~/.config/claude-desktop/claude_desktop_config.json
{
  "mcpServers": {
    "jenkins": {
      "command": "npx",
      "args": ["@grec0/mcp-jenkins"],
      "env": {
        "JENKINS_URL": "http://your-jenkins-server:8080",
        "JENKINS_USERNAME": "your-username",
        "JENKINS_PASSWORD": "your-api-token"
      }
    }
  }
}
```

#### 2. 환경 변수 설정
```bash
# config/.env 파일
JENKINS_URL=http://your-jenkins-server:8080
JENKINS_USERNAME=your-username
JENKINS_PASSWORD=your-jenkins-api-token
```

### CI/CD 자동화 시나리오

#### 개발 워크플로우 자동화
```bash
# 시나리오 1: 풀 리퀘스트 빌드
사용자: "PR #123의 빌드를 시작하고 결과 알려줘"
Claude: jenkins_start_job → jenkins_get_job_status → 결과 보고

# 시나리오 2: 코드 품질 검증
사용자: "최신 빌드의 커버리지 리포트 분석해줘"
Claude: jenkins_get_coverage_report → 상세 분석 및 개선점 제안

# 시나리오 3: 배포 파이프라인 관리
사용자: "스테이징 배포 상태와 대기 중인 승인 확인해줘"
Claude: jenkins_get_job_status + jenkins_get_pending_actions → 종합 상황 보고
```

#### 인프라 모니터링
```bash
# 빌드 노드 상태 확인
사용자: "Jenkins 클러스터 상태 점검해줘"
Claude: jenkins_get_node_status → 노드별 상태 분석

# 브랜치 전략 관리
사용자: "현재 활성 브랜치들과 각각의 빌드 상태 확인해줘"
Claude: jenkins_get_git_branches + jenkins_get_job_status → 브랜치별 상태 매핑
```

### 팀 환경 설정

#### 공통 Jenkins 설정 공유
```bash
# 1. 팀 공통 설정 (config/.env.template)
JENKINS_URL=http://company-jenkins.internal:8080
JENKINS_USERNAME=${USER}
JENKINS_PASSWORD=

# 2. 개별 개발자 설정
cp config/.env.template config/.env
# 개인 API 토큰 입력
```

#### 보안 고려사항
- Jenkins API 토큰 사용 (패스워드 대신)
- 환경 변수로 민감 정보 관리
- `.env` 파일을 Git에서 제외
- 팀원별 개별 인증 정보 사용

### 문제 해결

#### 일반적인 문제들
```bash
# 연결 실패
ERROR: Unable to connect to Jenkins server
→ JENKINS_URL 및 네트워크 연결 확인

# 인증 실패  
ERROR: Authentication failed
→ JENKINS_USERNAME/PASSWORD 확인, API 토큰 재생성

# 권한 부족
ERROR: Access denied
→ Jenkins 사용자 권한 확인, 프로젝트 접근 권한 검토
```

#### 테스트 명령어
```bash
# Jenkins MCP 서버 연결 테스트
npm run test-jenkins

# 수동 도구 테스트
npx @grec0/mcp-jenkins --help
```

---

**만든 사람**: chc7042 (nicolas.choi)
**버전**: 2.0.0
**최종 업데이트**: 2025-07-21