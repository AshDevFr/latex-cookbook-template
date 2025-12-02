# Fonts

The template uses `fontspec` for modern font management with LuaLaTeX.

## Default Fonts

- **Serif**: EB Garamond
- **Sans-serif**: Source Sans Pro
- **Monospace**: Courier

## Font Commands

### Sans-Serif Text

```latex
{\sourcesanspro Your text here}
```

### Garamond Text

```latex
{\ebgaramond Your text here}
```

The serif font (EB Garamond) is the default throughout the template.

## Font Sizes

Use the `\fontsize` command to set custom font sizes:

```latex
\fontsize{24pt}{28pt}\selectfont Your text
```

- First parameter: Font size
- Second parameter: Line height (baseline skip)
- Must call `\selectfont` to apply the size

### Font Size Examples

```latex
% Small text
{\fontsize{10pt}{12pt}\selectfont Small text}

% Normal text
{\fontsize{12pt}{14pt}\selectfont Normal text}

% Large text
{\fontsize{18pt}{22pt}\selectfont Large text}

% Heading size
{\fontsize{24pt}{28pt}\selectfont Heading}

% Title size
{\fontsize{36pt}{40pt}\selectfont Title}
```

## Font Styles

### Bold

```latex
\textbf{Bold text}
```

### Italic

```latex
\textit{Italic text}
```

### Bold Italic

```latex
\textbf{\textit{Bold italic text}}
```

## Using Fonts in Templates

### Cover Page

```latex
\makecoverpage{
    title={My Cookbook},
    titlefontsize={\fontsize{48pt}{52pt}},
    subtitle={Delicious Recipes},
    subtitlefontsize={\fontsize{28pt}{32pt}},
    author={Chef Name},
    authorfontsize={\fontsize{22pt}{26pt}}
}
```

### Preface Page

```latex
\makeprefacepage{
    title={Preface},
    titlefontsize={\fontsize{32pt}{36pt}},
    text={Your preface text...},
    textfontsize={\fontsize{12pt}{16pt}}
}
```

### Conversion Tables

```latex
\makeconversionpage{
    title={Conversions},
    titlefontsize={\fontsize{36pt}{40pt}}
}
```

### Custom Content

```latex
\makeprefacepage{
    pagecontent={
        {\fontsize{40pt}{44pt}\selectfont\textbf{About the Author}}

        \vspace{1cm}

        {\fontsize{14pt}{18pt}\selectfont
        Jane Smith has been passionate about cooking for over 20 years.}
    }
}
```

## Changing Default Fonts

### Using System Fonts

Override the default fonts with system-installed fonts:

```latex
\documentclass[letterpaper, 10pt]{CookBook}

% Change main font
\setmainfont{Times New Roman}

% Change sans-serif font
\setsansfont{Arial}

% Change monospace font
\setmonofont{Courier New}

\begin{document}
% Your content
\end{document}
```

### Using Font Features

```latex
% With font features
\setmainfont{EB Garamond}[
    Ligatures=TeX,
    Numbers=OldStyle
]

\setsansfont{Source Sans Pro}[
    Scale=0.9,
    Ligatures=TeX
]
```

### Font Examples

#### Serif Fonts

```latex
% Classic serif fonts
\setmainfont{Times New Roman}
\setmainfont{Garamond}
\setmainfont{Baskerville}
\setmainfont{Palatino}
\setmainfont{Georgia}
```

#### Sans-Serif Fonts

```latex
% Modern sans-serif fonts
\setsansfont{Helvetica}
\setsansfont{Arial}
\setsansfont{Futura}
\setsansfont{Avenir}
\setsansfont{Roboto}
```

#### Decorative Fonts

```latex
% For special elements only
\newfontfamily\decorativefont{Didot}
```

## Font Combinations

### Classic and Elegant

```latex
\setmainfont{Garamond}
\setsansfont{Futura}
```

### Modern and Clean

```latex
\setmainfont{Helvetica Neue}
\setsansfont{Avenir}
```

### Traditional Cookbook

```latex
\setmainfont{Baskerville}
\setsansfont{Gill Sans}
```

### Contemporary

