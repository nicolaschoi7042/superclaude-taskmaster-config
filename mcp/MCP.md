# MCP.md - SuperClaude MCP Server Reference

MCP (Model Context Protocol) server integration and orchestration system for Claude Code SuperClaude framework.

## Server Selection Algorithm

**Priority Matrix**:

1. Task-Server Affinity: Match tasks to optimal servers based on capability matrix
2. Performance Metrics: Server response time, success rate, resource utilization
3. Context Awareness: Current persona, command depth, session state
4. Load Distribution: Prevent server overload through intelligent queuing
5. Fallback Readiness: Maintain backup servers for critical operations

**Selection Process**: Task Analysis → Server Capability Match → Performance Check → Load Assessment → Final Selection

## Context7 Integration (Documentation & Research)

**Purpose**: Official library documentation, code examples, best practices, localization standards

**Activation Patterns**:

- Automatic: External library imports detected, framework-specific questions, scribe persona active
- Manual: `--c7`, `--context7` flags
- Smart: Commands detect need for official documentation patterns

**Workflow Process**:

1. Library Detection: Scan imports, dependencies, package.json for library references
2. ID Resolution: Use `resolve-library-id` to find Context7-compatible library ID
3. Documentation Retrieval: Call `get-library-docs` with specific topic focus
4. Pattern Extraction: Extract relevant code patterns and implementation examples
5. Implementation: Apply patterns with proper attribution and version compatibility
6. Validation: Verify implementation against official documentation
7. Caching: Store successful patterns for session reuse

**Integration Commands**: `/build`, `/analyze`, `/improve`, `/design`, `/document`, `/explain`, `/git`

**Error Recovery**:

- Library not found → WebSearch for alternatives → Manual implementation
- Documentation timeout → Use cached knowledge → Note limitations
- Invalid library ID → Retry with broader search terms → Fallback to WebSearch
- Version mismatch → Find compatible version → Suggest upgrade path
- Server unavailable → Activate backup Context7 instances → Graceful degradation

## Sequential Integration (Complex Analysis & Thinking)

**Purpose**: Multi-step problem solving, architectural analysis, systematic debugging

**Activation Patterns**:

- Automatic: Complex debugging scenarios, system design questions, `--think` flags
- Manual: `--seq`, `--sequential` flags
- Smart: Multi-step problems requiring systematic analysis

**Workflow Process**:

1. Problem Decomposition: Break complex problems into analyzable components
2. Server Coordination: Coordinate with Context7 for documentation, Magic for UI insights, Playwright for testing
3. Systematic Analysis: Apply structured thinking to each component
4. Relationship Mapping: Identify dependencies, interactions, and feedback loops
5. Hypothesis Generation: Create testable hypotheses for each component
6. Evidence Gathering: Collect supporting evidence through tool usage
7. Multi-Server Synthesis: Combine findings from multiple servers
8. Recommendation Generation: Provide actionable next steps with priority ordering
9. Validation: Check reasoning for logical consistency

**Integration with Thinking Modes**:

- `--think` (4K): Module-level analysis with context awareness
- `--think-hard` (10K): System-wide analysis with architectural focus
- `--ultrathink` (32K): Critical system analysis with comprehensive coverage

**Use Cases**:

- Root cause analysis for complex bugs
- Performance bottleneck identification
- Architecture review and improvement planning
- Security threat modeling and vulnerability analysis
- Code quality assessment with improvement roadmaps
- Scribe Persona: Structured documentation workflows, multilingual content organization
- Loop Command: Iterative improvement analysis, progressive refinement planning

## Magic Integration (UI Components & Design)

**Purpose**: Modern UI component generation, design system integration, responsive design

**Activation Patterns**:

- Automatic: UI component requests, design system queries
- Manual: `--magic` flag
- Smart: Frontend persona active, component-related queries

**Workflow Process**:

