# Recipe Command

The `\recipe{}` command is the heart of the template, supporting extensive customization for creating beautiful recipe pages.

## Complete Recipe Parameters

```latex
\recipe{
    % Layout
    layout={columns},                   % 'columns' or 'simple' (default: columns)
    fullpage={true},                    % 'true' or 'false' (default: true)
    clearpageafter={true},              % 'true' or 'false' (default: true, only effective when fullpage=true)

    % Image
    image={path/to/image.jpg},          % Recipe header image
    imageopacity={1.0},                 % Image opacity (0.0-1.0)
    imageheight={0.3\paperheight},      % Image height
    imageoverlayspace={0.25\paperheight}, % Space after image
    imageposition={top},                 % 'top' or 'bottom'

    % Recipe Information
    title={Recipe Title},               % Required: Recipe title
    description={Short description},    % Optional: Recipe description
    serves={4},                         % Optional: Number of servings
    preptime={15 mins},                 % Optional: Preparation time
    cookingtime={30 mins},              % Optional: Cooking time
    difficulty={Beginner},              % Optional: Difficulty level
    origin={Country},                   % Optional: Origin of recipe

    % Tagging and Indexing
    tags={Tag1, Tag2, Tag3},            % Optional: Tags (comma-separated)
    equipment={Item1, Item2},           % Optional: Equipment (comma-separated)
    indexes={Entry 1, Entry 2},         % Optional: Index entries (comma-separated)

    % Extra Information
    extrainstructioninfo={Tips},        % Optional: Additional notes

    % Column Customization (columns layout only)
    columnsep={0.05\textwidth},         % Optional: Column spacing
    columnseprule={0.5pt},              % Optional: Column separator thickness
    columnseprulecolor={lightgrey},     % Optional: Column separator color
    columnratio={0.3, 0.7},             % Optional: Column width ratio (left, right)

    % Per-Recipe Spacing
    ingredientitemsep={0.005\textheight}, % Optional: Ingredient spacing
    instructionitemsep={0.005\textheight}, % Optional: Instruction spacing

    % Ingredient Style
    ingredientstyle={list},             % Optional: 'list' (default), 'compact', or 'tabular'
    ingredienttabspace={10pt},          % Optional: Space between columns in tabular mode
    ingredienttabalign={r},             % Optional: Alignment for tabular left column ('l', 'r', 'c')
    ingredienttabjustify={false},       % Optional: Text justification for tabular descriptions (true/false)
    ingredientleftmargin={10pt},        % Optional: Left margin for list/compact styles

    % Content (Required)
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

## Layout Parameters

### Layout Type

```latex
layout={columns}  % Two-column layout (default)
layout={simple}   % Single-column layout
```

See [Recipe Layouts](recipe-layouts.md) for detailed layout information.

### Full Page Control

```latex
fullpage={true}   % Display images and force page breaks (default)
fullpage={false}  % Compact mode, no images, natural flow
```

### Clear Page After

```latex
clearpageafter={true}   % Force page break after recipe (default)
clearpageafter={false}  % Allow content to flow naturally
```

**Note:** `clearpageafter` only takes effect when `fullpage={true}`.

## Image Parameters

### Image Path

```latex
image={images/recipes/my-recipe.jpg}
```

Supports JPG, PNG, and PDF formats.

### Image Opacity

```latex
imageopacity={1.0}  % Fully opaque (default)
imageopacity={0.8}  % Slightly transparent
imageopacity={0.5}  % Semi-transparent
```

Range: `0.0` (fully transparent) to `1.0` (fully opaque)

### Image Height

```latex
imageheight={0.3\paperheight}  % 30% of page height (default)
imageheight={5cm}              % Fixed height
imageheight={200pt}            % Fixed height in points
```

### Image Overlay Space

Space reserved after the image for content overlay:

```latex
imageoverlayspace={0.25\paperheight}  % Default
imageoverlayspace={3cm}
```

### Image Position

```latex
imageposition={top}     % Image at top (default)
imageposition={bottom}  % Image at bottom
```

## Recipe Information

### Required: Title

```latex
title={Spaghetti Bolognese}
```

### Optional: Description

```latex
description={Classic Italian meat sauce with rich tomato flavor.}
```

### Optional: Serving Information

```latex
serves={4}              % Number of servings
preptime={15 mins}      % Preparation time
cookingtime={30 mins}   % Cooking time
```

### Optional: Additional Details

```latex
difficulty={Beginner}   % Difficulty level (e.g., Beginner, Intermediate, Advanced)
origin={Italy}          % Country or region of origin
```

## Tags and Indexing

### Tags

Comma-separated list of tags:

```latex
tags={Breakfast, Sweet, Quick, Vegetarian, Spicy}
```

Tags are displayed as styled badges. Some tags automatically display icons when they have a registered tag-to-icon mapping:

- `Vegetarian` → 🌱
- `Spicy` → 🌶️
- `Vegan` → V
- `Gluten-free` → GF
- `Dairy-free` → DF

You can register custom tag icons using `\registerTagIcon{TagName}{type}{content}`:

```latex
% Register an emoji icon
\registerTagIcon{Spicy}{emoji}{hot-pepper}

