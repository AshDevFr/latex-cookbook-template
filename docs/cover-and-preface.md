# Cover and Preface Pages

Create professional front matter for your cookbook with customizable cover and preface pages.

## Cover Page

The `\makecoverpage{}` command creates a professional cover page with customizable styling.

### Complete Parameters

```latex
\makecoverpage{
    title={Title},                          % Required: Book title
    titlefontsize={\fontsize{36pt}{38pt}},  % Optional: Title font size
    subtitle={Subtitle},                    % Optional: Book subtitle
    subtitlefontsize={\fontsize{24pt}{26pt}}, % Optional: Subtitle font size
    author={Author Name},                   % Optional: Author name
    authorfontsize={\fontsize{20pt}{22pt}}, % Optional: Author font size
    image={./path/to/image.jpg},            % Optional: Cover image
    opacity={0.6},                          % Optional: Image opacity (0.0-1.0)
    bgcolor={darkgrey},                     % Optional: Background color
    textcolor={white},                      % Optional: Text color
    shadowcolor={black},                    % Optional: Drop shadow color
    shadowoffset={0.05cm}                   % Optional: Drop shadow offset
}
```

### Minimal Cover Example

```latex
\makecoverpage{
    title={My Cookbook}
}
```

### Full Cover Example

```latex
\makecoverpage{
    title={My Family Cookbook},
    titlefontsize={\fontsize{48pt}{52pt}},
    subtitle={Recipes from Three Generations},
    subtitlefontsize={\fontsize{28pt}{32pt}},
    author={Jane Smith},
    authorfontsize={\fontsize{24pt}{28pt}},
    image={images/book/cover.jpg},
    opacity={0.6},
    bgcolor={darkgrey},
    textcolor={white},
    shadowcolor={black},
    shadowoffset={0.05cm}
}
```

### Cover with Solid Color Background

```latex
\makecoverpage{
    title={Vegan Delights},
    subtitle={Plant-Based Cooking},
    author={Chef Green},
    bgcolor={paleorange},
    textcolor={white}
}
```

### Cover with Image Only

```latex
\makecoverpage{
    title={Italian Classics},
    subtitle={Traditional Recipes},
    author={Maria Rossi},
    image={images/book/italian-cover.jpg},
    opacity={0.8},
    textcolor={white},
    shadowcolor={black},
    shadowoffset={0.08cm}
}
```

## Preface Page

The `\makeprefacepage{}` command creates a preface or introduction page.

### Complete Parameters

```latex
\makeprefacepage{
    title={Preface},                        % Optional: Preface title
    titlefontsize={\fontsize{32pt}{36pt}},  % Optional: Title font size
    text={Preface text...},                 % Optional: Preface content
    textfontsize={\fontsize{12pt}{16pt}},   % Optional: Text font size
    textcolor={darkgrey},                   % Optional: Text color
    image={path/to/image.jpg},              % Optional: Preface image
    imageheight={0.5},                      % Optional: Image height (0.0-1.0)
    imagemargin={0cm},                      % Optional: Image margin
    opacity={1.0},                          % Optional: Image opacity (0.0-1.0)
    bgcolor={colorname},                    % Optional: Background color
    layout={single},                        % Optional: 'single' or 'double'
    pagecontent={...}                       % Optional: Custom content (overrides title/text)
}
```

### Layout Options

#### Single Page Layout

Single page with image at top and text below:

```latex
\makeprefacepage{
    title={Welcome},
    text={Welcome to this collection of cherished family recipes. Each dish tells a story of our family's culinary journey through three generations...},
    layout={single},
    image={images/book/preface.jpg},
    imageheight={0.4}
}
```

#### Double Page Layout

Two-page spread with image on left, text on right:

```latex
\makeprefacepage{
    title={About This Cookbook},
    text={This cookbook represents years of cooking, testing, and perfecting recipes that have become family favorites...},
    layout={double},
    image={images/book/family-photo.jpg}
}
```

### Preface Examples

#### Simple Text-Only Preface

```latex
\makeprefacepage{
    title={Preface},
    text={Cooking is more than following recipes—it's about creating memories, bringing people together, and sharing love through food. This collection represents the heart of our family's kitchen.},
    textcolor={darkgrey}
}
```

#### Preface with Image

```latex
\makeprefacepage{
    title={A Journey Through Flavors},
    text={Every recipe in this book has been carefully selected and tested. From my grandmother's secret pasta sauce to my mother's famous apple pie, these dishes have been perfected over decades of family gatherings.},
    image={images/book/kitchen.jpg},
    imageheight={0.5},
    opacity={0.9},
    layout={single}
}
```

#### Preface with Custom Background

```latex
\makeprefacepage{
    title={Introduction},
    text={Welcome to a world of delicious, wholesome cooking. These recipes emphasize fresh, seasonal ingredients and simple techniques that anyone can master.},
    bgcolor={paleorange},
    textcolor={white},
    titlefontsize={\fontsize{40pt}{44pt}},
    textfontsize={\fontsize{14pt}{18pt}}
}
```

#### Double-Page Preface

```latex
\makeprefacepage{
    title={Our Culinary Heritage},
    text={These recipes span three generations of home cooks, from traditional family dinners to modern interpretations. Each one carries memories of shared meals, celebrations, and the simple joy of good food.

    I hope this cookbook inspires you to create your own delicious memories, whether you're cooking for family, friends, or just yourself. Enjoy every bite!},
    layout={double},
    image={images/book/heritage.jpg},
    textfontsize={\fontsize{13pt}{17pt}}
}
```

### Using Custom Content

For complete control, use the `pagecontent` parameter with custom LaTeX:

```latex
\makeprefacepage{
    layout={single},
    pagecontent={
        {\fontsize{40pt}{44pt}\selectfont\textbf{About the Author}}

        \vspace{1cm}

        {\fontsize{12pt}{16pt}\selectfont
        Jane Smith has been passionate about cooking since childhood. With over 20 years of culinary experience, she combines traditional techniques with modern flavors.

        \vspace{0.5cm}

        This is her third cookbook, following the bestsellers "Quick Weeknight Dinners" and "Baking Made Simple."}
    }
}
```

## Complete Front Matter Example

```latex
\documentclass[letterpaper, 10pt, twoside, english]{CookBook}

\begin{document}

% Cover Page
\makecoverpage{
    title={My Family Cookbook},
    subtitle={Recipes from Three Generations},
    author={Jane Smith},
    image={images/book/cover.jpg},
    opacity={0.6},
    bgcolor={darkgrey},
    textcolor={white}
}

% Preface Page
\makeprefacepage{
    title={Preface},
    text={Welcome to this collection of cherished family recipes. Each dish tells a story and brings back memories of family gatherings, holiday celebrations, and everyday meals shared with loved ones.

    I hope these recipes bring as much joy to your table as they have to ours over the years. Happy cooking!},
    layout={single},
    image={images/book/preface.jpg},
    imageheight={0.4}
}

% Table of Contents
\maketoc

% Rest of cookbook...

\end{document}
```

---

## Related Documentation

- [Chapters and Navigation](chapters-and-navigation.md) - Chapter pages and table of contents
- [Back Cover and Index](back-cover-and-index.md) - Back matter pages
- [Colors](colors.md) - Color customization

[← Back to Documentation Index](README.md)
