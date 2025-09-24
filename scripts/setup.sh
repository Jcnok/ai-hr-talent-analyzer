#!/bin/bash
# Setup script for AI HR Talent Analyzer

echo "🚀 Setting up AI HR Talent Analyzer..."

# Check Python version
python_version=$(python3 --version 2>/dev/null | cut -d' ' -f2 | cut -d'.' -f1-2)
if [[ -z "$python_version" ]]; then
    echo "❌ Python 3.11+ is required but not found"
    echo "Please install Python from: https://python.org"
    exit 1
fi

echo "✅ Python $python_version found"

# Create virtual environment
echo "📦 Creating virtual environment..."
python3 -m venv .venv

# Activate virtual environment
echo "🔧 Activating virtual environment..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows Git Bash
    source .venv/Scripts/activate
else
    # Linux/macOS
    source .venv/bin/activate
fi

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Install dependencies
echo "📚 Installing dependencies..."
pip install -r requirements.txt

# Verify installation
echo "🧪 Verifying installation..."
python -c "import lemonade, huggingface_hub, typer, mcp, aiohttp; print('✅ All imports successful')"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Setup completed successfully!"
    echo ""
    echo "Next steps:"
    echo "1. Activate virtual environment: source .venv/bin/activate"
    echo "2. Start Lemonade server: lemonade-server-dev serve"
    echo "3. Configure your model in: http://localhost:8000/#model-management"
    echo "4. Run the agent: tiny-agents run agent.json"
    echo ""
    echo "📚 Documentation: https://jcnok.github.io/ai-hr-talent-analyzer/"
else
    echo "❌ Setup failed. Check error messages above."
    exit 1
fi