% Register a text icon
\registerTagIcon{Gluten-free}{text}{GF}
```

Icons appear in the recipe header (next to the origin), while tag badges appear in the tag list.

### Equipment

Comma-separated list of specialized equipment needed for the recipe:

```latex
equipment={9-inch round cake pans, Electric mixer, Wire rack}
```

Equipment items are displayed as badges below the tags list. Only include specialized or non-standard equipment - common items like mixing bowls, spoons, or pots should generally be omitted unless they're specifically important to the recipe.

Examples of equipment to include:
- Specific pan sizes (9x13 inch baking dish, 9-inch springform pan)
- Specialized tools (Stand mixer, Food processor, Mandoline)
- Equipment that affects the recipe outcome (Wire rack, Double boiler, Cast iron skillet)

#### Customizing Tag Icon Appearance

You can customize the visual appearance of tag icons using these length and size variables:

```latex
% Spacing between icons (default: 5pt)
\setlength{\tagiconspacing}{6pt}

% Icon font size (default: 16pt)
\setlength{\tagiconsize}{18pt}

% Icon line height (default: 20pt)
\setlength{\tagiconlineheight}{22pt}
```

These settings affect all tag icons globally and should be placed in your document preamble

### Index Entries

Comma-separated list of index entries:

```latex
indexes={Spaghetti Bolognese, Recipes!Pasta, Italian cuisine}
```

Use `!` for hierarchical entries:
- `Recipes!Breakfast` → "Breakfast" under "Recipes"
- `Cuisine!Italian` → "Italian" under "Cuisine"

## Column Customization

These parameters only apply to the `columns` layout:

### Column Spacing

```latex
columnsep={0.05\textwidth}  % Space between columns (default)
columnsep={1cm}             % Fixed spacing
```

### Column Separator

```latex
columnseprule={0.5pt}              % Separator line thickness
columnseprulecolor={lightgrey}     % Separator line color
```

### Column Ratio

```latex
columnratio={0.3, 0.7}  % Left column 30%, right column 70% (default)
columnratio={0.4, 0.6}  % Left column 40%, right column 60%
```

## Per-Recipe Spacing

Override global spacing settings for individual recipes:

### Ingredient Spacing

```latex
ingredientitemsep={0.005\textheight}  % Vertical space between ingredients
ingredientitemsep={2pt}               % Fixed spacing
```

### Instruction Spacing

```latex
instructionitemsep={0.005\textheight}  % Vertical space between instructions
instructionitemsep={4pt}               % Fixed spacing
```

## Ingredient Style

Override the ingredient list style for individual recipes:

### Ingredient Style Selection

```latex
ingredientstyle={list}     % Bullet point list (default)
ingredientstyle={compact}  % Simple list without bullets
ingredientstyle={tabular}  % Two-column table format
```

### Tabular Style Options

When using `ingredientstyle={tabular}`, customize the column spacing, alignment, and text justification:

```latex
ingredienttabspace={10pt}  % Space between quantity and name columns (default)
ingredienttabspace={15pt}  % Wider spacing

