# Abdulmajeed Big Hunter Tools

💀 **Professional Bug Bounty Reconnaissance Toolkit** 🔥

## 🎯 Overview

**Abdulmajeed Big Hunter Tools** is an enterprise-grade, professional bash toolkit designed for safe and automated bug bounty reconnaissance. This tool automates the entire reconnaissance workflow while maintaining strict safety protocols.

## ✨ Features

### 🎨 **Epic Visual Experience**
- **Matrix-style rain effect** on startup
- **Dual ASCII art banners** (Arabic & English)
- **Professional color schemes** with status indicators
- **Animated loading sequences** for each module
- **Enterprise-grade UI/UX** design

### 🔧 **Professional Tool Management**
- **Automated tool installation** and updates
- **Go-based tool management** for ProjectDiscovery tools
- **Dependency checking** and resolution
- **Error handling** and recovery

### 🛡️ **Safety & Compliance**
- **Authorization verification** before scanning
- **Safe reconnaissance only** (no exploitation)
- **Target validation** and sanitization
- **Professional logging** and audit trails

### 📊 **Complete Reconnaissance Pipeline**
1. **Subdomain Enumeration** (Subfinder + Amass)
2. **Live Host Discovery** (httpx)
3. **URL Collection** (Gau / Waybackurls)
4. **Port Scanning** (Naabu - optional)
5. **Vulnerability Scanning** (Nuclei - safe filters)
6. **Automated Reporting** (Markdown format)

## 🚀 Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/abdulmajeed-bighunter-tools.git

# Navigate to directory
cd abdulmajeed-bighunter-tools

# Make executable
chmod +x abdulmajeed_bighunter_tools.sh

# Run the tool
./abdulmajeed_bighunter_tools.sh
```

## 🎯 Usage

### Quick Start
```bash
# Run the tool
./abdulmajeed_bighunter_tools.sh

# Select option 7 for full reconnaissance pipeline
# Enter your target domain when prompted
# Confirm authorization
# Let the tool work its magic!
```

### Manual Steps
1. **Install/Update Tools** (Option 1)
2. **Subdomain Enumeration** (Option 2)
3. **Live Host Discovery** (Option 3)
4. **URL Collection** (Option 4)
5. **Port Scanning** (Option 5 - optional)
6. **Vulnerability Scanning** (Option 6)
7. **Generate Report** (Option 8)

## 📁 Output Structure

```
~/bb-results/
└── example.com/
    └── 20241217-143022/
        ├── subdomains.txt      # Discovered subdomains
        ├── alive.txt          # Live hosts
        ├── urls.txt           # Collected URLs
        ├── nuclei.txt         # Vulnerability findings
        ├── ports.txt          # Port scan results (optional)
        ├── REPORT.md          # Final report
        └── run.log            # Execution log
```

## 🛠️ Required Tools

The toolkit automatically installs and manages:

- **subfinder** - Subdomain discovery
- **httpx-toolkit** - HTTP toolkit
- **nuclei** - Vulnerability scanner
- **gau** - Get All URLs
- **dnsx** - DNS toolkit
- **naabu** - Port scanner
- **ffuf** - Fuzzer
- **amass** - Attack surface mapping

## 🎨 Visual Experience

### Startup Sequence
```
🌧️ Matrix Rain Effect
💀 Epic ASCII Banner
🔥 Loading Animations
⚡ System Initialization
```

### Status Indicators
- ✅ **Success**: `[✓]` with green highlighting
- ℹ️ **Info**: `[ℹ]` with cyan highlighting  
- ⚠️ **Warning**: `[⚠]` with yellow highlighting
- ❌ **Error**: `[✗]` with red highlighting

## 🔒 Safety Features

### Authorization Checks
- **Explicit confirmation** required before scanning
- **Target ownership** verification
- **Bug bounty program** validation
- **Legal compliance** reminders

### Safe Scanning
- **No exploitation** - reconnaissance only
- **Safe severity filters** for vulnerability scanning
- **Rate limiting** and polite scanning
- **Professional ethics** enforcement

## 📊 Sample Report

```markdown
# Abdulmajeed Big Hunter Tools - Reconnaissance Report

## Target Information
- **Target:** example.com
- **Scan Date:** 2024-12-17 14:30:22
- **Results Directory:** ~/bb-results/example.com/20241217-143022/

## Scan Summary
- **Subdomains Found:** 247
- **Live Hosts:** 89
- **URLs Collected:** 1,234
- **Vulnerabilities Found:** 12

## Top Findings
[Critical] SQL Injection in login form
[High] XSS vulnerability in search parameter
[Medium] Information disclosure in headers
```

## 🚀 Advanced Features

### Enterprise-Grade Logging
- **Detailed execution logs** with timestamps
- **Error tracking** and debugging information
- **Performance metrics** and timing data
- **Audit trail** for compliance

### Professional Workflow
- **Modular design** for flexibility
- **Error recovery** and resilience
- **Progress indicators** and status updates
- **Clean architecture** for maintainability

## ⚠️ Legal Notice

**IMPORTANT**: This tool is designed for authorized security testing only. Users must:

1. **Own the target domain** OR
2. **Have explicit written permission** to test the target OR  
3. **Be testing within an authorized bug bounty program**

**Misuse of this tool for unauthorized scanning is illegal and strictly prohibited.**

## 🎯 Target Audience

- **Bug Bounty Hunters**
- **Security Researchers**
- **Penetration Testers**
- **Security Consultants**
- **Enterprise Security Teams**

## 🔧 Technical Requirements

- **Operating System**: Linux (Kali Linux recommended)
- **Memory**: Minimum 4GB RAM
- **Storage**: 10GB+ available space
- **Network**: Stable internet connection
- **Permissions**: Sudo access for tool installation

## 🎨 Customization

The tool can be customized by modifying:
- **Color schemes** in the banner function
- **Tool configurations** in the recon functions
- **Report templates** in the generate_report function
- **Installation sources** in the tool management functions

## 🤝 Contributing

Contributions are welcome! Please feel free to submit:
- Bug reports
- Feature requests
- Code improvements
- Documentation updates

## 📞 Support

For support and questions:
- **Issues**: Use GitHub Issues
- **Discussions**: Use GitHub Discussions
- **Email**: Contact through GitHub profile

## 🏆 Credits

**Abdulmajeed Big Hunter** - Creator and maintainer

**Special thanks to**:
- ProjectDiscovery team for their amazing tools
- The bug bounty community for inspiration
- Open source security community

---

💀 **Happy Hunting!** 🔥

**Remember: Use responsibly and ethically!** 🛡️