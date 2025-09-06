#!/bin/bash
# Deployment verification script

echo "🔍 Checking chart deployment status..."

# Check if HTML files exist
if [ -f "index.html" ] && [ -f "flowchart.html" ]; then
    echo "✅ Chart files found (index.html, flowchart.html)"
else
    echo "❌ Chart files missing"
    exit 1
fi

# Check if GitHub Actions workflow exists
if [ -f ".github/workflows/deploy.yml" ]; then
    echo "✅ Deployment workflow configured"
else
    echo "❌ Deployment workflow not found"
    exit 1
fi

# Check if HTML files are valid
if grep -q "mermaid" index.html && grep -q "Case Filing Process" index.html; then
    echo "✅ Main chart file appears valid"
else
    echo "❌ Main chart file appears invalid"
    exit 1
fi

if grep -q "mermaid" flowchart.html && grep -q "Case Filing Process" flowchart.html; then
    echo "✅ Flowchart file appears valid"
else
    echo "❌ Flowchart file appears invalid"
    exit 1
fi

echo "🎉 Chart deployment setup complete!"
echo "📖 Visit https://gmut53408.github.io/appeal/ to view the deployed chart"
echo "🔄 Auto-deployment will trigger on pushes to main branch"