#!/bin/bash

echo "🚀 Setting up NexAuth..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Please install Node.js first"
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ Please install npm first"
    exit 1
fi

echo "📦 Installing server dependencies..."
cd server || exit 1
npm install
cd ..

echo "📦 Installing dashboard dependencies..."
cd dashboard || exit 1
npm install
cd ..

echo "📝 Setting up environment variables..."
if [ ! -f .env ]; then
    cp config/.env.example .env
    echo "📝 .env file created"
else
    echo "ℹ️ .env file already exists, skipping."
fi

echo "🗄️ Creating database folder..."
mkdir -p database

echo ""
echo "✅ NexAuth setup complete!"
echo "Run bash start.sh to start the project"
