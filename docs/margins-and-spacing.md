# Margins and Spacing

Customize page margins and spacing throughout your cookbook.

## Page Margins

### Customizing Page Margins

Adjust margins after loading the document class:

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

% Customize margins
\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2cm}    % Uses 'inner' for twoside, 'left' for oneside
\setmarginright{2cm}   % Uses 'outer' for twoside, 'right' for oneside
```

### Default Margins

- **Top**: `1.5cm`
- **Bottom**: `1.5cm`
- **Left/Inner**: `1.5cm`
- **Right/Outer**: `1.5cm`

### Two-Sided vs. One-Sided Documents

#### Two-Sided Documents (`twoside` option)

For books with mirrored margins:

- `\setmarginleft` sets the **inner** margin (left edge of left pages, right edge of right pages)
- `\setmarginright` sets the **outer** margin (right edge of left pages, left edge of right pages)

```latex
\documentclass[letterpaper, twoside]{CookBook}

\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2.5cm}  % Inner margin (larger for binding)
\setmarginright{1.5cm}  % Outer margin
```

#### One-Sided Documents

For documents without mirrored margins:

- `\setmarginleft` sets the **left** margin
- `\setmarginright` sets the **right** margin

```latex
\documentclass[letterpaper]{CookBook}

\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2cm}    % Left margin
\setmarginright{2cm}   % Right margin
```

## Margin Examples

### Standard Margins

Equal margins on all sides:

```latex
\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2cm}
\setmarginright{2cm}
```

### Print Binding Margins

Larger inner margin for binding:

```latex
\documentclass[letterpaper, twoside]{CookBook}

\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2.5cm}  % Larger inner margin
\setmarginright{1.5cm}  % Smaller outer margin
```

### Wide Margins

For notes or annotations:

```latex
\setmargintop{3cm}
\setmarginbottom{3cm}
\setmarginleft{3cm}
\setmarginright{3cm}
```

### Minimal Margins

Maximum content space:

```latex
\setmargintop{1cm}
\setmarginbottom{1cm}
\setmarginleft{1cm}
\setmarginright{1cm}
```

## Gutter Margins

For print production, add extra inner margin space for binding:

```latex
\documentclass[letterpaper, twoside, bleed]{CookBook}

\setguttermargin{0.5in}  % Add 0.5 inches to inner margin
% or
\setguttermargin{1.25cm} % Metric equivalent
```

See [Document Class Options](document-class-options.md) for more on gutter margins and bleed settings.

## Spacing Controls

### Global Spacing

Control spacing throughout your document:

#### List Spacing Before

Space before lists (ingredients and instructions):

```latex
% Default: 0pt
\setlistbefore{-1\baselineskip}  % Negative space
\setlistbefore{0pt}              % No extra space
\setlistbefore{0.5cm}            % Fixed space
```

#### Ingredient Item Spacing

Vertical space between ingredient items:

```latex
% Default: 0.005\textheight
\setingredientitemsep{0.01\textheight}  % Relative to page height
\setingredientitemsep{2pt}              % Fixed spacing
\setingredientitemsep{0.5\baselineskip} % Relative to line height
```

#### Instruction Item Spacing

Vertical space between instruction steps:

```latex
% Default: 0.005\textheight
\setinstructionitemsep{0.5\baselineskip}  % Relative to line height
\setinstructionitemsep{4pt}               % Fixed spacing
\setinstructionitemsep{0.01\textheight}   % Relative to page height
```

#### Column Spacing

Space between recipe columns (columns layout only):

```latex
% Default: 0.05\textwidth
\setcolumnsep{0.1\textwidth}  % Relative to text width
\setcolumnsep{10pt}           % Fixed spacing
\setcolumnsep{1cm}            % Fixed spacing in cm
```

### Per-Recipe Spacing

Override global settings for individual recipes:

```latex
\recipe{
    title={My Recipe},
    ingredientitemsep={0.01\textheight},
    instructionitemsep={0.5\baselineskip},
    columnsep={0.05\textwidth},
    % ... rest of recipe
}
```

## Spacing Examples

### Compact Spacing

Minimal spacing for shorter cookbooks:

```latex
\setlistbefore{-0.5\baselineskip}
\setingredientitemsep{1pt}
\setinstructionitemsep{2pt}
\setcolumnsep{0.03\textwidth}
```

### Standard Spacing

Balanced spacing (default values):

```latex
\setlistbefore{0pt}
\setingredientitemsep{0.005\textheight}
\setinstructionitemsep{0.005\textheight}
\setcolumnsep{0.05\textwidth}
```

### Generous Spacing

Extra breathing room for readability:

```latex
\setlistbefore{0.5\baselineskip}
\setingredientitemsep{0.01\textheight}
\setinstructionitemsep{0.75\baselineskip}
\setcolumnsep{0.08\textwidth}
```

### Recipe-Specific Spacing

Adjust spacing for a particular recipe:

```latex
% Most recipes use default spacing
\recipe{
    title={Standard Recipe},
    % uses global spacing
}

