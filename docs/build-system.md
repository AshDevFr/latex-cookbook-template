# Build System

Instructions for compiling your cookbook.

## Using the Build Script

The included `build.sh` script simplifies compilation.

### Basic Usage

```bash
# Basic compilation
./build.sh

# Verbose output
./build.sh -v

# Help
./build.sh -h
```

### What the Script Does

The build script automates the compilation process:

1. Compiles with LuaLaTeX
2. Generates the index using `makeindex`
3. Runs additional passes for cross-references
4. Moves the final PDF to `dist/` directory
5. Cleans up temporary files (stored in `tmp/` directory)

### Build Script Output

```
Building cookbook-sample.tex...
Pass 1: Compiling with LuaLaTeX...
Generating index...
Pass 2: Compiling with LuaLaTeX...
Pass 3: Compiling with LuaLaTeX...
Moving PDF to dist/...
Build complete! PDF: dist/cookbook-sample.pdf
```

## Manual Compilation

If you prefer manual compilation or need more control:

### Standard Compilation

```bash
lualatex --output-directory=tmp your-cookbook.tex
makeindex tmp/your-cookbook.idx
lualatex --output-directory=tmp your-cookbook.tex
lualatex --output-directory=tmp your-cookbook.tex
```

### Why Multiple Passes?

1. **First pass**: Generates aux files and determines page numbers
2. **makeindex**: Processes index entries
3. **Second pass**: Incorporates index and updates references
4. **Third pass**: Finalizes all cross-references and page numbers

### Compilation Steps Explained

#### 1. LuaLaTeX Compilation

```bash
lualatex --output-directory=tmp your-cookbook.tex
```

- Compiles LaTeX source to PDF
- Generates auxiliary files (.aux, .idx, .toc, etc.)
- Outputs temporary files to `tmp/` directory

#### 2. Index Generation

```bash
makeindex tmp/your-cookbook.idx
```

- Processes index entries from `.idx` file
- Generates `.ind` file with formatted index
- Only needed if using `\printindex`

#### 3. Additional Passes

```bash
lualatex --output-directory=tmp your-cookbook.tex
lualatex --output-directory=tmp your-cookbook.tex
```

- Incorporates generated index
- Resolves all cross-references
- Finalizes table of contents and page numbers

## Requirements

### LaTeX Distribution

You need a LaTeX distribution with LuaLaTeX support:

#### macOS

```bash
# Install MacTeX via Homebrew
brew install --cask mactex

# Or install BasicTeX (smaller)
brew install --cask basictex
```

#### Linux (Ubuntu/Debian)

```bash
# Install full TeXLive
sudo apt-get install texlive-full

# Or install basic TeXLive
sudo apt-get install texlive-latex-base texlive-luatex
```

#### Windows

Download and install one of:
- **MiKTeX**: https://miktex.org/download
- **TeX Live**: https://www.tug.org/texlive/

### Required Packages

The template requires these LaTeX packages (usually included in full distributions):

- `fontspec` - Font management
- `geometry` - Page layout
- `graphicx` - Image handling
- `xcolor` - Color support
- `babel` - Language support
- `imakeidx` - Index generation
- `emoji` - Emoji support
- `paracol` - Multi-column layout
- `enumitem` - List customization
- `etoolbox` - Programming tools
- `ifthen` - Conditional logic
- `xstring` - String manipulation
- `xparse` - Command parsing

### Verifying Installation

```bash
# Check LuaLaTeX
lualatex --version

# Check makeindex
makeindex --version
```

## Directory Structure

```
project/
├── your-cookbook.tex      # Your cookbook source
├── CookBook.cls           # Template class file
├── build.sh               # Build script
├── images/                # Image directory
│   ├── book/             # Book images (cover, preface, etc.)
│   └── recipes/          # Recipe images
├── dist/                 # Final PDFs (created by build script)
└── tmp/                  # Temporary build files
```

## Docker Build

Use Docker for consistent builds across systems:

### Using Docker Compose

```bash
# Build using docker-compose
docker-compose up

# Clean up
docker-compose down
```

### Using Dockerfile Directly

