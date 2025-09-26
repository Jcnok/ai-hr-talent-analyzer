# PowerShell run script for Windows users

Write-Host "🤖 Starting AI HR Talent Analyzer..." -ForegroundColor Cyan

# Check if virtual environment exists
if (-not (Test-Path -Path ".venv")) {
    Write-Host "❌ Virtual environment not found. Run setup.ps1 first." -ForegroundColor Red
    exit 1
}

# Check if Lemonade server is running
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8001/api/" -UseBasicParsing -TimeoutSec 5
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ Lemonade server is running" -ForegroundColor Green
    } else {
        throw "Server responded with status code $($response.StatusCode)"
    }
} catch {
    Write-Host "❌ Lemonade server is not running or not responding." -ForegroundColor Red
    Write-Host "Please start it in a separate terminal: lemonade-server-dev serve" -ForegroundColor Yellow
    exit 1
}

# Activate virtual environment and run the agent
Write-Host "🚀 Starting Tiny Agents..." -ForegroundColor Green
try {
    # Activate and run in the same context
    & .\.venv\Scripts\Activate.ps1
     .\file-assistant\tiny-agents run agent.json
} catch {
    Write-Host "❌ Failed to run the agent. Make sure all dependencies are installed correctly." -ForegroundColor Red
    exit 1
}