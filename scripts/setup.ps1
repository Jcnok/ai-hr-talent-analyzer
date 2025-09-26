# PowerShell setup script for Windows users

Write-Host "🚀 Setting up AI HR Talent Analyzer..." -ForegroundColor Green

# Check Python version
try {
    $pythonVersion = python --version 2>$null
    Write-Host "✅ $pythonVersion found" -ForegroundColor Green
} catch {
    Write-Host "❌ Python 3.11+ is required but not found" -ForegroundColor Red
    Write-Host "Please install Python from: https://python.org" -ForegroundColor Yellow
    exit 1
}

# Create virtual environment
Write-Host "📦 Creating virtual environment..." -ForegroundColor Blue
python -m venv .venv

# Activate virtual environment
Write-Host "🔧 Activating virtual environment..." -ForegroundColor Blue
.\.venv\Scripts\Activate.ps1

# Upgrade pip
Write-Host "⬆️  Upgrading pip..." -ForegroundColor Blue
pip install --upgrade pip

# Install dependencies
Write-Host "📚 Installing dependencies..." -ForegroundColor Blue
pip install -r requirements.txt

# Verify installation
Write-Host "🧪 Verifying installation..." -ForegroundColor Blue
try {
    python -c "import lemonade, huggingface_hub, typer, mcp, aiohttp; print('✅ All imports successful')"
    
    Write-Host ""
    Write-Host "✅ Setup completed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:"
    Write-Host "1. Activate virtual environment: .venv\Scripts\activate"
    Write-Host "2. Start Lemonade server: lemonade-server-dev serve"
    Write-Host "3. Configure your model in: http://localhost:8001/#model-management"
    Write-Host "4. Run the agent: tiny-agents run agent.json"
    Write-Host ""
    Write-Host "📚 Documentation: https://jcnok.github.io/ai-hr-talent-analyzer/"
} catch {
    Write-Host "❌ Setup failed. Check error messages above." -ForegroundColor Red
    exit 1
}