1. Requirement Parsing: Extract component specifications and design system requirements
2. Pattern Search: Find similar components and design patterns from 21st.dev database
3. Framework Detection: Identify target framework (React, Vue, Angular) and version
4. Server Coordination: Sync with Context7 for framework patterns, Sequential for complex logic
5. Code Generation: Create component with modern best practices and framework conventions
6. Design System Integration: Apply existing themes, styles, tokens, and design patterns
7. Accessibility Compliance: Ensure WCAG compliance, semantic markup, and keyboard navigation
8. Responsive Design: Implement mobile-first responsive patterns
9. Optimization: Apply performance optimizations and code splitting
10. Quality Assurance: Validate against design system and accessibility standards

**Component Categories**:

- Interactive: Buttons, forms, modals, dropdowns, navigation, search components
- Layout: Grids, containers, cards, panels, sidebars, headers, footers
- Display: Typography, images, icons, charts, tables, lists, media
- Feedback: Alerts, notifications, progress indicators, tooltips, loading states
- Input: Text fields, selectors, date pickers, file uploads, rich text editors
- Navigation: Menus, breadcrumbs, pagination, tabs, steppers
- Data: Tables, grids, lists, cards, infinite scroll, virtualization

**Framework Support**:

- React: Hooks, TypeScript, modern patterns, Context API, state management
- Vue: Composition API, TypeScript, reactive patterns, Pinia integration
- Angular: Component architecture, TypeScript, reactive forms, services
- Vanilla: Web Components, modern JavaScript, CSS custom properties

## Playwright Integration (Browser Automation & Testing)

**Purpose**: Cross-browser E2E testing, performance monitoring, automation, visual testing

**Activation Patterns**:

- Automatic: Testing workflows, performance monitoring requests, E2E test generation
- Manual: `--play`, `--playwright` flags
- Smart: QA persona active, browser interaction needed

**Workflow Process**:

1. Browser Connection: Connect to Chrome, Firefox, Safari, or Edge instances
2. Environment Setup: Configure viewport, user agent, network conditions, device emulation
3. Navigation: Navigate to target URLs with proper waiting and error handling
4. Server Coordination: Sync with Sequential for test planning, Magic for UI validation
5. Interaction: Perform user actions (clicks, form fills, navigation) across browsers
6. Data Collection: Capture screenshots, videos, performance metrics, console logs
7. Validation: Verify expected behaviors, visual states, and performance thresholds
8. Multi-Server Analysis: Coordinate with other servers for comprehensive test analysis
9. Reporting: Generate test reports with evidence, metrics, and actionable insights
10. Cleanup: Properly close browser connections and clean up resources

**Capabilities**:

- Multi-Browser Support: Chrome, Firefox, Safari, Edge with consistent API
- Visual Testing: Screenshot capture, visual regression detection, responsive testing
- Performance Metrics: Load times, rendering performance, resource usage, Core Web Vitals
- User Simulation: Real user interaction patterns, accessibility testing, form workflows
- Data Extraction: DOM content, API responses, console logs, network monitoring
- Mobile Testing: Device emulation, touch gestures, mobile-specific validation
- Parallel Execution: Run tests across multiple browsers simultaneously

**Integration Patterns**:

- Test Generation: Create E2E tests based on user workflows and critical paths
- Performance Monitoring: Continuous performance measurement with threshold alerting
- Visual Validation: Screenshot-based testing and regression detection
- Cross-Browser Testing: Validate functionality across all major browsers
- User Experience Testing: Accessibility validation, usability testing, conversion optimization

## MCP Server Use Cases by Command Category

**Development Commands**:

- Context7: Framework patterns, library documentation
- Magic: UI component generation
- Sequential: Complex setup workflows

**Analysis Commands**:

- Context7: Best practices, patterns
- Sequential: Deep analysis, systematic review
- Playwright: Issue reproduction, visual testing

**Quality Commands**:

- Context7: Security patterns, improvement patterns
- Sequential: Code analysis, cleanup strategies

**Testing Commands**:

- Sequential: Test strategy development
- Playwright: E2E test execution, visual regression

**Documentation Commands**:

- Context7: Documentation patterns, style guides, localization standards
- Sequential: Content analysis, structured writing, multilingual documentation workflows
- Scribe Persona: Professional writing with cultural adaptation and language-specific conventions

**Planning Commands**:

- Context7: Benchmarks and patterns
- Sequential: Complex planning and estimation

**Deployment Commands**:

