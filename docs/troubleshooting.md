# Troubleshooting

Common issues and solutions for the LaTeX Cookbook Template.

## Installation Issues

### "Command not found: lualatex"

**Problem**: LaTeX is not installed or not in the system PATH.

**Solution**: Install a LaTeX distribution:

#### macOS
```bash
brew install --cask mactex
# Or for a smaller installation:
brew install --cask basictex
```

#### Ubuntu/Debian
```bash
sudo apt-get install texlive-full
# Or for a minimal installation:
sudo apt-get install texlive-latex-base texlive-luatex
```

#### Windows
Download and install:
- **MiKTeX**: https://miktex.org/download
- **TeX Live**: https://www.tug.org/texlive/

### Missing Package Errors

**Problem**: "File 'packagename.sty' not found"

**Solution**: Install the missing package:

```bash
# Update package manager
tlmgr update --self

# Install specific package
tlmgr install packagename

# Or install all required packages
tlmgr install fontspec geometry graphicx xcolor babel imakeidx emoji paracol enumitem etoolbox ifthen xstring xparse
```

## Font Issues

### "Font not found" Errors

**Problem**: "Font 'EB Garamond' not found" or similar font errors.

**Solution**:

1. **Verify LuaLaTeX**: Ensure you're using LuaLaTeX, not pdfLaTeX:
   ```bash
   lualatex your-cookbook.tex
   # NOT: pdflatex your-cookbook.tex
   ```

2. **Install Required Fonts**:

   **macOS**:
   ```bash
   brew tap homebrew/cask-fonts
   brew install --cask font-eb-garamond
   brew install --cask font-source-sans-pro
   ```

   **Linux (Ubuntu/Debian)**:
   ```bash
   sudo apt-get install fonts-ebgaramond
   sudo apt-get install fonts-source-sans-pro
   ```

   **Windows**:
   Download and install fonts manually:
   - EB Garamond: https://fonts.google.com/specimen/EB+Garamond
   - Source Sans Pro: https://fonts.google.com/specimen/Source+Sans+Pro

3. **Update Font Cache** (Linux):
   ```bash
   fc-cache -f -v
   ```

### Wrong Compiler

**Problem**: Various font-related errors or missing features.

**Solution**: The template requires **LuaLaTeX**. Do not use pdfLaTeX.

```bash
# Correct:
lualatex your-cookbook.tex

# Incorrect:
pdflatex your-cookbook.tex  # Don't use this!
```

## Image Issues

### Images Not Displaying

**Problem**: Images don't appear in the compiled PDF.

**Solution**:

1. **Check Image Paths**: Ensure paths are relative to your `.tex` file:
   ```latex
   % Correct:
   image={images/recipes/pancakes.jpg}

   % Incorrect:
   image={/Users/yourname/images/recipes/pancakes.jpg}  % Absolute path won't work on other systems
   ```

2. **Verify Image Files Exist**: Check that image files are in the correct location:
   ```bash
   ls images/recipes/pancakes.jpg
   ```

3. **Check Image Format**: Use supported formats:
   - JPG/JPEG ✓
   - PNG ✓
   - PDF ✓
   - BMP ✗ (not recommended)

4. **File Permissions**: Ensure files are readable:
   ```bash
   chmod 644 images/recipes/*.jpg
   ```

### Images Cut Off or Distorted

**Problem**: Images are cropped or stretched incorrectly.

**Solution**:

1. **Check Image Dimensions**: Ensure images are high enough resolution
2. **Adjust Image Height**: Use `imageheight` parameter:
   ```latex
   \recipe{
       image={images/recipes/pancakes.jpg},
       imageheight={0.4\paperheight},  % Adjust this value
       % ...
   }
   ```

3. **Check Aspect Ratio**: Images should ideally match paper aspect ratio or be cropped appropriately

## Index Issues

### Index Not Generating

**Problem**: Index is empty or doesn't appear.