% One recipe needs tighter spacing
\recipe{
    title={Long Recipe},
    ingredientitemsep={0.003\textheight},
    instructionitemsep={0.3\baselineskip},
    % ... rest of recipe
}

% Another recipe needs more space
\recipe{
    title={Featured Recipe},
    ingredientitemsep={0.015\textheight},
    instructionitemsep={1\baselineskip},
    % ... rest of recipe
}
```

## Complete Margin and Spacing Example

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

% Set margins for print binding
\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2.5cm}   % Larger inner margin for binding
\setmarginright{1.5cm}  % Smaller outer margin

% Set global spacing
\setlistbefore{0pt}
\setingredientitemsep{0.005\textheight}
\setinstructionitemsep{0.5\baselineskip}
\setcolumnsep{0.05\textwidth}

\begin{document}

\makecoverpage{
    title={My Cookbook}
}

\maketoc

\makechapterpage{title={Recipes}}

% Recipe using global spacing
\recipe{
    title={Standard Recipe},
    ingredients={
        \ingredient{flour}[2][cups][]
        \ingredient{eggs}[3][][]
    },
    instructions={
        \instruction{Mix ingredients.}
        \instruction{Bake for 30 minutes.}
    }
}

% Recipe with custom spacing
\recipe{
    title={Featured Recipe},
    ingredientitemsep={0.01\textheight},
    instructionitemsep={0.75\baselineskip},
    ingredients={
        \ingredient{flour}[2][cups][]
        \ingredient{eggs}[3][][]
    },
    instructions={
        \instruction{Mix ingredients carefully.}
        \instruction{Let rest for 10 minutes.}
        \instruction{Bake for 30 minutes.}
    }
}

\end{document}
```

## Units Reference

### Relative Units

- `\textheight` - Height of text area
- `\textwidth` - Width of text area
- `\baselineskip` - Distance between baselines (line height)
- `\paperheight` - Total paper height
- `\paperwidth` - Total paper width

### Absolute Units

- `pt` - Points (1/72 inch)
- `mm` - Millimeters
- `cm` - Centimeters
- `in` - Inches
- `em` - Width of letter 'M' in current font
- `ex` - Height of letter 'x' in current font

## Tips for Margins and Spacing

1. **Print Binding**: Use larger inner margins (gutter) for books that will be bound

2. **Consistency**: Keep spacing consistent throughout your cookbook for professional appearance

3. **Readability**: Don't make margins too small or spacing too tight

4. **Testing**: Print test pages to verify margins and spacing look good in physical form

5. **Paper Size**: Adjust margins based on paper size (smaller margins for larger paper)

6. **Relative Units**: Use relative units (`\textheight`, `\baselineskip`) for consistent scaling across different font sizes

7. **Recipe Length**: Adjust per-recipe spacing for long recipes that need to fit on fewer pages

---

## Related Documentation

- [Document Class Options](document-class-options.md) - Page layout options and bleed settings
- [Recipe Command](recipe-command.md) - Recipe-specific spacing
- [Fonts](fonts.md) - Font sizes affecting spacing

[← Back to Documentation Index](README.md)
