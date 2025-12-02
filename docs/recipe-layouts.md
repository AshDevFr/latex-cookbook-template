# Recipe Layouts

The template offers flexible layout options for recipes, allowing you to choose between different visual styles based on your content and design preferences.

## Layout Types

### Columns Layout (Default)

The default layout with a two-column structure:

- **Left column:** Recipe tags and ingredients
- **Right column:** Instructions

```latex
\recipe{
    layout={columns},  % or omit (it's the default)
    title={My Recipe},
    ingredients={
        \ingredient{Ingredient 1}
        \ingredient{Ingredient 2}
    },
    instructions={
        \instruction{Step 1}
        \instruction{Step 2}
    }
}
```

**Best for:**
- Recipes with balanced ingredient and instruction content
- Traditional cookbook layouts
- Recipes where you want ingredients visible while following instructions

### Simple Layout

Alternative single-column layout:

- **Top section:** Two columns with recipe information/tags (left) and ingredients (right)
- **Bottom section:** Instructions in full width

```latex
\recipe{
    layout={simple},
    title={My Recipe},
    ingredients={
        \ingredient{Ingredient 1}
        \ingredient{Ingredient 2}
    },
    instructions={
        \instruction{Step 1}
        \instruction{Step 2}
    }
}
```

**Best for:**
- Recipes with lengthy instructions
- Recipes with short ingredient lists
- When you want more space for detailed step-by-step instructions

## Full Page vs. Compact

### Full Page Recipes

Control whether recipes take a full page or can flow naturally:

```latex
fullpage={true}  % Default
```

**Behavior:**
- Recipe displays images (if provided)
- Clears the page after completion (controlled by `clearpageafter`)
- Each recipe starts on a new page

**Example:**

```latex
\recipe{
    fullpage={true},  % or omit (it's the default)
    image={images/recipes/bolognese.jpg},
    title={Spaghetti Bolognese},
    % ... recipe content
}
```

### Compact Recipes

```latex
fullpage={false}
```

**Behavior:**
- Recipe does NOT display images
- Does NOT force a page break
- Allows compact recipes to appear on the same page or flow naturally
- `clearpageafter` is automatically set to `false` and cannot be overridden

**Example:**

```latex
\recipe{
    fullpage={false},
    title={Quick Scrambled Eggs},
    serves={2},
    preptime={5 mins},
    ingredients={
        \ingredient{eggs}[4][][]
        \ingredient{milk}[2][tbsp][]
    },
    instructions={
        \instruction{Beat eggs with milk.}
        \instruction{Cook in a pan until set.}
    }
}
```

**Note:** When `fullpage={false}`, recipe images are not displayed regardless of the `image` parameter. This allows you to create compact recipe collections where multiple short recipes can appear on the same page.

## Page Break Control

### Clear Page After

The `clearpageafter` option controls whether a page break is forced after the recipe:

```latex
clearpageafter={true}   % Default: Forces a page break after the recipe
clearpageafter={false}  % No page break after the recipe
```

**Important:** `clearpageafter` only takes effect when `fullpage={true}`. When `fullpage={false}`, `clearpageafter` is automatically set to `false` and cannot be overridden.

## Use Cases

### Full Page Recipe (Default)

Best for featured recipes with images that deserve their own page:

```latex
\recipe{
    fullpage={true},  % or omit (it's the default)
    clearpageafter={true},  % or omit (it's the default)
    image={images/recipes/bolognese.jpg},
    title={Spaghetti Bolognese},
    % ... recipe content
}
```

### Full Page Recipe Without Forced Break

For long recipes that span multiple pages, allowing you to add a compact recipe on the same page after the full-page recipe completes:

```latex
% Long recipe that spans multiple pages
\recipe{
    fullpage={true},
    clearpageafter={false},  % Allow content to flow after this recipe
    image={images/recipes/complex-recipe.jpg},
    title={Complex Multi-Page Recipe},
    % ... long recipe content that spans multiple pages
}

% This compact recipe can appear on the same page after the previous recipe
\recipe{
    fullpage={false},
    title={Quick Scrambled Eggs},
    % ... recipe content
}
```

### Compact Recipes on Same Page

Perfect for short recipes that can share a page:

```latex
% First compact recipe
\recipe{
    fullpage={false},
    title={Quick Scrambled Eggs},
    % ... short recipe content
}

% Second compact recipe on same page
\recipe{
    fullpage={false},
    title={Toast with Butter},
    % ... short recipe content
}

% Third compact recipe on same page
\recipe{
    fullpage={false},
    title={Morning Coffee},
    % ... short recipe content
}
```

## Column Customization

For the `columns` layout, you can customize the column appearance:

### Column Spacing

```latex
\recipe{
    layout={columns},
    columnsep={0.05\textwidth},  % Space between columns
    % ...
}
```

### Column Separator Line

```latex
\recipe{
    layout={columns},
    columnseprule={0.5pt},           % Separator line thickness
    columnseprulecolor={lightgrey},  % Separator line color
    % ...
}
```

### Column Width Ratio

```latex
\recipe{
    layout={columns},
    columnratio={0.3, 0.7},  % Left 30%, right 70% (default)
    % or
    columnratio={0.4, 0.6},  % Left 40%, right 60%
    % ...
}
```

## Complete Layout Examples

### Featured Full-Page Recipe

```latex
\recipe{
    layout={columns},
    fullpage={true},
    clearpageafter={true},
    image={images/recipes/featured-dish.jpg},
    imageheight={0.4\paperheight},
    title={Featured Recipe},
    description={A beautiful dish that deserves its own page.},
    serves={4},
    preptime={30 mins},
    cookingtime={1 hour},
    tags={Featured, Special},
    ingredients={
        \ingredient{Ingredient 1}
        \ingredient{Ingredient 2}
    },
    instructions={
        \instruction{Step 1}
        \instruction{Step 2}
    }
}
```

### Quick Reference Recipes

```latex
% Multiple compact recipes on same pages
\recipe{
    layout={simple},
    fullpage={false},
    title={Quick Breakfast 1},
    serves={1},
    ingredients={
        \ingredient{eggs}[2][][]
    },
    instructions={
        \instruction{Cook the eggs.}
    }
}

\recipe{
    layout={simple},
    fullpage={false},
    title={Quick Breakfast 2},
    serves={1},
    ingredients={
        \ingredient{bread}[2][slices][]
    },
    instructions={
        \instruction{Toast the bread.}
    }
}
```

### Mixed Layout Cookbook

```latex
% Chapter with featured recipe
\makechapterpage{title={Breakfast}}

% Full-page featured recipe with image
\recipe{
    layout={columns},
    fullpage={true},
    image={images/recipes/pancakes.jpg},
    title={Gourmet Pancakes},
    % ... full content
}

% Follow with compact variations
\recipe{
    layout={simple},
    fullpage={false},
    title={Blueberry Pancakes},
    % ... compact content
}

\recipe{
    layout={simple},
    fullpage={false},
    title={Chocolate Chip Pancakes},
    % ... compact content
}
```

---

## Related Documentation

- [Recipe Command](recipe-command.md) - Complete recipe parameters
- [Recipe Elements](recipe-elements.md) - Ingredients, instructions, and notes

[← Back to Documentation Index](README.md)
