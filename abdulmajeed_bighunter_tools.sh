#!/bin/bash

# ==============================================
# Abdulmajeed Big Hunter Tools
# Professional Bug Bounty Reconnaissance Tool
# Version: 1.0.0
# Author: Abdulmajeed Big Hunter
# ==============================================

set -euo pipefail

# Colors and formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Status markers with style
OK="[${GREEN}✓${NC}]"
INFO="[${CYAN}ℹ${NC}]"
WARN="[${YELLOW}⚠${NC}]"
ERR="[${RED}✗${NC}]"

# Global variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION="1.0.0"
DATE=$(date '+%Y-%m-%d')
TIMESTAMP=$(date '+%Y%m%d-%H%M%S')
RESULTS_BASE_DIR="$HOME/bb-results"
CURRENT_TARGET=""
CURRENT_RESULTS_DIR=""
LOG_FILE=""

# Required tools array
REQUIRED_TOOLS=(
    "subfinder"
    "httpx-toolkit"
    "nuclei"
    "gau"
    "dnsx"
    "naabu"
    "ffuf"
    "amass"
)

# ==============================================
# Utility Functions
# ==============================================

print_banner() {
    clear
    
    # Matrix-style rain effect simulation
    echo -e "${GREEN}"
    for i in {1..5}; do
        echo "    $(head -c 100 /dev/urandom | tr -dc 'A-Za-z0-9@#$%&*' | fold -w 80 | head -n 1)"
    done
    echo -e "${NC}"
    
    echo -e "${RED}"
    echo "                                                                                "
    echo "     █████╗ ██████╗ ██╗   ██╗███████╗ ██████╗ █████╗ ████████╗ ██████╗ ██████╗     "
    echo "    ██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██╔════╝██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗    "
    echo "    ███████║██████╔╝ ╚████╔╝ █████╗  ██║     ███████║   ██║   ██║   ██║██████╔╝    "
    echo "    ██╔══██║██╔══██╗  ╚██╔╝  ██╔══╝  ██║     ██╔══██║   ██║   ██║   ██║██╔══██╗    "
    echo "    ██║  ██║██║  ██║   ██║   ██║     ╚██████╗██║  ██║   ██║   ╚██████╔╝██║  ██║    "
    echo "    ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝      ╚═════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝    "
    echo "                                                                                "
    echo -e "${PURPLE}"
    echo "    ░█████╗░██████╗░██╗░░░██╗███████╗░█████╗░██╗░░██╗░█████╗░████████╗░█████╗░██████╗░    "
    echo "    ██╔══██╗██╔══██╗╚██╗░██╔╝██╔════╝██╔══██╗██║░░██║██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗    "
    echo "    ██║░░╚═╝██████╔╝░╚████╔╝░█████╗░░███████║███████║██║░░██║░░░██║░░░██║░░██║██████╔╝    "
    echo "    ██║░░██╗██╔══██╗░░╚██╔╝░░██╔══╝░░██╔══██║██╔══██║██║░░██║░░░██║░░░██║░░██║██╔══██╗    "
    echo "    ╚█████╔╝██║░░██║░░░██║░░░██║░░░░░██║░░██║██║░░██║╚█████╔╝░░░██║░░░╚█████╔╝██║░░██║    "
    echo "    ░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝    "
    echo "                                                                                "
    echo -e "${CYAN}"
    echo "    ╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "    ║              💀 ABDULMAJEED HUNTER TOOLS v${VERSION} 💀                      ║"
    echo "    ║                    🔥 Professional Bug Bounty Recon 🔥                      n║"
    echo "    ║                           ⚡ ${DATE} ⚡                                        ║"
    echo "    ╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${RED}     ENTERPRISE-GRADE RECONNAISSANCE TOOLKIT ${NC}"
    echo -e "${YELLOW}      AUTHORIZED TARGETS ONLY - BUG BOUNTY PROGRAMS ${NC}"
    echo -e "${GREEN}     Ready to hunt some serious bugs! ${NC}"
    echo -e "${BLUE}      Web Security Reconnaissance & Vulnerability Assessment ${NC}"
    echo -e "${PURPLE}      Safe • Professional • Ethical Hacking Toolkit ${NC}"
    echo -e "${RED}     Advanced Bug Bounty Automation Framework ${NC}"
    echo ""
    
    # Epic initialization sequence
    echo -ne "${CYAN}     Initializing hunting protocols"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.3
    done
    echo " ✓"
    
    echo -ne "${PURPLE}     Loading reconnaissance modules"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.2
    done
    echo " ✓"
    
    echo -ne "${GREEN}    ⚡ Activating vulnerability scanners"
    for i in {1..3}; do
        echo -ne "."
        sleep 0.25
    done
    echo " ✓"
    
    echo -e "${YELLOW}"
    echo "    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${NC}"
    echo ""
}