**Solution**:

1. **Add Index Entries**: Ensure recipes include `indexes` parameter:
   ```latex
   \recipe{
       title={Pancakes},
       indexes={Pancakes, Recipes!Breakfast},  % Add this
       % ...
   }
   ```

2. **Run makeindex**: Between LaTeX passes:
   ```bash
   lualatex your-cookbook.tex
   makeindex your-cookbook.idx
   lualatex your-cookbook.tex
   lualatex your-cookbook.tex
   ```

3. **Use Build Script**: The build script handles this automatically:
   ```bash
   ./build.sh
   ```

4. **Check for printindex Command**: Ensure you include:
   ```latex
   \printindex
   ```

### Index Entries Not Appearing

**Problem**: Some recipes don't show up in the index.

**Solution**:

1. **Check Syntax**: Ensure proper comma separation:
   ```latex
   % Correct:
   indexes={Entry 1, Entry 2, Entry 3}

   % Incorrect:
   indexes={Entry 1 Entry 2}  # Missing commas
   ```

2. **Hierarchical Entries**: Use `!` for sub-entries:
   ```latex
   indexes={Pancakes, Recipes!Breakfast, Recipes!Sweet}
   ```

## Compilation Issues

### Compilation Hangs or Freezes

**Problem**: LaTeX compilation stops responding.

**Solution**:

1. **Cancel and Retry**: Press Ctrl+C to cancel, then retry
2. **Check for Errors**: Look for syntax errors in your `.tex` file
3. **Clear Temporary Files**:
   ```bash
   rm -rf tmp/*
   rm *.aux *.log *.toc
   ```
4. **Check for Infinite Loops**: Review custom commands or loops in your document

### "TeX capacity exceeded" Error

**Problem**: Document is too large or has recursive definitions.

**Solution**:

1. **Split Large Documents**: Break into multiple files:
   ```latex
   \input{chapters/breakfast}
   \input{chapters/lunch}
   \input{chapters/dinner}
   ```

2. **Reduce Image Sizes**: Compress and resize images:
   ```bash
   mogrify -resize 1920x1080 -quality 85 images/*.jpg
   ```

3. **Use Draft Mode**: During editing:
   ```latex
   \documentclass[draft]{CookBook}
   ```

### "Undefined control sequence" Errors

**Problem**: Command not recognized by LaTeX.

**Solution**:

1. **Check Command Spelling**: Verify command names are correct:
   ```latex
   % Correct:
   \makecoverpage{title={My Book}}

   % Incorrect:
   \makeCoverPage{title={My Book}}  # Wrong capitalization
   ```

2. **Ensure CookBook.cls is Available**: The class file must be in the same directory as your `.tex` file

3. **Check for Typos**: Review your code for typos in command names

## Layout Issues

### Recipes Overlap or Have Spacing Problems

**Problem**: Recipe content overlaps or has inconsistent spacing.

**Solution**:

1. **Adjust Spacing**: Use spacing controls:
   ```latex
   \setingredientitemsep{0.01\textheight}
   \setinstructionitemsep{0.5\baselineskip}
   ```

2. **Per-Recipe Adjustment**:
   ```latex
   \recipe{
       ingredientitemsep={0.005\textheight},
       instructionitemsep={0.3\baselineskip},
       % ...
   }
   ```

3. **Check Layout Option**: Try different layouts:
   ```latex
   layout={simple}  % or layout={columns}
   ```

### Page Breaks in Wrong Places

**Problem**: Content breaks awkwardly across pages.

**Solution**:

1. **Use fullpage Option**:
   ```latex
   \recipe{
       fullpage={true},  % Forces recipe to new page
       % ...
   }
   ```

2. **Control Page Breaks**:
   ```latex
   \recipe{
       fullpage={true},
       clearpageafter={false},  % Allows content to flow
       % ...
   }
   ```

3. **Manual Page Breaks**: Add between recipes if needed:
   ```latex
   \clearpage
   ```

