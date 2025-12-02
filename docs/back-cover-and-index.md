# Back Cover and Index

Complete your cookbook with a professional back cover and comprehensive index.

## Back Cover

The `\makebackcoverpage{}` command creates a professional back cover with multiple sections.

### Complete Parameters

```latex
\makebackcoverpage{
    topcontent={...},                    % Optional: Top section content
    image={path/to/image.jpg},           % Optional: Back cover image
    imageopacity={0.8},                  % Optional: Image opacity
    imageposition={right},               % Optional: 'left' or 'right'
    columnratio={0.6,0.4},               % Optional: Column ratio for top section
    verticalsplit={0.5},                 % Optional: Vertical split ratio (0.0-1.0)
    bottomcontent={...},                 % Optional: Bottom section content
    isbn={978-0-123456-78-9},            % Optional: ISBN number
    barcodeimage={path/to/barcode.jpg},  % Optional: Barcode image
    publisher={Publisher Name},          % Optional: Publisher information
    copyright={© 2025 All rights reserved.}, % Optional: Copyright notice
    textcolor={white},                   % Optional: Text color
    bgcolor={darkgrey},                  % Optional: Background color
    divider={true},                      % Optional: Show divider between sections
    barcodeplaceholder={true}           % Optional: Show barcode placeholder
}
```

### Layout Structure

The back cover has three main sections:

1. **Top section**: Two-column layout with text and image
2. **Bottom section**: Full-width content area
3. **Footer**: Publisher info (left) and ISBN/barcode (right)

## Basic Examples

### Minimal Back Cover

```latex
\makebackcoverpage{
    topcontent={About this cookbook...}
}
```

### Back Cover with Image

```latex
\makebackcoverpage{
    topcontent={This cookbook features over 100 family recipes collected over three generations. Each recipe has been tested and perfected to ensure delicious results every time.},
    image={images/book/back-cover.jpg},
    bgcolor={darkgrey},
    textcolor={white}
}
```

### Back Cover with ISBN

```latex
\makebackcoverpage{
    topcontent={About this cookbook...},
    isbn={978-0-123456-78-9},
    publisher={Published by Family Press},
    copyright={© 2025 All rights reserved.}
}
```

## Advanced Examples

### Full Featured Back Cover

```latex
\makebackcoverpage{
    topcontent={
        \textbf{Inside This Cookbook}

        \vspace{0.5cm}

        This comprehensive collection includes over 100 recipes spanning:

        \begin{itemize}
        \item Hearty breakfast dishes
        \item Light and satisfying lunches
        \item Impressive dinner entrees
        \item Decadent desserts
        \end{itemize}

        Each recipe includes detailed instructions, preparation times, and serving suggestions. Perfect for both beginner and experienced cooks.
    },
    image={images/book/back-cover.jpg},
    imageopacity={0.9},
    imageposition={right},
    bottomcontent={
        \textbf{About the Author}

        Jane Smith has been sharing her culinary passion for over 20 years. This is her third cookbook, following the bestsellers "Quick Weeknight Dinners" and "Baking Made Simple."
    },
    isbn={978-0-123456-78-9},
    publisher={Published by Culinary Press},
    copyright={© 2025 Jane Smith. All rights reserved.},
    bgcolor={darkgrey},
    textcolor={white}
}
```

### Back Cover with Reviews

```latex
\makebackcoverpage{
    topcontent={
        \textbf{Praise for My Family Cookbook}

        \vspace{0.5cm}

        "These recipes are absolutely delicious and easy to follow!"
        \textit{— Food Magazine}

        \vspace{0.3cm}

        "A must-have for every home cook."
        \textit{— Cooking Today}

        \vspace{0.3cm}

        "The perfect blend of tradition and innovation."
        \textit{— Recipe Review}
    },
    bottomcontent={
        Jane Smith brings you this collection of cherished family recipes, perfect for everyday meals and special occasions alike.
    },
    isbn={978-0-123456-78-9},
    bgcolor={paleorange},
    textcolor={white}
}
```

### Back Cover with Custom Layout