- Sequential: Deployment planning
- Playwright: Deployment validation

**Meta Commands**:

- Sequential: Search intelligence, task orchestration, iterative improvement analysis
- All MCP: Comprehensive analysis and orchestration
- Loop Command: Iterative workflows with Sequential (primary) and Context7 (patterns)

## Server Orchestration Patterns

**Multi-Server Coordination**:

- Task Distribution: Intelligent task splitting across servers based on capabilities
- Dependency Management: Handle inter-server dependencies and data flow
- Synchronization: Coordinate server responses for unified solutions
- Load Balancing: Distribute workload based on server performance and capacity
- Failover Management: Automatic failover to backup servers during outages

**Caching Strategies**:

- Context7 Cache: Documentation lookups with version-aware caching
- Sequential Cache: Analysis results with pattern matching
- Magic Cache: Component patterns with design system versioning
- Playwright Cache: Test results and screenshots with environment-specific caching
- Cross-Server Cache: Shared cache for multi-server operations
- Loop Optimization: Cache iterative analysis results, reuse improvement patterns

**Error Handling and Recovery**:

- Context7 unavailable → WebSearch for documentation → Manual implementation
- Sequential timeout → Use native Claude Code analysis → Note limitations
- Magic failure → Generate basic component → Suggest manual enhancement
- Playwright connection lost → Suggest manual testing → Provide test cases

**Recovery Strategies**:

- Exponential Backoff: Automatic retry with exponential backoff and jitter
- Circuit Breaker: Prevent cascading failures with circuit breaker pattern
- Graceful Degradation: Maintain core functionality when servers are unavailable
- Alternative Routing: Route requests to backup servers automatically
- Partial Result Handling: Process and utilize partial results from failed operations

**Integration Patterns**:

- Minimal Start: Start with minimal MCP usage and expand based on needs
- Progressive Enhancement: Progressively enhance with additional servers
- Result Combination: Combine MCP results for comprehensive solutions
- Graceful Fallback: Fallback gracefully when servers unavailable
- Loop Integration: Sequential for iterative analysis, Context7 for improvement patterns
- Dependency Orchestration: Manage inter-server dependencies and data flow

# Claude MCP 서버 활용 가이드

Claude의 MCP(Model Context Protocol) 서버를 활용하여 다양한 개발 작업을 자동화하고 효율성을 높일 수 있습니다.

## 📋 목차