### Margins Too Small or Too Large

**Problem**: Page margins don't look right.

**Solution**: Adjust margins:

```latex
\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2.5cm}
\setmarginright{1.5cm}
```

See [Margins and Spacing](margins-and-spacing.md) for details.

## Babel/Language Issues

### Babel Package Errors

**Problem**: Errors related to babel or language settings.

**Solution**:

1. **Install Babel**: Ensure babel is installed:
   ```bash
   tlmgr install babel babel-english babel-french
   ```

2. **Use Valid Language Options**:
   ```latex
   % Correct:
   \documentclass[english]{CookBook}
   \documentclass[french]{CookBook}

   % Incorrect:
   \documentclass[spanish]{CookBook}  # Not supported by default
   ```

3. **Clear Auxiliary Files**: Remove old aux files:
   ```bash
   rm *.aux
   ```

## Build Script Issues

### Build Script Won't Run

**Problem**: `./build.sh` produces "Permission denied" error.

**Solution**: Make script executable:

```bash
chmod +x build.sh
./build.sh
```

### Build Script Fails on Windows

**Problem**: Build script doesn't work on Windows.

**Solution**:

1. **Use Git Bash or WSL**: Run the script in a Unix-like environment
2. **Use Docker**: Build with Docker instead:
   ```bash
   docker-compose up
   ```
3. **Manual Compilation**: Use manual compilation steps (see [Build System](build-system.md))

## Docker Issues

### Docker Build Fails

**Problem**: Docker build or docker-compose fails.

**Solution**:

1. **Update Docker**: Ensure Docker is up to date
2. **Check docker-compose.yml**: Verify configuration is correct
3. **Rebuild Image**:
   ```bash
   docker-compose build --no-cache
   docker-compose up
   ```

4. **Check Permissions**: Ensure Docker has access to project directory

## Performance Issues

### Compilation is Very Slow

**Problem**: Compilation takes a long time.

**Solutions**:

1. **Use Draft Mode**:
   ```latex
   \documentclass[draft]{CookBook}
   ```

2. **Comment Out Sections**:
   ```latex
   % \input{chapters/completed.tex}
   \input{chapters/working.tex}  # Only compile this
   ```

3. **Optimize Images**:
   ```bash
   mogrify -resize 1920x1080 -quality 85 images/**/*.jpg
   ```

4. **Incremental Builds**: Skip unnecessary passes:
   ```bash
   lualatex your-cookbook.tex  # Just one pass for quick preview
   ```

## Getting Help

If you encounter issues not covered here:

1. **Check Examples**: Review the [examples directory](../samples/) for working code
2. **Review Documentation**: Check all documentation files for correct syntax
3. **Open an Issue**: Report bugs on GitHub with:
   - Your LaTeX version (`lualatex --version`)
   - Minimal example reproducing the issue
   - Complete error messages
   - Your operating system

### Useful Commands for Debugging

```bash
# Check LaTeX version
lualatex --version

# Check package manager
tlmgr --version

# List installed packages
tlmgr list --only-installed

# Check font availability
fc-list | grep Garamond

# Verbose compilation
lualatex -interaction=nonstopmode your-cookbook.tex
```

### Creating Minimal Example for Bug Reports

When reporting issues, create a minimal example:

```latex
\documentclass[letterpaper, 10pt]{CookBook}

\begin{document}

\makecoverpage{
    title={Test}
}

\recipe{
    title={Test Recipe},
    ingredients={
        \ingredient{Test ingredient}
    },
    instructions={
        \instruction{Test instruction}
    }
}

\end{document}
```

Reduce your code to the smallest example that reproduces the problem.

---

## Related Documentation

- [Build System](build-system.md) - Compilation instructions
- [Document Class Options](document-class-options.md) - Class configuration
- [Examples](examples.md) - Working examples

[← Back to Documentation Index](README.md)
