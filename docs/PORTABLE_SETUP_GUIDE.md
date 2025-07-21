# 🚀 MCP Workspace 이식 가능한 설정 가이드

이제 **매번 MCP 서버를 다시 설치할 필요가 없습니다!**
이 가이드를 따라하면 어떤 컴퓨터에서든 빠르게 MCP 환경을 구축할 수 있습니다.

## 🎯 해결된 문제점

### ❌ 이전 방식 (매번 수동 설정)

- 새 PC마다 MCP 서버 전역 설치 필요
- Claude Desktop 설정 파일 수동 생성
- 환경 변수 반복 설정
- 매 프로젝트마다 Git 동기화 필요

### ✅ 새로운 방식 (자동화된 이식 가능 설정)

- **한 번의 명령어**로 모든 설정 완료
- **프로젝트별 의존성** 관리
- **환경 독립적** 설정
- **Git으로 설정 공유** 가능

## 🛠️ 새 컴퓨터에서 설정하기

### 1단계: 저장소 클론

```bash
git clone [이 저장소 URL]
cd mcp
```

### 2단계: 자동 설정 실행

```bash
# 방법 1: 빠른 설정 스크립트 (권장)
./setup.sh

# 방법 2: npm 스크립트
npm install
npm run setup-mcp
```

### 3단계: 환경 변수 설정

```bash
# .env 파일 편집
cp .env.template .env
nano .env  # 또는 원하는 에디터 사용
```

### 4단계: Claude Desktop 재시작

Claude Desktop을 재시작하면 모든 MCP 서버가 자동으로 연결됩니다.

## 📁 프로젝트 구조

```
mcp/
├── package.json              # 프로젝트 의존성 및 스크립트
├── scripts/
│   ├── setup-mcp.js         # 자동 설정 스크립트
│   └── setup.sh       # 빠른 설정 배시 스크립트
├── .env.template            # 환경 변수 템플릿
├── .env                     # 실제 환경 변수 (git에 포함되지 않음)
├── .gitignore              # Git 무시 파일 목록
└── PORTABLE_SETUP_GUIDE.md # 이 가이드
```

## 🔧 지원되는 MCP 서버

이 설정에 포함된 MCP 서버들:

| 서버 | 기능 | 환경 변수 필요 |
|------|------|----------------|
| **Jenkins** | CI/CD 자동화 | ✅ JENKINS_* |
| **Playwright** | 브라우저 자동화 | ❌ |
| **Reddit** | Reddit API | ✅ REDDIT_* |
| **Memory Keeper** | 지식 그래프 | ❌ |
| **Task Master** | 작업 관리 | ❌ |
| **Context7** | 문서화 도구 | ❌ |
| **IDE** | IDE 통합 | ❌ |
| **StackOverflow** | 질의응답 | ❌ |

## 🌍 플랫폼별 설정 경로

자동 설정 스크립트가 플랫폼을 감지하여 올바른 경로에 설정 파일을 생성합니다:

- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%\\Claude\\claude_desktop_config.json`
- **Linux**: `~/.config/claude-desktop/claude_desktop_config.json`

## 🔐 보안 고려사항

### Git에 포함되지 않는 파일들

- `.env` (실제 환경 변수)
- `node_modules/` (의존성)
- 각종 로그 및 임시 파일

### 안전하게 공유되는 파일들

- `.env.template` (환경 변수 예시)
- `package.json` (의존성 정의)
- 설정 스크립트들

## 🚀 회사 프로젝트에서 사용하기

### 방법 1: Git 서브모듈 (권장)

```bash
cd your-company-project
git submodule add [이 저장소 URL] mcp-config
cd mcp-config
./setup.sh
```

### 방법 2: 설정 파일 복사

```bash
cp -r /path/to/mcp/scripts your-project/
cp /path/to/mcp/package.json your-project/
cp /path/to/mcp/.env.template your-project/
cd your-project
./setup.sh
```

### 방법 3: 전역 설정 (한 번만)

```bash
cd /path/to/mcp
./setup.sh
# 이후 모든 프로젝트에서 MCP 서버 사용 가능
```

## 🧪 테스트 및 확인

### Jenkins MCP 서버 테스트

```bash
npm run test-jenkins
```

### 모든 MCP 서버 확인

Claude Desktop에서 다음과 같이 확인할 수 있습니다:

- 새 대화 시작
- MCP 서버 상태 확인
- Jenkins 관련 명령어 사용 가능 여부 확인

## 🔄 업데이트 방법

### MCP 서버 업데이트

```bash
npm update
npm run setup-mcp
```

### 새 MCP 서버 추가

1. `package.json`의 `dependencies`에 새 패키지 추가
2. `scripts/setup-mcp.js`의 `mcpServers` 설정에 추가
3. `npm run setup-mcp` 실행

## 💡 팁과 권장사항

### 🎯 회사 프로젝트 권장 워크플로우

1. **이 저장소를 회사 내부 Git에 복사**
2. **팀 공통 환경 변수 설정을 `.env.template`에 추가**
3. **각 개발자는 자신의 PC에서 `git clone` 후 `setup.sh` 실행**
4. **개인별 환경 변수는 `.env`에서 설정**

### 🔧 문제 해결

- **Node.js 버전**: v16 이상 권장
- **권한 오류**: 스크립트 실행 권한 확인 (`chmod +x scripts/*.sh`)
- **Claude Desktop**: 설정 변경 후 반드시 재시작

### 📝 커스터마이징

- 회사별 Jenkins URL은 `.env.template`에 미리 설정
- 불필요한 MCP 서버는 `package.json`에서 제거
- 추가 보안 설정은 `scripts/setup-mcp.js`에서 구현

---

## 🎉 결론

이제 **매번 MCP 설정을 다시 할 필요가 없습니다!**

✅ **Git clone** → **./setup.sh** → **Claude Desktop 재시작** → **완료!**

팀원들과 이 설정을 공유하여 모두가 동일한 MCP 환경에서 작업할 수 있습니다.
