# Chapters and Navigation

Organize your cookbook with chapter dividers and a table of contents.

## Table of Contents

Generate a table of contents that automatically includes all chapters:

```latex
\maketoc
```

This command:
- Automatically includes all chapters with proper formatting
- Shows page numbers for each chapter
- Uses translated "Recipes" title based on language setting
- Formats as a clean, readable list

### Example

```latex
\documentclass[letterpaper, 10pt, twoside, english]{CookBook}

\begin{document}

\makecoverpage{
    title={My Cookbook}
}

% Table of contents
\maketoc

% Chapters and recipes follow...
\makechapterpage{title={Breakfast}}
% ... recipes ...

\makechapterpage{title={Lunch}}
% ... recipes ...

\end{document}
```

## Chapter Pages

Create chapter divider pages with the `\makechapterpage{}` command.

### Complete Parameters

```latex
\makechapterpage{
    title={Chapter Title},                 % Required: Chapter title
    subtitle={Optional Subtitle},          % Optional: Chapter subtitle
    image={path/to/image.jpg},             % Optional: Chapter image
    opacity={0.8},                         % Optional: Image opacity (0.0-1.0)
    bgcolor={colorname},                   % Optional: Background color
    textcolor={colorname},                 % Optional: Text color (default: darkgrey)
    layout={right},                        % Optional: 'right', 'left', or 'double'
    pagecontent={...}                      % Optional: Custom content (for double layout)
}
```

### Layout Options

#### Right Page Layout (Default)

Forces the chapter to start on the right (odd) page:

```latex
\makechapterpage{
    title={Breakfast},
    layout={right}
}
```

This is the default and recommended layout for two-sided books.

#### Left Page Layout

Forces the chapter to start on the left (even) page:

```latex
\makechapterpage{
    title={Breakfast},
    layout={left}
}
```

#### Double Page Layout

Creates a two-page spread with custom content on the left and the title on the right:

```latex
\makechapterpage{
    title={Breakfast},
    layout={double},
    pagecontent={
        % Custom content for left page
        {\fontsize{24pt}{28pt}\selectfont Start your day right}
        \vspace{1cm}
        A collection of energizing breakfast recipes
    }
}
```

## Chapter Examples

### Simple Chapter

```latex
\makechapterpage{
    title={Breakfast}
}
```

### Chapter with Background Color

```latex
\makechapterpage{
    title={Breakfast},
    bgcolor={paleorange},
    textcolor={white}
}
```

### Chapter with Image

```latex
\makechapterpage{
    title={Breakfast},
    image={images/chapters/breakfast.jpg},
    opacity={0.7}
}
```

### Chapter with Subtitle

```latex
\makechapterpage{
    title={Breakfast},
    subtitle={Start Your Day Right},
    image={images/chapters/breakfast.jpg},
    bgcolor={paleorange}
}
```

### Chapter with Image and Color

```latex
\makechapterpage{
    title={Dinner},
    subtitle={Hearty Evening Meals},
    image={images/chapters/dinner.jpg},
    opacity={0.8},
    textcolor={white}
}
```

### Double-Page Chapter Spread

```latex
\makechapterpage{
    title={Breakfast},
    layout={double},
    pagecontent={
        \centering
        {\fontsize{28pt}{32pt}\selectfont\textbf{Good Morning}}

        \vspace{2cm}

        \includegraphics[width=0.8\textwidth]{images/chapters/morning-coffee.jpg}

        \vspace{1cm}

        {\fontsize{14pt}{18pt}\selectfont
        Energizing recipes to start your day}
    },
    image={images/chapters/breakfast-spread.jpg}
}
```

## Complete Cookbook Structure

```latex
\documentclass[letterpaper, 10pt, twoside, english]{CookBook}

\begin{document}

% Front Matter
\makecoverpage{
    title={My Family Cookbook},
    author={Your Name}
}

\makeprefacepage{
    title={Preface},
    text={Welcome to our family recipes...}
}

% Table of Contents
\maketoc

% Breakfast Chapter
\makechapterpage{
    title={Breakfast},
    subtitle={Morning Favorites},
    image={images/chapters/breakfast.jpg},
    opacity={0.7},
    layout={right},
    bgcolor={paleorange}
}

\recipe{
    title={Banana Pancakes},
    % ... recipe content
}

\recipe{
    title={Scrambled Eggs},
    % ... recipe content
}

% Lunch Chapter
\makechapterpage{
    title={Lunch},
    subtitle={Midday Meals},
    image={images/chapters/lunch.jpg},
    layout={right}
}

\recipe{
    title={Caesar Salad},
    % ... recipe content
}

% Dinner Chapter
\makechapterpage{
    title={Dinner},
    subtitle={Evening Entrees},
    image={images/chapters/dinner.jpg},
    opacity={0.8},
    layout={right},
    bgcolor={darkgrey},
    textcolor={white}
}

\recipe{
    title={Spaghetti Bolognese},
    % ... recipe content
}

% Desserts Chapter
\makechapterpage{
    title={Desserts},
    subtitle={Sweet Endings},
    image={images/chapters/desserts.jpg},
    layout={right}
}

\recipe{
    title={Chocolate Cake},
    % ... recipe content
}

% Back Matter
\makeconversionpage{}
\printindex

\end{document}
```

## Organizing Chapters

### By Meal Type

```latex
\makechapterpage{title={Breakfast}}
\makechapterpage{title={Lunch}}
\makechapterpage{title={Dinner}}
\makechapterpage{title={Desserts}}
\makechapterpage{title={Beverages}}
```

### By Cuisine

```latex
\makechapterpage{title={Italian}}
\makechapterpage{title={Mexican}}
\makechapterpage{title={Asian}}
\makechapterpage{title={French}}
```

### By Course

```latex
\makechapterpage{title={Appetizers}}
\makechapterpage{title={Soups \& Salads}}
\makechapterpage{title={Main Courses}}
\makechapterpage{title={Side Dishes}}
\makechapterpage{title={Desserts}}
```

### By Season

```latex
\makechapterpage{title={Spring Recipes}}
\makechapterpage{title={Summer Recipes}}
\makechapterpage{title={Autumn Recipes}}
\makechapterpage{title={Winter Recipes}}
```

## Tips for Chapter Organization

1. **Consistent Styling**: Use the same color scheme or image style across all chapters for a cohesive look.

2. **Right-Side Chapters**: For two-sided books, use `layout={right}` (default) so chapters always start on the right page.

3. **Chapter Images**: Choose images that represent the chapter theme and use consistent opacity across chapters.

4. **Color Coding**: Use different background colors for each chapter to help readers navigate quickly:
   ```latex
   \makechapterpage{title={Breakfast}, bgcolor={paleorange}}
   \makechapterpage{title={Lunch}, bgcolor={darkgrey}}
   \makechapterpage{title={Dinner}, bgcolor={lightgrey}}
   ```

5. **Subtitles**: Add descriptive subtitles to give readers a preview of the chapter's content.

---

## Related Documentation

- [Cover and Preface](cover-and-preface.md) - Front matter pages
- [Full-Page Images](full-page-images.md) - Dramatic chapter imagery
- [Colors](colors.md) - Color customization

[← Back to Documentation Index](README.md)
