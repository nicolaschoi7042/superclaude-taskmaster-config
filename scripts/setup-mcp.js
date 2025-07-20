#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const os = require('os');

console.log('🚀 MCP Workspace 설정을 시작합니다...\n');

// Claude Desktop 설정 디렉토리 경로 결정
function getClaudeConfigPath() {
  const platform = os.platform();
  const home = os.homedir();
  
  switch (platform) {
    case 'darwin': // macOS
      return path.join(home, 'Library', 'Application Support', 'Claude', 'claude_desktop_config.json');
    case 'win32': // Windows
      return path.join(home, 'AppData', 'Roaming', 'Claude', 'claude_desktop_config.json');
    default: // Linux
      return path.join(home, '.config', 'claude-desktop', 'claude_desktop_config.json');
  }
}

// MCP 설정 생성
function createMCPConfig() {
  const config = {
    mcpServers: {
      jenkins: {
        command: "npx",
        args: ["@grec0/mcp-jenkins"],
        env: {
          JENKINS_URL: process.env.JENKINS_URL || "http://localhost:8080",
          JENKINS_USERNAME: process.env.JENKINS_USERNAME || "",
          JENKINS_PASSWORD: process.env.JENKINS_PASSWORD || ""
        }
      },
      playwright: {
        command: "npx",
        args: ["@playwright/mcp"],
        env: {}
      }
    }
  };

  // 선택적 MCP 서버들 (설치되어 있다면 추가)
  const optionalServers = {
    reddit: {
      command: "npx",
      args: ["-y", "@ocdevel/mcp-reddit"],
      env: {
        REDDIT_CLIENT_ID: process.env.REDDIT_CLIENT_ID || "",
        REDDIT_CLIENT_SECRET: process.env.REDDIT_CLIENT_SECRET || "",
        REDDIT_USERNAME: process.env.REDDIT_USERNAME || "",
        REDDIT_PASSWORD: process.env.REDDIT_PASSWORD || ""
      }
    },
    context7: {
      command: "npx",
      args: ["-y", "@context7/mcp-server"],
      env: {}
    },
    stackoverflow: {
      command: "npx",
      args: ["-y", "@notalk-tech/stackoverflow-mcp"],
      env: {}
    }
  };

  // 선택적 서버들을 config에 추가 (주석 처리된 상태로)
  Object.entries(optionalServers).forEach(([name, serverConfig]) => {
    config.mcpServers[`${name}-optional`] = {
      ...serverConfig,
      disabled: true,
      comment: `Uncomment and remove 'disabled' property to enable ${name} MCP server`
    };
  });

  return config;
}

// 메인 설정 함수
function setupMCP() {
  try {
    // 1. MCP 패키지 설치
    console.log('📦 MCP 패키지들을 설치합니다...');
    execSync('npm install', { stdio: 'inherit' });
    
    // 2. Claude Desktop 설정 파일 생성
    console.log('⚙️ Claude Desktop 설정을 생성합니다...');
    const configPath = getClaudeConfigPath();
    const configDir = path.dirname(configPath);
    
    // 설정 디렉토리 생성
    if (!fs.existsSync(configDir)) {
      fs.mkdirSync(configDir, { recursive: true });
      console.log(`✅ 설정 디렉토리 생성: ${configDir}`);
    }
    
    // 설정 파일 생성
    const config = createMCPConfig();
    fs.writeFileSync(configPath, JSON.stringify(config, null, 2));
    console.log(`✅ 설정 파일 생성: ${configPath}`);
    
    // 3. 환경 변수 템플릿 생성
    console.log('📝 환경 변수 템플릿을 생성합니다...');
    const envTemplate = `# Jenkins 설정
JENKINS_URL=http://localhost:8080
JENKINS_USERNAME=your-username
JENKINS_PASSWORD=your-password-or-token

# Reddit 설정 (선택사항)
REDDIT_CLIENT_ID=your-client-id
REDDIT_CLIENT_SECRET=your-client-secret
REDDIT_USERNAME=your-username
REDDIT_PASSWORD=your-password
`;
    
    fs.writeFileSync('.env.template', envTemplate);
    console.log('✅ .env.template 파일 생성');
    
    // 4. .env 파일 체크
    if (!fs.existsSync('.env')) {
      fs.copyFileSync('.env.template', '.env');
      console.log('✅ .env 파일 생성 (템플릿에서 복사)');
    }
    
    console.log('\n🎉 MCP Workspace 설정이 완료되었습니다!');
    console.log('\n📋 다음 단계:');
    console.log('1. .env 파일을 편집하여 Jenkins 및 기타 서비스 정보를 입력하세요');
    console.log('2. Claude Desktop을 재시작하세요');
    console.log('3. Jenkins MCP 서버를 테스트하세요: npm run test-jenkins');
    
  } catch (error) {
    console.error('❌ 설정 중 오류가 발생했습니다:', error.message);
    process.exit(1);
  }
}

// 스크립트 실행
if (require.main === module) {
  setupMCP();
}

module.exports = { setupMCP, createMCPConfig, getClaudeConfigPath };