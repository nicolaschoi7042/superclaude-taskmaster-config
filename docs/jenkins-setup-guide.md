# Jenkins MCP Server 설치 가이드

## 설치 완료 ✅

Jenkins MCP 서버가 성공적으로 설치되었습니다!

### 설치된 구성 요소:
- **패키지**: `@grec0/mcp-jenkins` (v0.1.7)
- **실행 파일**: `/home/linux/.nvm/versions/node/v22.17.0/bin/mcp-jenkins`
- **구성 파일**: `~/.config/claude-desktop/claude_desktop_config.json`

### 사용 가능한 Jenkins 도구:
- `jenkins_get_job_status` - 작업 상태 확인
- `jenkins_start_job` - 작업 시작
- `jenkins_stop_job` - 작업 중지
- `jenkins_get_build_steps` - 빌드 단계 정보
- `jenkins_get_node_status` - 노드 상태 확인
- `jenkins_get_pending_actions` - 대기 중인 액션 확인
- `jenkins_submit_input_action` - 입력 액션 제출
- `jenkins_get_coverage_report` - 커버리지 보고서
- `jenkins_get_coverage_lines` - 커버리지 라인 정보
- `jenkins_get_coverage_paths` - 커버리지 경로 정보
- `jenkins_get_git_branches` - Git 브랜치 정보

## 설정 방법

### 1. 환경 변수 설정
Jenkins 서버에 연결하려면 다음 환경 변수를 설정하세요:

```bash
export JENKINS_URL="http://your-jenkins-server:8080"
export JENKINS_USERNAME="your-username"
export JENKINS_PASSWORD="your-password-or-token"
```

### 2. Claude Desktop 구성 업데이트
구성 파일이 `~/.config/claude-desktop/claude_desktop_config.json`에 생성되었습니다.
필요에 따라 Jenkins URL과 자격 증명을 업데이트하세요.

### 3. Claude Desktop 재시작
변경 사항을 적용하려면 Claude Desktop을 재시작하세요.

## 사용 예시

Jenkins MCP 서버를 사용하여 다음과 같은 작업을 수행할 수 있습니다:
- Jenkins 작업 상태 모니터링
- 빌드 자동 시작/중지
- 코드 커버리지 분석
- Git 브랜치 관리

---
*설치 완료: $(date)*