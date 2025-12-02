# Conversion Tables

Generate comprehensive measurement conversion pages for your cookbook.

## Conversion Page Command

The `\makeconversionpage{}` command creates professional conversion tables for cooking measurements.

### Complete Parameters

```latex
\makeconversionpage{
    title={Conversion Tables},           % Optional: Page title (default: translated)
    titlefontsize={\fontsize{32pt}{36pt}}, % Optional: Title font size
    textcolor={darkgrey},                % Optional: Text color
    bgcolor={colorname},                  % Optional: Background color
    layout={single}                       % Optional: 'single' or 'double'
}
```

## What's Included

The conversion page automatically includes:

### Volume Conversions
- Teaspoons to tablespoons
- Tablespoons to cups
- Cups to pints, quarts, and gallons
- US to metric conversions (ml, liters)

### Weight Conversions
- Ounces to pounds
- Grams to kilograms
- US to metric weight conversions

### Temperature Conversions
- Fahrenheit to Celsius
- Celsius to Fahrenheit
- Common cooking temperatures

### Oven Temperature Guide
- Low, medium, and high heat ranges
- Gas mark equivalents
- Baking and roasting temperatures

### Length Conversions
- Inches to centimeters
- Feet to meters
- Common cooking measurements

### Common Ingredient Conversions
- Butter measurements
- Flour measurements
- Sugar measurements
- Other common ingredients

## Basic Examples

### Simple Conversion Page

```latex
\makeconversionpage{}
```

Uses default settings with translated title based on document language.

### Custom Title

```latex
\makeconversionpage{
    title={Kitchen Conversions}
}
```

### Styled Conversion Page

```latex
\makeconversionpage{
    title={Measurement Guide},
    titlefontsize={\fontsize{36pt}{40pt}},
    textcolor={darkgrey}
}
```

### Colored Background

```latex
\makeconversionpage{
    title={Conversion Reference},
    bgcolor={paleorange},
    textcolor={white}
}
```

## Layout Options

### Single Page Layout (Default)

All conversions on one page:

```latex
\makeconversionpage{
    layout={single}
}
```

### Double Page Layout

Conversions spread across two pages:

```latex
\makeconversionpage{
    layout={double}
}
```

## Usage in Cookbook

### At End of Cookbook

Most common placement, before the index:

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

\begin{document}

% Cover and front matter
\makecoverpage{title={My Cookbook}}
\maketoc

% Chapters and recipes
\makechapterpage{title={Breakfast}}
\recipe{title={Pancakes}, % ...
}

% More chapters...

% Back matter
\makeconversionpage{}
\printindex

\makebackcoverpage{
    % ... back cover content
}

\end{document}
```

### After Table of Contents

For easy reference throughout cookbook:

```latex
\makecoverpage{title={My Cookbook}}
\maketoc
\makeconversionpage{}

% Start recipes
\makechapterpage{title={Breakfast}}
% ...
```

### As a Separate Chapter

Create a dedicated reference chapter:

```latex
\makechapterpage{
    title={Kitchen Reference},
    subtitle={Measurements and Conversions}
}

\makeconversionpage{
    textcolor={darkgrey}
}
```

## Complete Examples

### Minimal Setup

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

\begin{document}

\makecoverpage{title={My Cookbook}}
\maketoc

% Recipes...

\makeconversionpage{}
\printindex

\end{document}
```

### Styled Conversion Page

```latex
\documentclass[letterpaper, 10pt, twoside, english]{CookBook}

\begin{document}

% Front matter
\makecoverpage{
    title={Home Cooking},
    author={Chef Smith}
}

\maketoc

% Recipes and chapters...

% Conversion tables with custom styling
\makeconversionpage{
    title={Kitchen Conversion Guide},
    titlefontsize={\fontsize{40pt}{44pt}},
    textcolor={darkgrey},
    layout={single}
}

% Index
\printindex

\end{document}
```

### Multi-Language Cookbook

```latex
\documentclass[french]{CookBook}

\begin{document}

\makecoverpage{title={Mon Livre de Cuisine}}
\maketoc

% Recipes...

% Conversion tables with French title
\makeconversionpage{
    title={Table de Conversion}
}

\printindex

\end{document}
```

## Customizing Conversion Tables

### Override Default Title

```latex
% English cookbook with custom title
\documentclass[english]{CookBook}

\begin{document}
% ...

\makeconversionpage{
    title={Measurement Reference Guide}
}

\end{document}
```

### Themed Conversion Page

Match your cookbook's color scheme:

```latex
\makeconversionpage{
    title={Conversions},
    bgcolor={paleorange},
    textcolor={white},
    titlefontsize={\fontsize{42pt}{46pt}}
}
```

## Translation Support

The conversion page title is automatically translated based on your document language:

```latex
% English (default)
\documentclass[english]{CookBook}
\makeconversionpage{}  % Title: "Conversion Tables"

% French
\documentclass[french]{CookBook}
\makeconversionpage{}  % Title: "Table de Conversion"
```

Override the default translation:

```latex
\documentclass[french]{CookBook}

% Custom French title
\setTextConversionTable{Conversions de Mesures}

\begin{document}
\makeconversionpage{}  % Uses custom title
\end{document}
```

See [Translation and Language Support](translation.md) for more details.

## Tips for Conversion Pages

1. **Placement**: Place conversion tables where readers can easily reference them:
   - At the end (most common)
   - After table of contents
   - As a separate reference chapter

2. **Consistency**: Match the styling to your cookbook's overall design

3. **Language**: Ensure the title matches your cookbook's language

4. **Accessibility**: Make sure text is readable with appropriate color contrast

5. **Layout**: Choose single or double page layout based on your design preferences and page count

---

## Related Documentation

- [Back Cover and Index](back-cover-and-index.md) - Other back matter pages
- [Translation and Language Support](translation.md) - Customizing text labels
- [Colors](colors.md) - Color customization

[← Back to Documentation Index](README.md)
