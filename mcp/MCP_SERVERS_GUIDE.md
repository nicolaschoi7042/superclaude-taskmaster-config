# MCP 서버 설치 및 사용 가이드

이 가이드는 GitHub, Stack Overflow, Reddit MCP 서버 설치 및 설정 방법을 안내합니다.

## 설치된 MCP 서버

### 1. GitHub MCP 서버 (@andrebuzeli/github-mcp-v2)

**기능:**

- GitHub 리포지토리 관리
- 이슈 및 PR 관리
- 릴리스 관리
- CI/CD 통합
- 보안 및 프로젝트 관리
- 분석 도구

**설정:**

```json
{
  "github": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "@andrebuzeli/github-mcp-v2"],
    "env": {
      "GITHUB_TOKEN": "your_github_token_here"
    }
  }
}
```

**환경 변수 설정:**

- `GITHUB_TOKEN`: GitHub Personal Access Token 필요
  1. GitHub → Settings → Developer settings → Personal access tokens
  2. "Generate new token (classic)" 클릭
  3. 필요한 스코프 선택 (repo, issues, pull_requests 등)
  4. 생성된 토큰을 `GITHUB_TOKEN`에 설정

### 2. Stack Overflow MCP 서버 (@notalk-tech/stackoverflow-mcp)

**기능:**

- Stack Overflow 질문 검색
- 프로그래밍 Q&A 조회
- 기술적 문제 해결 지원

**설정:**

```json
{
  "stackoverflow": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "@notalk-tech/stackoverflow-mcp"],
    "env": {}
  }
}
```

**사용법:**

- API 키가 필요하지 않음
- Stack Overflow의 공개 API 사용
- 질문 검색, 답변 조회 가능

### 3. Reddit MCP 서버 (reddit-mcp-server)

**기능:**

- Reddit 콘텐츠 가져오기
- 서브레딧 탐색
- 게시물 및 댓글 조회
- Reddit API 통합

**설정:**

```json
{
  "reddit": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "reddit-mcp-server"],
    "env": {
      "REDDIT_CLIENT_ID": "your_reddit_client_id_here",
      "REDDIT_CLIENT_SECRET": "your_reddit_client_secret_here",
      "REDDIT_USERNAME": "your_reddit_username_here",
      "REDDIT_PASSWORD": "your_reddit_password_here"
    }
  }
}
```

**환경 변수 설정:**
Reddit API 앱 생성 필요:

1. https://www.reddit.com/prefs/apps 접속
2. "Create App" 클릭
3. 앱 유형을 "script" 선택
4. 생성된 앱에서 client_id와 client_secret 확인
5. Reddit 계정 정보와 함께 환경 변수에 설정

## 기존 설치된 MCP 서버

### Context7 (@upstash/context7-mcp)

- 라이브러리 문서 조회
- 프레임워크 패턴 검색

### Playwright (@playwright/mcp)

- 브라우저 자동화
- E2E 테스트
- 웹 스크래핑

### Memory Keeper (@modelcontextprotocol/server-memory)

- 지식 그래프 관리
- 메모리 저장 및 검색

### Task Master AI (task-master-ai)

- 프로젝트 관리
- 작업 자동화
- AI 기반 태스크 관리

## 사용 방법

1. Claude Code 재시작
2. `/mcp` 명령어로 서버 상태 확인
3. 각 서버의 도구들이 활성화되었는지 확인

## 환경 변수 설정 방법

### 방법 1: .claude.json에서 직접 설정

위의 설정 예시처럼 각 서버의 `env` 객체에 환경 변수 추가

### 방법 2: 시스템 환경 변수 사용

```bash
export GITHUB_TOKEN="your_token_here"
export REDDIT_CLIENT_ID="your_client_id"
export REDDIT_CLIENT_SECRET="your_client_secret"
export REDDIT_USERNAME="your_username"
export REDDIT_PASSWORD="your_password"
```

## 문제 해결

1. **서버가 시작되지 않는 경우:**
   - 환경 변수가 올바르게 설정되었는지 확인
   - 네트워크 연결 상태 확인
   - npm 패키지가 제대로 설치되었는지 확인

2. **API 키 관련 오류:**
   - 토큰의 유효성 확인
   - 권한 스코프 확인
   - 만료일 확인

3. **성능 이슈:**
   - 필요하지 않은 서버는 비활성화
   - 환경 변수 최적화

## 보안 주의사항

- API 키와 토큰을 공개 저장소에 커밋하지 마세요
- 정기적으로 토큰을 갱신하세요
- 최소한의 권한만 부여하세요
- .gitignore에 .claude.json 파일 추가를 고려하세요
