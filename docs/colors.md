# Colors

Customize your cookbook's appearance with colors.

## Predefined Colors

The template includes three predefined colors:

```latex
darkgrey   % HTML: #1a1a1a
lightgrey  % HTML: #808080
paleorange % HTML: #eb984e
```

## Using Colors

Colors can be used in various commands throughout the template:

### Cover Page

```latex
\makecoverpage{
    title={My Cookbook},
    bgcolor={darkgrey},
    textcolor={white},
    shadowcolor={black}
}
```

### Chapter Page

```latex
\makechapterpage{
    title={Breakfast},
    bgcolor={paleorange},
    textcolor={white}
}
```

### Preface Page

```latex
\makeprefacepage{
    title={Preface},
    text={...},
    bgcolor={lightgrey},
    textcolor={darkgrey}
}
```

### Image Page

```latex
\makeimagepage{
    image={path/to/image.jpg},
    caption={Beautiful Dish},
    textcolor={white},
    shadowcolor={black}
}
```

### Back Cover

```latex
\makebackcoverpage{
    topcontent={...},
    bgcolor={darkgrey},
    textcolor={white}
}
```

### Recipe Column Separator

```latex
\recipe{
    layout={columns},
    columnseprulecolor={lightgrey},
    % ...
}
```

## Defining Custom Colors

### Using Standard LaTeX Colors

```latex
% Basic colors
bgcolor={red}
bgcolor={blue}
bgcolor={green}
textcolor={white}
textcolor={black}

% Mixed colors (percentage)
bgcolor={blue!50}        % 50% blue
bgcolor={red!75!blue}    % 75% red, 25% blue
bgcolor={green!50!black} % 50% green, 50% black
```

### Defining RGB Colors

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

% Define custom RGB colors
\definecolor{myblue}{RGB}{0, 120, 200}
\definecolor{mygreen}{RGB}{50, 150, 50}
\definecolor{myred}{RGB}{200, 50, 50}

\begin{document}

\makecoverpage{
    title={My Cookbook},
    bgcolor={myblue},
    textcolor={white}
}

\end{document}
```

### Defining HTML/Hex Colors

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

% Define custom hex colors
\definecolor{warmgray}{HTML}{8B8680}
\definecolor{seafoam}{HTML}{93E9BE}
\definecolor{coral}{HTML}{FF6B6B}

\begin{document}

\makechapterpage{
    title={Breakfast},
    bgcolor={seafoam},
    textcolor={warmgray}
}

\end{document}
```

## Color Examples

### Monochromatic Theme

Using shades of one color:

```latex
\definecolor{darkblue}{RGB}{0, 51, 102}
\definecolor{mediumblue}{RGB}{51, 102, 153}
\definecolor{lightblue}{RGB}{153, 204, 255}

\makecoverpage{
    bgcolor={darkblue},
    textcolor={white}
}

\makechapterpage{
    title={Breakfast},
    bgcolor={mediumblue},
    textcolor={white}
}

\makechapterpage{
    title={Lunch},
    bgcolor={lightblue},
    textcolor={darkblue}
}
```

### Warm Color Palette

```latex
\definecolor{warmred}{HTML}{E63946}
\definecolor{warmorange}{HTML}{F77F00}
\definecolor{warmyellow}{HTML}{FCBF49}

\makecoverpage{
    bgcolor={warmred},
    textcolor={white}
}

\makechapterpage{
    title={Breakfast},
    bgcolor={warmorange}
}

\makechapterpage{
    title={Lunch},
    bgcolor={warmyellow}
}
```

### Cool Color Palette

```latex
\definecolor{coolblue}{HTML}{0077B6}
\definecolor{coolcyan}{HTML}{00B4D8}
\definecolor{coolmint}{HTML}{90E0EF}

\makecoverpage{
    bgcolor={coolblue},
    textcolor={white}
}

\makechapterpage{
    title={Salads},
    bgcolor={coolcyan}
}

\makechapterpage{
    title={Desserts},
    bgcolor={coolmint}
}
```

### Earth Tones

```latex
\definecolor{earth brown}{HTML}{8B4513}
\definecolor{earthgreen}{HTML}{556B2F}
\definecolor{earthbeige}{HTML}{D2B48C}

\makecoverpage{
    bgcolor={earthbrown},
    textcolor={white}
}

\makechapterpage{
    title={Vegetables},
    bgcolor={earthgreen},
    textcolor={white}
}

\makechapterpage{
    title={Grains},
    bgcolor={earthbeige}
}
```