```latex
\setmainfont{Minion Pro}
\setsansfont{Myriad Pro}
```

## Font Size Guidelines

### Recommended Sizes

| Element | Recommended Size |
|---------|-----------------|
| Body text | 10pt - 12pt |
| Recipe titles | 18pt - 24pt |
| Chapter titles | 28pt - 36pt |
| Cover title | 36pt - 48pt |
| Captions | 10pt - 14pt |
| Notes | 9pt - 11pt |

### Complete Font Example

```latex
\documentclass[letterpaper, 11pt, twoside]{CookBook}

% Custom fonts
\setmainfont{Baskerville}
\setsansfont{Helvetica Neue}

\begin{document}

% Cover with large title
\makecoverpage{
    title={My Cookbook},
    titlefontsize={\fontsize{48pt}{52pt}},
    subtitle={Family Recipes},
    subtitlefontsize={\fontsize{24pt}{28pt}},
    author={Jane Smith},
    authorfontsize={\fontsize{18pt}{22pt}}
}

% Preface with custom text size
\makeprefacepage{
    title={Introduction},
    titlefontsize={\fontsize{32pt}{36pt}},
    text={Welcome to my collection of recipes...},
    textfontsize={\fontsize{12pt}{16pt}}
}

% Recipes use document font size (11pt from class option)
\recipe{
    title={My Recipe},
    % Content uses 11pt body text
}

\end{document}
```

## Font Management Tips

1. **LuaLaTeX Required**: The template requires LuaLaTeX for `fontspec` support. Do not use pdfLaTeX.

2. **Font Availability**: Ensure fonts are installed on your system before referencing them.

3. **Consistency**: Use consistent font sizes throughout your cookbook for professional appearance.

4. **Readability**: Choose readable fonts for body text. Save decorative fonts for titles only.

5. **Line Height**: Line height should typically be 120-145% of font size for good readability.

6. **Hierarchy**: Use font sizes to create visual hierarchy:
   - Larger for titles
   - Medium for headings
   - Standard for body text
   - Smaller for notes and captions

7. **Print vs. Screen**: Fonts may appear differently in print. Test print a page before finalizing.

## Font Troubleshooting

### Font Not Found Error

**Problem**: "Font 'FontName' not found"

**Solution**:
1. Verify font is installed on your system
2. Check exact font name (case-sensitive)
3. Use system font viewer to find correct name
4. Install missing fonts

### Using Default Fonts

If custom fonts cause issues, use the template defaults:

```latex
\documentclass[letterpaper, 10pt]{CookBook}
% No font customization - uses EB Garamond and Source Sans Pro
```

### Font Installation

#### macOS
```bash
# Install via Homebrew
brew tap homebrew/cask-fonts
brew install --cask font-eb-garamond
brew install --cask font-source-sans-pro
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get install fonts-ebgaramond
sudo apt-get install fonts-source-sans-pro
```

#### Windows
Download and install fonts from:
- EB Garamond: https://fonts.google.com/specimen/EB+Garamond
- Source Sans Pro: https://fonts.google.com/specimen/Source+Sans+Pro

## Advanced Font Usage

### Creating Font Families

Define custom font families for specific uses:

```latex
\newfontfamily\headingfont{Futura}[Scale=1.1]
\newfontfamily\titlefont{Didot}[Scale=1.2]

% Use in custom content
\makeprefacepage{
    pagecontent={
        {\titlefont\fontsize{40pt}{44pt}\selectfont My Cookbook}

        \vspace{1cm}

        {\headingfont\fontsize{24pt}{28pt}\selectfont Subtitle}
    }
}
```

### Mixing Fonts

```latex
% Recipe title in sans-serif, content in serif
\recipe{
    title={{\sourcesanspro My Recipe}},
    ingredients={
        % Uses default serif font
        \ingredient{flour}[2][cups][]
    }
}
```

---

## Related Documentation

- [Document Class Options](document-class-options.md) - Base font size selection
- [Margins and Spacing](margins-and-spacing.md) - Line height and spacing
- [Build System](build-system.md) - Using LuaLaTeX

[← Back to Documentation Index](README.md)