```bash
# Build Docker image
docker build -t latex-cookbook .

# Run compilation
docker run --rm -v $(pwd):/workspace latex-cookbook

# On Windows (PowerShell)
docker run --rm -v ${PWD}:/workspace latex-cookbook
```

The Docker setup:
- Uses a consistent LaTeX environment
- Includes all required packages
- Outputs PDFs to `dist/` directory
- No need to install LaTeX locally

## Build Options

### Draft Mode

Speed up compilation during editing by skipping images:

```latex
\documentclass[draft]{CookBook}
```

This:
- Skips image loading (shows placeholder boxes)
- Compiles much faster
- Useful for checking layout and text

Remove `draft` option for final build.

### Verbose Compilation

See detailed compilation output:

```bash
# With build script
./build.sh -v

# Manual compilation
lualatex your-cookbook.tex
```

### Specific Output Directory

```bash
lualatex --output-directory=custom-dir your-cookbook.tex
```

## Troubleshooting Compilation

### "Command not found: lualatex"

**Problem**: LaTeX is not installed or not in PATH

**Solution**: Install a LaTeX distribution (see Requirements section)

### "File not found" errors

**Problem**: Missing image or class files

**Solution**:
- Verify image paths are correct
- Ensure `CookBook.cls` is in the same directory as your `.tex` file
- Use relative paths for images

### Font errors

**Problem**: "Font 'FontName' not found"

**Solution**:
- Ensure you're using LuaLaTeX, not pdfLaTeX
- Install required fonts (EB Garamond, Source Sans Pro)
- See [Fonts documentation](fonts.md) for details

### Index not generating

**Problem**: Index appears empty or missing

**Solution**:
1. Ensure recipes include `indexes` parameter
2. Run `makeindex` between LaTeX passes
3. Use the build script which handles this automatically

### Compilation is slow

**Problem**: Compilation takes a long time

**Solutions**:
1. Use draft mode during editing: `\documentclass[draft]{CookBook}`
2. Comment out completed sections
3. Split large cookbooks into multiple files
4. Optimize image file sizes

### Package not found errors

**Problem**: "Package 'packagename' not found"

**Solution**:
```bash
# Update package database
tlmgr update --self

# Install missing package
tlmgr install packagename
```

## Build Performance Tips

### For Large Cookbooks (100+ pages)

1. **Use draft mode during editing**:
   ```latex
   \documentclass[draft]{CookBook}
   ```

2. **Comment out completed sections**:
   ```latex
   % \input{chapters/breakfast.tex}
   \input{chapters/lunch.tex}  % Working on this
   % \input{chapters/dinner.tex}
   ```

3. **Split into multiple files**:
   ```latex
   % main.tex
   \input{chapters/breakfast}
   \input{chapters/lunch}
   \input{chapters/dinner}
   ```

4. **Optimize images**:
   ```bash
   # Resize and compress images
   mogrify -resize 1920x1080 -quality 85 images/recipes/*.jpg
   ```

### Incremental Builds

For quick testing, compile once without re-running makeindex:

```bash
lualatex --output-directory=tmp your-cookbook.tex
```

Only run full build (with makeindex and multiple passes) for final output.

## Continuous Integration

### GitHub Actions Example

```yaml
name: Build Cookbook

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Compile LaTeX
        uses: xu-cheng/latex-action@v2
        with:
          root_file: your-cookbook.tex
          latexmk_use_lualatex: true
      - name: Upload PDF
        uses: actions/upload-artifact@v2
        with:
          name: cookbook-pdf
          path: your-cookbook.pdf
```

## Clean Up

### Manual Cleanup

```bash
# Remove temporary files
rm -rf tmp/*

# Remove specific file types
rm *.aux *.log *.toc *.idx *.ind *.ilg
```

### Build Script Cleanup

The build script automatically cleans up temporary files and organizes output:

- Temporary files → `tmp/` directory
- Final PDFs → `dist/` directory

---

## Related Documentation

- [Document Class Options](document-class-options.md) - Compilation options
- [Troubleshooting](troubleshooting.md) - Common issues and solutions
- [Fonts](fonts.md) - Font requirements

[← Back to Documentation Index](README.md)