# Virtual sound effects (disabled as requested)
play_virtual_sound() {
    return 0  # Silent mode - no sound effects
}

log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    echo -e "${level} ${message}"
    
    # Add virtual sound effects for important events
    case "$level" in
        *"✓"*)
            [[ "$message" == *"completed"* ]] || [[ "$message" == *"success"* ]] && play_virtual_sound "success"
            ;;
        *"⚠"*)
            play_virtual_sound "warning"
            ;;
        *"✗"*)
            play_virtual_sound "error"
            ;;
    esac
    
    if [[ -n "${LOG_FILE:-}" ]]; then
        echo "[${timestamp}] ${level} ${message}" >> "$LOG_FILE"
    fi
}

setup_results_directory() {
    local target="$1"
    CURRENT_TARGET="$target"
    CURRENT_RESULTS_DIR="$RESULTS_BASE_DIR/$target/$TIMESTAMP"
    LOG_FILE="$CURRENT_RESULTS_DIR/run.log"
    
    mkdir -p "$CURRENT_RESULTS_DIR"
    
    # Epic target acquisition sequence
    echo -e "${RED}"
    echo "    ╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "    ║                         🎯 TARGET ACQUISITION 🎯                             ║"
    echo "    ╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${CYAN}    🎯 Target: ${WHITE}$target${CYAN}"
    echo -e "${PURPLE}    📁 Results: ${WHITE}$CURRENT_RESULTS_DIR${CYAN}"
    echo -e "${GREEN}    📝 Log: ${WHITE}$LOG_FILE${CYAN}"
    echo ""
    
    play_virtual_sound "hunting"
}

validate_target() {
    local target="$1"
    
    # Remove protocol and trailing slashes
    target=$(echo "$target" | sed 's|^https://||;s|^http://||;s|/$||')
    
    # Basic domain validation
    if ! [[ "$target" =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        log_message "$ERR" "Invalid target format. Please provide a valid domain."
        return 1
    fi
    
    echo "$target"
    return 0
}

confirm_target_authorization() {
    local target="$1"
    
    echo -e "${YELLOW}"
    echo "╔═══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                           ⚠️  AUTHORIZATION CHECK ⚠️                          ║"
    echo "╚═══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${CYAN}Target: ${WHITE}$target${NC}"
    echo ""
    echo -e "${YELLOW}Please confirm:${NC}"
    echo "1. You own this domain OR"
    echo "2. You have explicit written permission to test this target OR"
    echo "3. This target is part of an authorized bug bounty program"
    echo ""
    
    read -p "Do you confirm you are authorized to scan this target? (yes/no): " -r
    if [[ ! "$REPLY" =~ ^[Yy][Ee][Ss]$ ]]; then
        log_message "$ERR" "Target authorization not confirmed. Exiting."
        return 1
    fi
    
    return 0
}

# ==============================================
# Tool Management Functions
# ==============================================

check_tool_installed() {
    local tool="$1"
    
    if command -v "$tool" >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

install_go() {
    log_message "$INFO" "Installing Go..."
    
    if ! command -v go >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y golang-go
        
        # Configure GOPATH
        export GOPATH="$HOME/go"
        export PATH="$PATH:$GOPATH/bin"
        
        echo 'export GOPATH="$HOME/go"' >> ~/.bashrc
        echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc
        
        log_message "$OK" "Go installed successfully"
    else
        log_message "$OK" "Go is already installed"
    fi
}

install_tool() {
    local tool="$1"
    
    log_message "$INFO" "Installing $tool..."
    
    case "$tool" in
        "subfinder"|"httpx-toolkit"|"nuclei"|"gau"|"dnsx"|"naabu"|"ffuf")
            if ! command -v go >/dev/null 2>&1; then
                install_go
            fi
            
            go install -v "github.com/projectdiscovery/${tool}@latest" 2>/dev/null || \
            go install -v "github.com/projectdiscovery/${tool}/cmd/${tool}@latest" 2>/dev/null || \
            {
                log_message "$WARN" "Failed to install $tool via Go, trying apt..."
                sudo apt install -y "$tool" 2>/dev/null || {
                    log_message "$ERR" "Failed to install $tool"
                    return 1
                }
            }
            ;;
        "amass")
            sudo apt install -y amass 2>/dev/null || {
                log_message "$WARN" "Could not install $tool via apt"
                return 1
            }
            ;;
        *)
            log_message "$WARN" "Unknown tool: $tool"
            return 1
            ;;
    esac
    
    if check_tool_installed "$tool"; then
        log_message "$OK" "$tool installed successfully"
        return 0
    else
        log_message "$ERR" "$tool installation failed"
        return 1
    fi
}