```latex
\makebackcoverpage{
    topcontent={
        \centering
        {\fontsize{24pt}{28pt}\selectfont\textbf{100+ Family Recipes}}

        \vspace{1cm}

        A celebration of home cooking, featuring recipes passed down through three generations.
    },
    image={images/book/family-cooking.jpg},
    imageopacity={0.8},
    columnratio={0.5,0.5},  % Equal columns
    verticalsplit={0.6},     % Top section takes 60% of page
    bottomcontent={
        \textbf{Perfect for:}
        \begin{itemize}
        \item Family dinners
        \item Holiday gatherings
        \item Weekend cooking projects
        \item Gifting to loved ones
        \end{itemize}
    },
    publisher={Self-Published},
    copyright={© 2025},
    bgcolor={darkgrey},
    textcolor={white}
}
```

## Index

The `\printindex` command generates an index of recipes and ingredients.

### Basic Usage

```latex
\printindex
```

This command:
- Automatically generates an index from all recipe `indexes` parameters
- Formats as a multi-column layout
- Includes page numbers
- Uses translated "Index" title based on language setting

### Adding Recipes to Index

In your recipes, use the `indexes` parameter:

```latex
\recipe{
    title={Spaghetti Bolognese},
    indexes={Spaghetti Bolognese, Recipes!Pasta, Italian cuisine},
    % ... rest of recipe
}
```

### Hierarchical Index Entries

Use `!` for hierarchical entries:

```latex
indexes={
    Spaghetti Bolognese,
    Recipes!Pasta,           % "Pasta" under "Recipes"
    Recipes!Italian,         % "Italian" under "Recipes"
    Cuisine!Italian,         % "Italian" under "Cuisine"
    Ingredients!Tomatoes     % "Tomatoes" under "Ingredients"
}
```

## Complete Back Matter Example

```latex
\documentclass[letterpaper, 10pt, twoside, english]{CookBook}

\begin{document}

% Front matter
\makecoverpage{
    title={My Family Cookbook},
    author={Jane Smith}
}

\maketoc

% Chapters and recipes with index entries
\makechapterpage{title={Breakfast}}

\recipe{
    title={Banana Pancakes},
    indexes={Banana Pancakes, Recipes!Breakfast, Pancakes},
    % ... recipe content
}

\recipe{
    title={Scrambled Eggs},
    indexes={Scrambled Eggs, Recipes!Breakfast, Eggs},
    % ... recipe content
}

% More chapters and recipes...

% Back matter
\makeconversionpage{}

\printindex

\makebackcoverpage{
    topcontent={
        This cookbook brings together our family's favorite recipes, collected and refined over three generations. Each dish tells a story and brings back memories of shared meals and celebrations.
    },
    image={images/book/back-cover.jpg},
    bottomcontent={
        Whether you're a beginner or an experienced cook, you'll find recipes that inspire and delight. Happy cooking!
    },
    isbn={978-0-123456-78-9},
    publisher={Published by Family Press},
    copyright={© 2025 Jane Smith. All rights reserved.},
    bgcolor={darkgrey},
    textcolor={white}
}

\end{document}
```

## Customizing Index Title

Override the default index title:

```latex
% English with custom title
\setTextIndex{Recipe Index}

\printindex
```

```latex
% French with custom title
\documentclass[french]{CookBook}
\setTextIndex{Index des Recettes}

\begin{document}
% ...
\printindex
\end{document}
```

See [Translation and Language Support](translation.md) for more details.

## Tips for Back Cover and Index

### Back Cover Tips

1. **Concise Content**: Keep back cover text brief and compelling
2. **ISBN**: Include ISBN if publishing professionally
3. **Reviews/Testimonials**: Add praise quotes for credibility
4. **Author Bio**: Brief author information adds personal touch
5. **Color Scheme**: Match front cover for cohesive design

### Index Tips

1. **Comprehensive**: Index all recipes with multiple relevant entries
2. **Hierarchical**: Use hierarchical entries for better organization
3. **Consistent**: Use consistent naming conventions
4. **Cross-References**: Include multiple ways to find recipes (by name, type, ingredient, cuisine)
5. **Review**: Check the generated index and add missing entries

### Index Entry Examples

```latex
% Multiple entry points for same recipe
indexes={
    Spaghetti Bolognese,      % By recipe name
    Recipes!Pasta,            % By category
    Recipes!Italian,          % By cuisine
    Beef!Ground beef,         % By main ingredient
    Main Courses!Pasta        % By course and type
}
```

---

## Related Documentation

- [Conversion Tables](conversion-tables.md) - Measurement conversions
- [Cover and Preface](cover-and-preface.md) - Front matter pages
- [Translation and Language Support](translation.md) - Customizing text labels

[← Back to Documentation Index](README.md)
