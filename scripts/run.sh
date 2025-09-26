# Run script for AI HR Talent Analyzer

echo "🤖 Starting AI HR Talent Analyzer..."

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "❌ Virtual environment not found. Run setup.sh first."
    exit 1
fi

# Activate virtual environment
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows Git Bash
    source .venv/Scripts/activate
else
    # Linux/macOS
    source .venv/bin/activate
fi

# Check if Lemonade server is running
if ! curl -s http://localhost:8001/api/ > /dev/null; then
    echo "❌ Lemonade server is not running."
    echo "Please start it first: lemonade-server-dev serve"
    exit 1
fi

echo "✅ Lemonade server is running"

# Run the agent
echo "🚀 Starting Tiny Agents..."
cd ./file-assistant
tiny-agents run agent.json