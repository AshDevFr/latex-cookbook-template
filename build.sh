#!/bin/bash

# Cookbook Samples Build Script
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
    rm -rf dist/*.pdf
fi

# Clean up existing build files on the root directory
rm -f *.{aux,fdb_latexmk,fls,idx,ilg,ind,pdf,toc,synctex.gz}

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
# Removed -f to ensure fatal errors (e.g., missing fonts) stop the build gracefully
if [ "$VERBOSE" = true ]; then
    echo "Building samples in verbose mode..."
    LATEXMK_OPTS="-lualatex -synctex=1 -interaction=nonstopmode -file-line-error"
else
    echo "Building samples..."
    # -silent: Suppress most output
    LATEXMK_OPTS="-lualatex -synctex=1 -interaction=nonstopmode -file-line-error -silent"
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
        rm -rf tmp/luatex-cache
        shopt -s nullglob
        rm -f tmp/*.{aux,fdb_latexmk,fls,idx,ilg,ind,pdf,toc,synctex.gz}
        shopt -u nullglob
    fi

    # Get the base name without extension
    BASENAME=$(basename "$TEX_FILE" .tex)
    BUILD_TOTAL=$((BUILD_TOTAL + 1))

    echo ""
    echo "Building $BASENAME..."

    # Build from the writable tmp directory, not samples/. LuaTeX's os.tmpdir()
    # creates its temp directory in the *current working directory*, and
    # luaotfload's HarfBuzz plugin relies on it to cache color-emoji glyphs.
    # With a read-only cwd (e.g. the Docker ":ro" mount) that write fails and
    # LuaTeX degrades into an endless bitmap-font search that hangs the build.
    cd tmp

    # Compile the LaTeX document using latexmk
    # Capture latexmk's own exit code: a pipeline would return grep's instead,
    # silently turning compilation failures into "success".
    latexmk_exit_code=0
    if [ "$VERBOSE" = true ]; then
        latexmk $LATEXMK_OPTS -aux-directory=. -output-directory=. "../samples/$BASENAME.tex" || latexmk_exit_code=$?
    else
        latexmk_output=$(latexmk $LATEXMK_OPTS -aux-directory=. -output-directory=. "../samples/$BASENAME.tex" 2>&1) || latexmk_exit_code=$?
        echo "$latexmk_output" | grep -E "([Ee]rror|[Ww]arning|[Ff]atal)" || true
    fi

    # Return to root directory
    cd ..

    # Copy the generated PDF to dist directory, but only if latexmk succeeded:
    # a failed run can leave a partially written PDF behind, and copying it
    # would put a corrupt file in dist while reporting success.
    if [ $latexmk_exit_code -ne 0 ]; then
        echo "✗ Error: $BASENAME failed to compile. Check tmp/$BASENAME.log for details."
        rm -f "tmp/$BASENAME.pdf"
    elif [ -f "tmp/$BASENAME.pdf" ]; then
        cp "tmp/$BASENAME.pdf" "dist/$BASENAME.pdf"
        echo "✓ $BASENAME.pdf successfully generated and copied to dist/$BASENAME.pdf"
        BUILD_SUCCESS=$((BUILD_SUCCESS + 1))
    else
        echo "✗ Error: $BASENAME.pdf was not generated"
    fi

    if [ "$FORCE" = true ]; then
        rm -rf tmp/luatex-cache
        shopt -s nullglob
        rm -f tmp/*.{aux,fdb_latexmk,fls,idx,ilg,ind,pdf,toc,synctex.gz}
        shopt -u nullglob
    fi
done

echo ""
echo "Build complete! ($BUILD_SUCCESS/$BUILD_TOTAL succeeded)"

if [ $BUILD_SUCCESS -ne $BUILD_TOTAL ]; then
    exit 1
fi