### Professional Gray Scale

```latex
\definecolor{charcoal}{HTML}{36454F}
\definecolor{slate}{HTML}{708090}
\definecolor{silver}{HTML}{C0C0C0}

\makecoverpage{
    bgcolor={charcoal},
    textcolor={white}
}

\makechapterpage{
    title={Entrees},
    bgcolor={slate},
    textcolor={white}
}

\makechapterpage{
    title={Sides},
    bgcolor={silver}
}
```

## Color Schemes for Different Cookbook Themes

### Italian Cookbook

```latex
\definecolor{italianred}{HTML}{CE2B37}
\definecolor{italiangreen}{HTML}{009246}
\definecolor{italiancream}{HTML}{F5F5DC}

\makecoverpage{
    bgcolor={italianred},
    textcolor={italiancream}
}
```

### Asian Cookbook

```latex
\definecolor{asianred}{HTML}{DD0031}
\definecolor{asiangold}{HTML}{FFD700}
\definecolor{asianblack}{HTML}{1C1C1C}

\makecoverpage{
    bgcolor={asianred},
    textcolor={asiangold}
}
```

### French Cookbook

```latex
\definecolor{frenchnavy}{HTML}{002395}
\definecolor{frenchred}{HTML}{ED2939}
\definecolor{frenchcream}{HTML}{FFF8DC}

\makecoverpage{
    bgcolor={frenchnavy},
    textcolor={frenchcream}
}
```

### Vegan/Vegetarian Cookbook

```latex
\definecolor{leafgreen}{HTML}{4CAF50}
\definecolor{earthbrown}{HTML}{8D6E63}
\definecolor{naturalbeige}{HTML}{EFEBE9}

\makecoverpage{
    bgcolor={leafgreen},
    textcolor={white}
}
```

### Dessert Cookbook

```latex
\definecolor{sweetpink}{HTML}{FF69B4}
\definecolor{chocolatebrown}{HTML}{7B3F00}
\definecolor{vanillacream}{HTML}{FFF5EE}

\makecoverpage{
    bgcolor={sweetpink},
    textcolor={chocolatebrown}
}
```

## Complete Color Example

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

% Define custom color palette
\definecolor{brandprimary}{HTML}{2C5F2D}
\definecolor{brandsecondary}{HTML}{97BC62}
\definecolor{brandaccent}{HTML}{FF6B35}
\definecolor{brandneutral}{HTML}{4A4A4A}

\begin{document}

% Cover with primary color
\makecoverpage{
    title={Farm Fresh Recipes},
    subtitle={Seasonal Cooking},
    author={Chef Green},
    bgcolor={brandprimary},
    textcolor={white}
}

% Preface with neutral color
\makeprefacepage{
    title={About This Book},
    text={...},
    textcolor={brandneutral}
}

% Table of contents
\maketoc

% Chapter with secondary color
\makechapterpage{
    title={Spring Recipes},
    bgcolor={brandsecondary},
    textcolor={white}
}

% Recipes...

% Chapter with accent color
\makechapterpage{
    title={Summer Recipes},
    bgcolor={brandaccent},
    textcolor={white}
}

% More recipes...

% Back cover with primary color
\makebackcoverpage{
    topcontent={...},
    bgcolor={brandprimary},
    textcolor={white}
}

\end{document}
```

## Color Accessibility Tips

1. **Contrast**: Ensure sufficient contrast between text and background
   - Light text on dark backgrounds
   - Dark text on light backgrounds
   - Test readability before finalizing

2. **Consistency**: Use colors consistently throughout your cookbook
   - Same color for similar elements
   - Establish a color hierarchy

3. **Print vs. Digital**: Colors may appear differently in print vs. on screen
   - Test print a page before printing the entire cookbook
   - RGB for digital, CMYK for professional printing

4. **Color Blindness**: Consider color-blind readers
   - Don't rely solely on color to convey information
   - Use sufficient contrast
   - Test with color blindness simulators

5. **Brand Identity**: If publishing professionally, use brand colors consistently

## Tools for Finding Colors

- **Adobe Color**: color.adobe.com
- **Coolors**: coolors.co
- **ColorHunt**: colorhunt.co
- **HTML Color Codes**: htmlcolorcodes.com

---

## Related Documentation

- [Cover and Preface](cover-and-preface.md) - Front matter styling
- [Chapters and Navigation](chapters-and-navigation.md) - Chapter styling
- [Recipe Command](recipe-command.md) - Recipe styling

[← Back to Documentation Index](README.md)
