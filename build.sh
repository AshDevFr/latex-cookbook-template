#!/bin/bash

# Family Cookbook Build Script
# Compiles all LaTeX documents in the samples directory and places PDFs in the dist directory
# Usage: ./build.sh [-v] [-f]
#   -v: Verbose mode (show all latexmk output)
#   -f: Force mode (clean tmp and dist directories before build)

set -e  # Exit on error

# Parse command line arguments
VERBOSE=false
FORCE=false
while getopts "vf" opt; do
    case $opt in
        v)
            VERBOSE=true
            ;;
        f)
            FORCE=true
            ;;
        \?)
            echo "Usage: $0 [-v] [-f]"
            exit 1
            ;;
    esac
done

# If force is true, remove the tmp and dist directories
if [ "$FORCE" = true ]; then
    echo "Force mode: removing dist directory"
    rm -rf dist
fi

# Clean up existing build files on the root directory
rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.toc *.synctex.gz

# Create dist and tmp directories if they don't exist
mkdir -p dist
mkdir -p tmp
mkdir -p tmp/luatex-cache

# Set up LuaTeX cache directory
export TEXMFVAR="$(pwd)/tmp/luatex-cache"
export TEXMFHOME="$(pwd)/tmp/luatex-cache"

# Set TEXINPUTS to include the project root for class file lookup
export TEXINPUTS=".:$(pwd):"

# Set up latexmk output options based on verbose flag
# -f: Force continued processing past errors (needed for multiple passes)
if [ "$VERBOSE" = true ]; then
    echo "Building samples in verbose mode..."
    LATEXMK_OPTS="-lualatex -synctex=1 -interaction=nonstopmode -file-line-error -f"
else
    echo "Building samples..."
    # -silent: Suppress most output
    LATEXMK_OPTS="-lualatex -synctex=1 -interaction=nonstopmode -file-line-error -f -silent"
fi

# Find all .tex files in the samples directory
TEX_FILES=(samples/*.tex)

# Check if any .tex files were found
if [ ! -e "${TEX_FILES[0]}" ]; then
    echo "✗ Error: No .tex files found in samples/ directory"
    exit 1
fi

# Track build results
BUILD_SUCCESS=0
BUILD_TOTAL=0

# Compile each LaTeX document
for TEX_FILE in "${TEX_FILES[@]}"; do
    #If force is true, remove the tmp directory to prevent issues with previous builds
    if [ "$FORCE" = true ]; then
        echo "Force mode: removing tmp directory to prevent issues with previous builds"
        rm -rf tmp
    fi

    # Get the base name without extension
    BASENAME=$(basename "$TEX_FILE" .tex)
    BUILD_TOTAL=$((BUILD_TOTAL + 1))

    echo ""
    echo "Building $BASENAME..."

    # Change to samples directory to build
    cd samples

    # Compile the LaTeX document using latexmk
    if [ "$VERBOSE" = true ]; then
        latexmk $LATEXMK_OPTS -aux-directory=../tmp -output-directory=../tmp "$BASENAME.tex"
    else
        latexmk $LATEXMK_OPTS -aux-directory=../tmp -output-directory=../tmp "$BASENAME.tex" 2>&1 | grep -E "(Error|Warning|Fatal)" || true
    fi

    # Return to root directory
    cd ..

    # Copy the generated PDF to dist directory
    if [ -f "tmp/$BASENAME.pdf" ]; then
        cp "tmp/$BASENAME.pdf" "dist/$BASENAME.pdf"
        echo "✓ $BASENAME.pdf successfully generated and copied to dist/$BASENAME.pdf"
        BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
    else
        echo "✗ Error: $BASENAME.pdf was not generated"
    fi
done

echo ""
echo "Build complete! ($BUILD_SUCCESS/$BUILD_TOTAL succeeded)"

if [ $BUILD_SUCCESS -ne $BUILD_TOTAL ]; then
    exit 1
fi

