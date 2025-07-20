# 🚀 MCP Workspace with Jenkins Integration

**모든 PC에서 한 번의 명령어로 Jenkins MCP 서버를 자동 설정하는 워크스페이스**

이 레파지토리는 Jenkins CI/CD 통합을 포함한 완전한 MCP (Model Context Protocol) 환경을 어떤 컴퓨터에서든 쉽게 구축할 수 있도록 구성된 이식 가능한 워크스페이스입니다.

## ✨ 주요 특징

- 🎯 **One-Command Setup**: `./scripts/quick-setup.sh` 하나로 모든 설정 완료
- 🔄 **Portable**: Git clone 후 즉시 사용 가능
- 🛡️ **Secure**: 환경 변수로 민감 정보 관리
- 🌍 **Cross-Platform**: Windows, macOS, Linux 모두 지원
- 📦 **Project-Based**: 프로젝트별 독립적인 MCP 환경

## 🚀 빠른 시작

### 새 컴퓨터에서 5분 만에 설정하기

```bash
# 1. 저장소 클론
git clone [이 저장소 URL]
cd mcp

# 2. 자동 설정 실행
./scripts/quick-setup.sh

# 3. Jenkins 설정 (선택사항)
nano .env  # Jenkins URL과 자격 증명 입력

# 4. Claude Desktop 재시작
# → 완료! 🎉
```

## 🔧 설치된 MCP 서버

### ✅ 기본 설치 (자동)
- **Jenkins** - CI/CD 자동화, 빌드 관리
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

## ⚙️ 환경 설정

### Jenkins 연결 설정
`.env` 파일을 편집하여 Jenkins 서버 정보를 입력하세요:

```bash
JENKINS_URL=http://your-jenkins-server:8080
JENKINS_USERNAME=your-username
JENKINS_PASSWORD=your-api-token
```

### 추가 MCP 서버 활성화
Claude Desktop 설정 파일에서 `disabled: true`를 제거하고 주석을 해제하세요:

```json
{
  "mcpServers": {
    "reddit": {
      "command": "npx",
      "args": ["-y", "@ocdevel/mcp-reddit"],
      "env": { ... }
    }
  }
}
```

## 🏢 회사 프로젝트에서 사용하기

### 방법 1: 팀 공유용 설정 (권장)
```bash
# 1. 회사 Git에 이 저장소를 복사
# 2. 팀 공통 Jenkins URL을 .env.template에 설정
# 3. 각 개발자가 clone 후 setup 실행
git clone your-company/mcp-workspace
cd mcp-workspace
./scripts/quick-setup.sh
```

### 방법 2: 기존 프로젝트에 통합
```bash
# 기존 프로젝트에 MCP 설정 추가
cd your-existing-project
git submodule add [저장소 URL] .mcp
cd .mcp
./scripts/quick-setup.sh
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
mcp/
├── package.json              # 의존성 및 스크립트 정의
├── scripts/
│   ├── setup-mcp.js         # 자동 설정 메인 스크립트
│   └── quick-setup.sh       # 빠른 설정 배시 스크립트
├── .env.template            # 환경 변수 템플릿
├── .env                     # 실제 환경 변수 (Git 제외)
├── .gitignore              # Git 무시 파일 목록
├── README.md               # 이 파일
└── PORTABLE_SETUP_GUIDE.md # 상세 설정 가이드
```

## 🎯 사용 예시

### CI/CD 파이프라인 자동화
```
사용자: "Jenkins에서 프론트엔드 빌드를 시작해줘"
Claude: jenkins_start_job을 사용하여 빌드 시작
```

### 코드 품질 관리
```
사용자: "현재 빌드의 코드 커버리지를 확인해줘"
Claude: jenkins_get_coverage_report로 커버리지 보고서 제공
```

### 배포 관리
```
사용자: "스테이징 환경 배포 상태는 어떻게 돼?"
Claude: jenkins_get_job_status로 배포 상태 확인
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

**✨ 이제 질문에 대한 답:**

## ❓ 매번 Git 동기화가 필요한가?

**아니요! 이제 필요없습니다.**

### ✅ 새로운 방식의 장점:

1. **한 번만 설정**: 첫 PC에서 이 저장소를 설정
2. **Git으로 공유**: 팀 전체가 동일한 설정 사용
3. **자동 설치**: 새 PC에서 `git clone` + `./quick-setup.sh`만 실행
4. **독립적 운영**: 각 프로젝트마다 별도 Git 동기화 불필요

### 🔄 워크플로우:

```bash
# 처음 한 번만 (팀 리더가 설정)
1. 이 MCP 워크스페이스 구성
2. 회사 Git에 업로드

# 새 개발자 / 새 PC (1분 설정)
1. git clone company/mcp-workspace
2. ./scripts/quick-setup.sh
3. Claude Desktop 재시작
4. 완료! 🎉

# 회사 프로젝트에서 사용
- 별도 Git 동기화 불필요
- 모든 프로젝트에서 Jenkins MCP 사용 가능
```

**만든 사람**: MCP Workspace Team  
**버전**: 1.0.0  
**최종 업데이트**: 2025-07-21