ingredienttabalign={r}     % Right-align quantities (default)
ingredienttabalign={l}     % Left-align quantities
ingredienttabalign={c}     % Center-align quantities

ingredienttabjustify={false}  % Ragged-right text for descriptions (default, better for long words)
ingredienttabjustify={true}   % Justified text for descriptions (may cause awkward spacing)
```

### List/Compact Style Options

When using `ingredientstyle={list}` or `ingredientstyle={compact}`:

```latex
ingredientleftmargin={10pt}  % Left margin (default)
ingredientleftmargin={15pt}  % Wider margin
```

For more details on ingredient styles and global configuration, see [Recipe Elements](recipe-elements.md#ingredient-list-styles).

## Extra Information

Add additional tips or information displayed with instructions:

```latex
extrainstructioninfo={This sauce freezes well for up to 2 months.}
```

## Minimal Recipe Example

```latex
\recipe{
    title={Quick Scrambled Eggs},
    serves={2},
    ingredients={
        \ingredient{4 eggs}
        \ingredient{2 tbsp milk}
        \ingredient{Salt and pepper}
    },
    instructions={
        \instruction{Beat eggs with milk, salt, and pepper.}
        \instruction{Cook in a pan over medium heat until set.}
    }
}
```

## Complete Recipe Example

```latex
\recipe{
    layout={columns},
    fullpage={true},
    image={images/recipes/bolognese.jpg},
    imageheight={0.4\paperheight},
    imageopacity={1.0},
    title={Spaghetti Bolognese},
    description={Classic Italian meat sauce with rich tomato flavor.},
    serves={4},
    preptime={25 mins},
    cookingtime={1 hour 15 mins},
    difficulty={Intermediate},
    origin={Italy},
    tags={Pasta, Meat, Italian},
    equipment={Large saucepan, Wooden spoon},
    indexes={Spaghetti Bolognese, Recipes!Pasta, Italian cuisine},
    extrainstructioninfo={This sauce freezes well for up to 2 months.},
    columnsep={0.05\textwidth},
    columnratio={0.3, 0.7},
    ingredientitemsep={0.005\textheight},
    instructionitemsep={0.5\baselineskip},
    ingredients={
        \ingredientsection{Sauce}
        \ingredient{olive oil}[1][tbsp][]
        \ingredient{onions, finely chopped}[2][][]
        \ingredient{beef mince}[500][g][]
        \ingredient{diced tomatoes}[2 x 400g][cans][]
        \ingredient{dried oregano}[1][tbsp][]

        \ingredientsection{Serving}
        \ingredient{dried spaghetti}[375][g][]
        \ingredient{parmesan, grated}[80][g][]
    },
    instructions={
        \instructionsection{Preparing the Sauce}
        \instruction{Heat oil in a large saucepan over medium-high heat.}
        \instruction{Add onions and cook for 3 minutes until softened.}
        \instruction{Add mince and cook for 5 minutes, breaking up lumps.}
        \instruction{Add tomatoes and oregano. Bring to boil.}
        \instruction{Reduce heat and simmer for 1 hour until thickened.}

        \instructionsection{Cooking and Serving}
        \instruction{Cook spaghetti according to packet directions.}
        \instruction{Divide spaghetti among bowls and top with sauce.}
        \instruction{Grate parmesan over the top and serve.}
    }
}
```

---

## Related Documentation

- [Recipe Layouts](recipe-layouts.md) - Layout options and configurations
- [Recipe Elements](recipe-elements.md) - Ingredients, instructions, and notes
- [Margins and Spacing](margins-and-spacing.md) - Global spacing controls

[← Back to Documentation Index](README.md)