- [Playwright E2E 테스트](#playwright-e2e-테스트)
- [StackOverflow 기술 검색](#stackoverflow-기술-검색)
- [Reddit 커뮤니티 모니터링](#reddit-커뮤니티-모니터링)
- [Context7 문서 검색](#context7-문서-검색)
- [Filesystem 파일 관리](#filesystem-파일-관리)
- [설정 파일 생성](#설정-파일-생성)

---

## 🎭 Playwright E2E 테스트

### 사용법

```
로그인 플로우 E2E 테스트 실행해줘
회원가입 페이지 테스트 자동화해줘
결제 프로세스 E2E 테스트 작성해줘
```

### 예상 동작

- Claude가 Playwright MCP를 통해 자동 브라우저 테스트 실행
- 실제 브라우저에서 사용자 인터랙션 시뮬레이션
- 테스트 결과 및 스크린샷 제공

### 활용 시나리오

- 핵심 사용자 플로우 검증
- 크로스 브라우저 호환성 테스트
- 회귀 테스트 자동화

---

## 🔍 StackOverflow 기술 검색

### 사용법

```
React hooks 사용법에 대한 질문들 찾아줘
TypeScript 에러 해결방법 검색해줘
Next.js 성능 최적화 관련 답변들 분석해줘
```

### 예상 동작

- StackOverflow MCP로 관련 Q&A 검색 및 분석
- 고품질 답변들을 필터링하여 제공
- 코드 예제와 함께 솔루션 정리

### 활용 시나리오

- 기술적 문제 해결
- 베스트 프랙티스 학습
- 커뮤니티 트렌드 파악

---

## 🗣️ Reddit 커뮤니티 모니터링

### 사용법

```
AI 개발 관련 최신 트렌드 확인해줘
웹개발 커뮤니티 핫 토픽 분석해줘
프로그래밍 언어별 인기도 조사해줘
```

### 예상 동작

- Reddit MCP로 관련 서브레딧 분석
- 인기 게시물 및 댓글 트렌드 파악
- 개발자 커뮤니티 의견 종합

### 활용 시나리오

- 기술 트렌드 모니터링
- 새로운 도구/라이브러리 발견
- 개발자 커뮤니티 피드백 수집

---

## 📚 Context7 문서 검색

### 사용법

```
Next.js 최신 라우팅 패턴 알려줘
React 18의 새로운 기능들 검색해줘
TypeScript 5.0 업데이트 내용 찾아줘
```

### 예상 동작

- Context7 MCP로 공식 문서 패턴 검색
- 최신 문서 및 API 레퍼런스 제공
- 코드 예제와 함께 사용법 안내

### 활용 시나리오

- 공식 문서 빠른 검색
- API 레퍼런스 확인
- 마이그레이션 가이드 조회

---

## 📂 Filesystem 파일 관리

### 사용법

```
프로젝트의 package.json을 분석하고 최적화 제안해줘
src 폴더 구조를 분석해서 리팩토링 제안해줘
모든 .js 파일을 .ts로 변환해줘
```

### 예상 동작

- Filesystem MCP로 파일 읽기/쓰기/분석
- 의존성 분석 및 개선 제안
- 코드 구조 최적화 권장사항 제시

### 활용 시나리오

- 프로젝트 구조 최적화
- 의존성 관리
- 코드베이스 분석 및 리팩토링

---

## ⚙️ 설정 파일 생성

### 사용법

```
TypeScript 프로젝트용 .gitignore 파일 생성해줘
Next.js용 eslint 설정파일 만들어줘
Docker 컨테이너용 dockerfile 작성해줘
```

### 예상 동작

- Filesystem MCP로 설정 파일 생성 및 내용 작성
- 프로젝트 타입에 맞는 최적화된 설정 제공
- 베스트 프랙티스 반영

### 활용 시나리오

- 새 프로젝트 초기 설정
- 개발 환경 표준화
- 배포 및 빌드 설정 자동화

---

## 💡 효과적인 사용 팁

### 1. 구체적인 요청하기

❌ "테스트 해줘"
✅ "로그인 플로우 E2E 테스트 실행해줘"

### 2. 컨텍스트 제공하기

❌ "에러 찾아줘"
✅ "React hooks 사용 중 발생한 메모리 누수 에러 해결방법 찾아줘"

### 3. 원하는 결과 명시하기

❌ "분석해줘"
✅ "package.json 분석하고 불필요한 의존성 제거 제안해줘"

### 4. 연관 작업 체이닝

```
1. "프로젝트 구조 분석해줘"
2. "분석 결과 기반으로 리팩토링 제안해줘"
3. "제안된 구조로 파일들 재배치해줘"
```

---

## 🚀 고급 활용 예제

### 전체 프로젝트 분석 워크플로우

```
1. 프로젝트 파일 구조 분석해줘
2. package.json 의존성 최적화 제안해줘
3. TypeScript 설정 검토하고 개선안 제시해줘
4. 주요 컴포넌트들 E2E 테스트 작성해줘
5. 성능 관련 StackOverflow 질문들 검색해서 개선방안 찾아줘
```

### 기술 학습 워크플로우

```
1. Context7에서 새로운 기술 문서 검색해줘
2. StackOverflow에서 관련 실무 질문들 찾아줘
3. Reddit에서 커뮤니티 평가 확인해줘
4. 학습한 내용으로 샘플 프로젝트 생성해줘
```

---

## 🔧 문제 해결

### MCP 서버 응답이 없을 때

1. 네트워크 연결 확인
2. 요청 문구 다시 작성
3. 더 구체적인 컨텍스트 제공

### 원하는 결과가 나오지 않을 때

1. 요청을 더 세분화하여 단계별로 진행
2. 예시나 참고 자료 함께 제공
3. 기대하는 결과 형태 명시

---

이 가이드를 참고하여 Claude의 MCP 서버들을 효과적으로 활용해보세요!
