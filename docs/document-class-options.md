# Document Class Options

The `CookBook` class extends `extbook` and accepts various options for customizing your cookbook's appearance and layout.

## Basic Syntax

```latex
\documentclass[
    letterpaper,             % Paper size: 'letterpaper' or 'a4paper'
    10pt,                    % Font size: 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt, 20pt
    twoside,                 % Two-sided printing (affects margins and page numbering)
    english,                 % Language: 'english' or 'french' (default: english)
    left=even,               % Left pages: 'even' or 'odd' (default: even)
    startpage=1,             % Starting page number: 1 or 2 (default: 1)
    bleed,                   % Enable bleed margins for print production (default: disabled)
    ingredientstyle=list,    % Ingredient list style: 'list', 'compact', or 'tabular' (default: list)
]{CookBook}
```

## Paper Size Options

- `letterpaper` - US Letter (8.5" × 11")
- `a4paper` - A4 (210mm × 297mm)

**Example:**

```latex
\documentclass[a4paper]{CookBook}
```

## Font Size Options

Available sizes: `8pt`, `9pt`, `10pt`, `11pt`, `12pt`, `14pt`, `17pt`, `20pt`

**Example:**

```latex
\documentclass[letterpaper, 12pt]{CookBook}
```

## Page Layout Options

### Two-Sided Printing

- `twoside` - Enables two-sided printing with mirrored margins

**Example:**

```latex
\documentclass[letterpaper, twoside]{CookBook}
```

### Page Orientation

- `left=even` - Left pages are even-numbered (default for two-sided)
- `left=odd` - Left pages are odd-numbered

**Example:**

```latex
\documentclass[letterpaper, twoside, left=odd]{CookBook}
```

### Starting Page Number

- `startpage=1` - Start page numbering from 1 (default)
- `startpage=2` - Start page numbering from 2

**Example:**

```latex
\documentclass[letterpaper, startpage=2]{CookBook}
```

## Language Options

- `english` - English language (default)
- `french` - French language

All text labels (Serves, Prep, Cooking, etc.) are automatically translated based on the language setting.

**Example:**

```latex
\documentclass[french]{CookBook}
```

See [Translation and Language Support](translation.md) for detailed language customization.

## Ingredient Style Options

Control how ingredient lists are displayed throughout the cookbook:

- `ingredientstyle=list` - Traditional bullet point list (default)
- `ingredientstyle=compact` - Simple list without bullets, with hanging indent
- `ingredientstyle=tabular` - Two-column table format with quantities aligned

**Example:**

```latex
\documentclass[ingredientstyle=tabular]{CookBook}
```

You can also set the ingredient style in the document preamble:

```latex
\setingredientstyle{compact}
```

And override it per recipe:

```latex
\recipe{
    ingredientstyle={tabular},
    ...
}
```

See [Recipe Elements](recipe-elements.md#ingredient-list-styles) for detailed information about ingredient styles and customization options.

## Bleed Options

Bleed margins are required for professional print production (e.g., Lulu, Blurb, etc.) to ensure images and backgrounds extend to the page edges after trimming.

### Basic Bleed

- `bleed` - Enable bleed margins (boolean option, default: disabled)
  - When enabled, uses default bleed value of 0.125 inches (3.175 mm) on all sides (Lulu standard)

**Example:**

```latex
\documentclass[letterpaper, 10pt, twoside, bleed]{CookBook}
```

### Debug Mode

- `bleed=debug` - Enable bleed margins and draw the bleed area boundaries for visualization
  - Draws a red dashed line at the trim edge (where the page will be cut)
  - Draws a blue solid line at the bleed edge (outer boundary of the bleed area)
  - Useful for verifying that content extends into the bleed area correctly

**Example:**

```latex
\documentclass[letterpaper, bleed=debug]{CookBook}
```

### Setting Custom Bleed Values

You can override the default bleed value using the `\setbleedvalue` command:

```latex
\documentclass[letterpaper, 10pt, twoside, bleed]{CookBook}
\setbleedvalue{0.125in}  % Override bleed value (default is already 0.125in)
% or
\setbleedvalue{3.175mm}  % Metric equivalent
```

### Enabling Bleed After Document Class

You can also enable bleed after the document class declaration:

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}
\enablebleed          % Enable with default 0.125in bleed
% or
\enablebleed{0.125in} % Enable with custom bleed value
```

### Gutter Margins for Print Binding

For print production, you may need to adjust inner margins (gutter) to prevent content from being lost in the binding. The gutter margin adds extra space to the inner (left) margin.

```latex
\documentclass[letterpaper, 10pt, twoside, bleed]{CookBook}
\setguttermargin{0.5in}  % Add 0.5 inches to inner margin for binding
% or
\setguttermargin{1.25cm} % Metric equivalent
```

### Bleed Image Ratio

Control how much of images should extend into the bleed area. This is useful for fine-tuning how images are positioned relative to the trim edge.

```latex
\documentclass[letterpaper, 10pt, twoside, bleed]{CookBook}
\setbleedimageratio{0.5}  % Default: 50% of images in bleed area
\setbleedimageratio{0.3}  % 30% of images in bleed area (more conservative)
\setbleedimageratio{1.0}  % 100% of images in bleed area (full bleed)
\setbleedimageratio{0.0}  % No images in bleed area
```

- **Default:** `0.5` (50% of images extend into bleed)
- **Range:** `0.0` to `1.0`
  - `0.0` = No image content in bleed area
  - `0.5` = Half of image extends into bleed (default)
  - `1.0` = Full image extends into bleed area

### Complete Bleed Example

```latex
\documentclass[
    letterpaper,
    10pt,
    twoside,
    bleed,  % Enable bleed for print production
]{CookBook}

% Optionally override default bleed value
\setbleedvalue{0.125in}

% Set gutter margin for binding
\setguttermargin{0.5in}

% Control how much of images extend into bleed area
\setbleedimageratio{0.3}

\begin{document}
% ... your content ...
\end{document}
```

### Important Notes

- When bleed is enabled, the PDF paper size is automatically increased by 2×bleed (bleed on each side)
- All edge-extending content (cover images, full-page images, etc.) automatically extends into the bleed area
- Text content maintains safety margins (0.5" minimum from trim edge) to prevent cutting

## Complete Example

```latex
\documentclass[
    letterpaper,
    11pt,
    twoside,
    english,
    left=even,
    startpage=1,
    bleed
]{CookBook}

% Additional customizations
\setbleedvalue{0.125in}
\setguttermargin{0.5in}

\begin{document}
% Your cookbook content
\end{document}
```

---

[← Back to Documentation Index](README.md)