update_tools() {
    log_message "$INFO" "Updating tools..."
    
    sudo apt update
    sudo apt upgrade -y
    
    # Update Go tools
    if command -v go >/dev/null 2>&1; then
        for tool in "subfinder" "httpx-toolkit" "nuclei" "gau" "dnsx" "naabu" "ffuf"; do
            if check_tool_installed "$tool"; then
                log_message "$INFO" "Updating $tool..."
                go install -v "github.com/projectdiscovery/${tool}@latest" 2>/dev/null || \
                go install -v "github.com/projectdiscovery/${tool}/cmd/${tool}@latest" 2>/dev/null || true
            fi
        done
    fi
    
    log_message "$OK" "Tools updated successfully"
}

install_missing_tools() {
    local missing_tools=()
    
    for tool in "${REQUIRED_TOOLS[@]}"; do
        if ! check_tool_installed "$tool"; then
            missing_tools+=("$tool")
        fi
    done
    
    if [[ ${#missing_tools[@]} -eq 0 ]]; then
        log_message "$OK" "All required tools are installed"
        return 0
    fi
    
    log_message "$WARN" "Missing tools: ${missing_tools[*]}"
    echo ""
    read -p "Would you like to install missing tools? (yes/no): " -r
    
    if [[ "$REPLY" =~ ^[Yy][Ee][Ss]$ ]]; then
        for tool in "${missing_tools[@]}"; do
            install_tool "$tool"
        done
    else
        log_message "$WARN" "Some tools are missing. Continuing anyway..."
    fi
}

# ==============================================
# Recon Functions
# ==============================================

subdomain_enumeration() {
    local target="$1"
    
    log_message "$INFO" "Starting subdomain enumeration for $target"
    
    local subdomains_file="$CURRENT_RESULTS_DIR/subdomains.txt"
    local subfinder_file="$CURRENT_RESULTS_DIR/subfinder_subdomains.txt"
    local final_subdomains="$CURRENT_RESULTS_DIR/subdomains.txt"
    
    # Subfinder enumeration
    if check_tool_installed "subfinder"; then
        log_message "$INFO" "Running subfinder..."
        subfinder -d "$target" -silent > "$subfinder_file" 2>/dev/null || true
        
        if [[ -s "$subfinder_file" ]]; then
            local subfinder_count=$(wc -l < "$subfinder_file")
            log_message "$OK" "Subfinder found $subfinder_count subdomains"
        else
            log_message "$WARN" "Subfinder found no subdomains"
        fi
    else
        log_message "$WARN" "Subfinder not available"
    fi
    
    # Combine and deduplicate results
    if [[ -f "$subfinder_file" ]]; then
        sort -u "$subfinder_file" > "$final_subdomains"
        rm -f "$subfinder_file"
    fi
    
    # Amass enumeration (optional, takes longer)
    if check_tool_installed "amass"; then
        echo ""
        read -p "Run Amass enumeration? (takes longer) (yes/no): " -r
        if [[ "$REPLY" =~ ^[Yy][Ee][Ss]$ ]]; then
            log_message "$INFO" "Running amass..."
            local amass_file="$CURRENT_RESULTS_DIR/amass_subdomains.txt"
            amass enum -passive -d "$target" -o "$amass_file" 2>/dev/null || true
            
            if [[ -s "$amass_file" ]]; then
                local amass_count=$(wc -l < "$amass_file")
                log_message "$OK" "Amass found $amass_count subdomains"
                
                # Combine with existing results
                if [[ -f "$final_subdomains" ]]; then
                    cat "$amass_file" >> "$final_subdomains"
                    sort -u "$final_subdomains" -o "$final_subdomains"
                else
                    mv "$amass_file" "$final_subdomains"
                fi
            fi
        fi
    fi
    
    if [[ -f "$final_subdomains" ]]; then
        local total_count=$(wc -l < "$final_subdomains")
        log_message "$OK" "Total unique subdomains found: $total_count"
    else
        log_message "$WARN" "No subdomains found"
    fi
}

live_host_discovery() {
    local subdomains_file="$CURRENT_RESULTS_DIR/subdomains.txt"
    local alive_file="$CURRENT_RESULTS_DIR/alive.txt"
    
    if [[ ! -f "$subdomains_file" ]]; then
        log_message "$ERR" "Subdomains file not found. Run subdomain enumeration first."
        return 1
    fi
    
    log_message "$INFO" "Starting live host discovery"
    
    if check_tool_installed "httpx-toolkit"; then
        log_message "$INFO" "Running httpx..."
        httpx-toolkit -l "$subdomains_file" -silent > "$alive_file" 2>/dev/null || true
        
        if [[ -s "$alive_file" ]]; then
            local alive_count=$(wc -l < "$alive_file")
            log_message "$OK" "Found $alive_count live hosts"
        else
            log_message "$WARN" "No live hosts found"
        fi
    else
        log_message "$ERR" "httpx-toolkit not available"
        return 1
    fi
}

url_collection() {
    local target="$1"
    local urls_file="$CURRENT_RESULTS_DIR/urls.txt"
    
    log_message "$INFO" "Starting URL collection for $target"
    
    # Gau collection
    if check_tool_installed "gau"; then
        log_message "$INFO" "Running gau..."
        gau "$target" > "$urls_file" 2>/dev/null || true
        
        if [[ -s "$urls_file" ]]; then
            local gau_count=$(wc -l < "$urls_file")
            log_message "$OK" "Gau found $gau_count URLs"
        else
            log_message "$WARN" "Gau found no URLs"
        fi
    else
        log_message "$WARN" "Gau not available"
    fi
    
    # Waybackurls as fallback
    if ! check_tool_installed "gau" && command -v waybackurls >/dev/null 2>&1; then
        log_message "$INFO" "Running waybackurls..."
        echo "$target" | waybackurls > "$urls_file" 2>/dev/null || true
        
        if [[ -s "$urls_file" ]]; then
            local wb_count=$(wc -l < "$urls_file")
            log_message "$OK" "Waybackurls found $wb_count URLs"
        fi
    fi
    
    if [[ -f "$urls_file" ]]; then
        local total_count=$(wc -l < "$urls_file")
        log_message "$OK" "Total URLs collected: $total_count"
    else
        log_message "$WARN" "No URLs collected"
    fi
}

port_scan() {
    local alive_file="$CURRENT_RESULTS_DIR/alive.txt"
    local ports_file="$CURRENT_RESULTS_DIR/ports.txt"
    
    if [[ ! -f "$alive_file" ]]; then
        log_message "$ERR" "Alive hosts file not found. Run live host discovery first."
        return 1
    fi
    
    log_message "$INFO" "Starting port scanning (top 100 ports)"
    
    if check_tool_installed "naabu"; then
        log_message "$INFO" "Running naabu..."
        naabu -l "$alive_file" -top-ports 100 -o "$ports_file" 2>/dev/null || true
        
        if [[ -s "$ports_file" ]]; then
            local ports_count=$(wc -l < "$ports_file")
            log_message "$OK" "Found open ports on $ports_count hosts"
        else
            log_message "$WARN" "No open ports found"
        fi
    else
        log_message "$WARN" "Naabu not available for port scanning"
    fi
}

nuclei_scan() {
    local alive_file="$CURRENT_RESULTS_DIR/alive.txt"
    local nuclei_file="$CURRENT_RESULTS_DIR/nuclei.txt"
    
    if [[ ! -f "$alive_file" ]]; then
        log_message "$ERR" "Alive hosts file not found. Run live host discovery first."
        return 1
    fi
    
    log_message "$INFO" "Starting Nuclei vulnerability scan"
    
    if check_tool_installed "nuclei"; then
        log_message "$INFO" "Running nuclei (safe severity filters)..."
        nuclei -l "$alive_file" -severity low,medium,high,critical -o "$nuclei_file" 2>/dev/null || true
        
        if [[ -s "$nuclei_file" ]]; then
            local findings_count=$(wc -l < "$nuclei_file")
            log_message "$OK" "Nuclei found $findings_count vulnerabilities"
        else
            log_message "$WARN" "No vulnerabilities found by Nuclei"
        fi
    else
        log_message "$ERR" "Nuclei not available"
        return 1
    fi
}

# ==============================================
# Report Generation
# ==============================================

generate_report() {
    local report_file="$CURRENT_RESULTS_DIR/REPORT.md"
    local target="$CURRENT_TARGET"
    
    log_message "$INFO" "Generating report..."
    
    {
        echo "# Abdulmajeed Big Hunter Tools - Reconnaissance Report"
        echo ""
        echo "## Target Information"
        echo "- **Target:** $target"
        echo "- **Scan Date:** $(date)"
        echo "- **Results Directory:** $CURRENT_RESULTS_DIR"
        echo ""
        
        echo "## Scan Summary"
        
        # Subdomains count
        if [[ -f "$CURRENT_RESULTS_DIR/subdomains.txt" ]]; then
            local sub_count=$(wc -l < "$CURRENT_RESULTS_DIR/subdomains.txt")
            echo "- **Subdomains Found:** $sub_count"
        else
            echo "- **Subdomains Found:** 0"
        fi
        
        # Live hosts count
        if [[ -f "$CURRENT_RESULTS_DIR/alive.txt" ]]; then
            local alive_count=$(wc -l < "$CURRENT_RESULTS_DIR/alive.txt")
            echo "- **Live Hosts:** $alive_count"
        else
            echo "- **Live Hosts:** 0"
        fi
        
        # URLs count
        if [[ -f "$CURRENT_RESULTS_DIR/urls.txt" ]]; then
            local url_count=$(wc -l < "$CURRENT_RESULTS_DIR/urls.txt")
            echo "- **URLs Collected:** $url_count"
        else
            echo "- **URLs Collected:** 0"
        fi
        
        # Nuclei findings
        if [[ -f "$CURRENT_RESULTS_DIR/nuclei.txt" ]]; then
            local nuclei_count=$(wc -l < "$CURRENT_RESULTS_DIR/nuclei.txt")
            echo "- **Vulnerabilities Found:** $nuclei_count"
            echo ""
            echo "## Top Findings (by severity)"
            echo "\`\`\`"
            head -20 "$CURRENT_RESULTS_DIR/nuclei.txt"
            echo "\`\`\`"
        else
            echo "- **Vulnerabilities Found:** 0"
        fi
        
        echo ""
        echo "## File Locations"
        echo "- **Subdomains:** $CURRENT_RESULTS_DIR/subdomains.txt"
        echo "- **Live Hosts:** $CURRENT_RESULTS_DIR/alive.txt"
        echo "- **URLs:** $CURRENT_RESULTS_DIR/urls.txt"
        echo "- **Nuclei Results:** $CURRENT_RESULTS_DIR/nuclei.txt"
        
        if [[ -f "$CURRENT_RESULTS_DIR/ports.txt" ]]; then
            echo "- **Port Scan Results:** $CURRENT_RESULTS_DIR/ports.txt"
        fi
        
        echo "- **Log File:** $CURRENT_RESULTS_DIR/run.log"
        echo ""
        
        echo "## Notes"
        echo "- This report was generated automatically by Abdulmajeed Big Hunter Tools"
        echo "- Only safe reconnaissance techniques were used"
        echo "- Ensure you have proper authorization before acting on these findings"
        
    } > "$report_file"
    
    log_message "$OK" "Report generated: $report_file"
}

# ==============================================
# Full Pipeline
# ==============================================

full_recon_pipeline() {
    local target="$1"
    
    log_message "$INFO" "Starting full reconnaissance pipeline for $target"
    
    subdomain_enumeration "$target"
    live_host_discovery
    url_collection "$target"
    
    echo ""
    read -p "Run port scan? (yes/no): " -r
    if [[ "$REPLY" =~ ^[Yy][Ee][Ss]$ ]]; then
        port_scan
    fi
    
    nuclei_scan
    generate_report
    
    log_message "$OK" "Full reconnaissance pipeline completed!"
}

# ==============================================
# Main Menu
# ==============================================

show_menu() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                           MAIN MENU                                          ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo "1) Install/Update Tools"
    echo "2) Subdomain Enumeration"
    echo "3) Live Host Discovery"
    echo "4) URL Collection (Wayback/Gau)"
    echo "5) Port Scan (safe/optional)"
    echo "6) Vulnerability Templates Scan (Nuclei)"
    echo "7) Full Recon Pipeline (1→6)"
    echo "8) Generate Report"
    echo "9) Exit"
    echo ""
}

get_target() {
    local target
    
    while true; do
        read -p "Enter target domain (e.g., example.com): " -r target
        
        target=$(validate_target "$target")
        if [[ $? -eq 0 ]]; then
            if confirm_target_authorization "$target"; then
                setup_results_directory "$target"
                return 0
            fi
        fi
    done
}

main() {
    print_banner
    
    # Epic startup sequence
    echo -e "${PURPLE}"
    echo "    ╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "    ║                    🚀 SYSTEM BOOT SEQUENCE INITIATED 🚀                        ║"
    echo "    ╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    
    play_virtual_sound "startup"
    sleep 1
    
    # Create base results directory
    mkdir -p "$RESULTS_BASE_DIR"
    
    # Check for required tools
    install_missing_tools
    
    while true; do
        show_menu
        read -p "Select an option (1-9): " -r choice
        
        case $choice in
            1)
                update_tools
                ;;
            2)
                if get_target; then
                    subdomain_enumeration "$CURRENT_TARGET"
                fi
                ;;
            3)
                if [[ -n "$CURRENT_TARGET" ]]; then
                    live_host_discovery
                else
                    log_message "$ERR" "No target selected. Please run subdomain enumeration first."
                fi
                ;;
            4)
                if [[ -n "$CURRENT_TARGET" ]]; then
                    url_collection "$CURRENT_TARGET"
                else
                    log_message "$ERR" "No target selected. Please run subdomain enumeration first."
                fi
                ;;
            5)
                if [[ -n "$CURRENT_TARGET" ]]; then
                    port_scan
                else
                    log_message "$ERR" "No target selected. Please run subdomain enumeration first."
                fi
                ;;
            6)
                if [[ -n "$CURRENT_TARGET" ]]; then
                    nuclei_scan
                else
                    log_message "$ERR" "No target selected. Please run subdomain enumeration first."
                fi
                ;;
            7)
                if get_target; then
                    full_recon_pipeline "$CURRENT_TARGET"
                fi
                ;;
            8)
                if [[ -n "$CURRENT_TARGET" ]]; then
                    generate_report
                else
                    log_message "$ERR" "No target selected. Please run a scan first."
                fi
                ;;
            9)
                echo -e "${RED}"
                echo "    ╔══════════════════════════════════════════════════════════════════════════════╗"
                echo "    ║                    💀 MISSION TERMINATED 💀                                  ║"
                echo "    ║              Abdulmajeed Big Hunter Tools - Powered Off                        ║"
                echo "    ╚══════════════════════════════════════════════════════════════════════════════╝"
                echo -e "${NC}"
                play_virtual_sound "success"
                log_message "$INFO" "Thank you for using Abdulmajeed Big Hunter Tools!"
                log_message "$INFO" "Happy hunting! 🎯"
                echo -e "${PURPLE}    🔊 *SYSTEM SHUTDOWN COMPLETE* 🔊${NC}"
                exit 0
                ;;
            *)
                log_message "$ERR" "Invalid option. Please select 1-9."
                ;;
        esac
        
        echo ""
        read -p "Press Enter to continue..."
        clear
        print_banner
    done
}

# ==============================================
# Script Entry Point
# ==============================================

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi