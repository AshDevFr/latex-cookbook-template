# Full-Page Images

Add dramatic full-page recipe images to showcase your dishes.

## Image Page Command

The `\makeimagepage{}` command creates a full-page image with optional caption.

### Complete Parameters

```latex
\makeimagepage{
    image={path/to/image.jpg},            % Required: Image path
    caption={Image Caption},              % Optional: Image caption
    captionfontsize={\fontsize{18pt}{20pt}}, % Optional: Caption font size
    textcolor={white},                    % Optional: Caption text color
    shadowcolor={black},                   % Optional: Drop shadow color
    shadowoffset={0.05cm},                 % Optional: Drop shadow offset
    opacity={1.0},                        % Optional: Image opacity (0.0-1.0)
    bgcolor={colorname}                   % Optional: Background color
}
```

## Basic Examples

### Simple Image Page

```latex
\makeimagepage{
    image={images/recipes/banana-pancake.jpg}
}
```

### Image with Caption

```latex
\makeimagepage{
    image={images/recipes/banana-pancake.jpg},
    caption={Banana Pancakes}
}
```

### Image with Styled Caption

```latex
\makeimagepage{
    image={images/recipes/pasta-bolognese.jpg},
    caption={Spaghetti Bolognese},
    captionfontsize={\fontsize{24pt}{28pt}},
    textcolor={white},
    shadowcolor={black},
    shadowoffset={0.08cm}
}
```

## Advanced Examples

### Image with Custom Opacity

```latex
\makeimagepage{
    image={images/recipes/dessert.jpg},
    caption={Chocolate Cake},
    opacity={0.9},
    textcolor={white}
}
```

### Image with Background Color

```latex
\makeimagepage{
    image={images/recipes/salad.jpg},
    caption={Fresh Garden Salad},
    bgcolor={paleorange},
    textcolor={white}
}
```

### Dark Image with Light Caption

```latex
\makeimagepage{
    image={images/recipes/dark-dish.jpg},
    caption={Midnight Chocolate Torte},
    textcolor={white},
    shadowcolor={black},
    shadowoffset={0.1cm},
    captionfontsize={\fontsize{28pt}{32pt}}
}
```

### Light Image with Dark Caption

```latex
\makeimagepage{
    image={images/recipes/light-dish.jpg},
    caption={Lemon Meringue Pie},
    textcolor={black},
    shadowcolor={white},
    shadowoffset={0.05cm}
}
```

## Usage in Cookbook

### Before a Recipe

Create visual impact by showing the finished dish before the recipe:

```latex
% Chapter page
\makechapterpage{
    title={Breakfast}
}

% Full-page image of the dish
\makeimagepage{
    image={images/recipes/banana-pancakes-hero.jpg},
    caption={Banana Pancakes}
}

% Recipe details
\recipe{
    title={Banana Pancakes},
    serves={4},
    % ... rest of recipe
}
```

### Between Recipes

Use as visual breaks between recipes:

```latex
\recipe{
    title={First Recipe},
    % ... recipe content
}

% Visual break
\makeimagepage{
    image={images/food/ingredients.jpg},
    caption={Fresh Ingredients}
}

\recipe{
    title={Second Recipe},
    % ... recipe content
}
```

### Gallery Section

Create a photo gallery section:

```latex
\makechapterpage{
    title={Our Favorites}
}

\makeimagepage{
    image={images/gallery/dish1.jpg},
    caption={Classic Comfort Food}
}

\makeimagepage{
    image={images/gallery/dish2.jpg},
    caption={Summer Refreshment}
}

\makeimagepage{
    image={images/gallery/dish3.jpg},
    caption={Holiday Traditions}
}
```

## Image Specifications

### Supported Formats

- JPG/JPEG
- PNG
- PDF

### Recommended Specifications

- **Resolution**: 300 DPI for print, 150 DPI for digital
- **Dimensions**: Match your paper size or larger
  - Letter (8.5" × 11"): 2550 × 3300 pixels at 300 DPI
  - A4 (210mm × 297mm): 2480 × 3508 pixels at 300 DPI
- **Aspect Ratio**: Match your paper size for best results
- **Color Space**: RGB for digital, CMYK for professional printing

### Image Preparation Tips

1. **Crop Appropriately**: Ensure important elements are centered and won't be cut off
2. **Adjust Brightness**: Make sure captions will be readable (use light text on dark images, dark text on light images)
3. **Optimize File Size**: Compress images to reduce PDF file size without sacrificing quality
4. **Use Consistent Style**: Keep a consistent visual style across all images

## Complete Examples

### Minimal Setup

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

\begin{document}

\makechapterpage{title={Breakfast}}

\makeimagepage{
    image={images/recipes/pancakes.jpg}
}

\recipe{
    title={Pancakes},
    % ... recipe content
}

\end{document}
```

### Full Featured Setup

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

\begin{document}

% Chapter
\makechapterpage{
    title={Desserts},
    image={images/chapters/desserts.jpg},
    layout={right}
}

% Dramatic full-page image
\makeimagepage{
    image={images/recipes/chocolate-cake-hero.jpg},
    caption={Decadent Chocolate Cake},
    captionfontsize={\fontsize{32pt}{36pt}},
    textcolor={white},
    shadowcolor={black},
    shadowoffset={0.1cm},
    opacity={1.0}
}

% Recipe
\recipe{
    image={images/recipes/chocolate-cake.jpg},
    title={Chocolate Cake},
    description={Rich, moist chocolate cake with ganache frosting},
    serves={12},
    preptime={30 mins},
    cookingtime={35 mins},
    % ... rest of recipe
}

\end{document}
```

## Tips for Full-Page Images

1. **High Quality**: Use high-resolution images for the best print quality

2. **Caption Contrast**: Ensure captions are readable by choosing appropriate text and shadow colors

3. **Strategic Placement**: Use full-page images to:
   - Introduce featured recipes
   - Create visual breaks between chapters
   - Showcase your best photography
   - Build anticipation before a recipe

4. **Consistent Style**: Maintain consistent photography style (lighting, composition, backgrounds) across all full-page images

5. **Bleed Aware**: When using bleed settings, ensure important image elements aren't too close to trim edges

---

## Related Documentation

- [Recipe Command](recipe-command.md) - Recipe images
- [Chapters and Navigation](chapters-and-navigation.md) - Chapter organization
- [Document Class Options](document-class-options.md) - Bleed settings

[← Back to Documentation Index](README.md)
