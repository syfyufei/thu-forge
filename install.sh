#!/bin/bash

set -e

echo "Installing thu-forge..."
echo ""

MARKETPLACE_PATH="$(cd "$(dirname "$0")/.." && pwd)"
echo "Marketplace path: $MARKETPLACE_PATH"

claude plugin marketplace add "$MARKETPLACE_PATH" 2>/dev/null || true

echo "Installing thu-forge..."
claude plugin install thu-forge

echo ""
echo "thu-forge installed successfully!"
echo ""
echo "Usage: /thu-forge:compile"
echo ""
