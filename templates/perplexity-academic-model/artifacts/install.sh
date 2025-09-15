#!/bin/bash

# Perplexity Academic Model Component Installation Script
# This script helps install the component in your LangFlow environment

set -e

echo "🚀 Installing Perplexity Academic Model Component..."

# Check if LangFlow is installed
if ! command -v langflow &> /dev/null; then
    echo "❌ LangFlow is not installed. Please install LangFlow first."
    echo "   Visit: https://docs.langflow.org/getting-started/installation"
    exit 1
fi

# Get LangFlow custom components directory
LANGFLOW_DIR=$(python -c "import langflow; print(langflow.__file__)" | xargs dirname)
COMPONENTS_DIR="$LANGFLOW_DIR/custom_components"

# Create components directory if it doesn't exist
mkdir -p "$COMPONENTS_DIR"

# Copy the component file
echo "📁 Copying component to LangFlow directory..."
cp "perplexity-model-langflow-component.py" "$COMPONENTS_DIR/"

# Install requirements
echo "📦 Installing requirements..."
pip install -r requirements.txt

# Set up environment variable template
echo "🔧 Setting up environment configuration..."
cat > .env.template << EOF
# Perplexity API Configuration
PERPLEXITY_API_KEY=your_perplexity_api_key_here

# Optional: Set default model
PERPLEXITY_DEFAULT_MODEL=sonar-pro

# Optional: Set default search mode
PERPLEXITY_DEFAULT_SEARCH_MODE=academic
EOF

echo "✅ Installation complete!"
echo ""
echo "📋 Next steps:"
echo "1. Copy .env.template to .env and add your Perplexity API key"
echo "2. Restart LangFlow: langflow run"
echo "3. Open LangFlow at http://localhost:7860"
echo "4. Look for 'Perplexity Direct API' in the component library"
echo "5. Import the example workflow from langflow-workflow-example.json"
echo ""
echo "🔑 Get your API key at: https://www.perplexity.ai/settings/api"
echo "📚 Documentation: https://docs.perplexity.ai/"
