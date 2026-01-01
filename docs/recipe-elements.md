# Recipe Elements

This guide covers the building blocks of recipes: ingredients, instructions, sections, and notes.

## Ingredients

The `\ingredient` command supports two syntax formats for maximum flexibility.

### Ingredient List Styles

The template supports three different styles for displaying ingredient lists:

1. **`list`** (default): Traditional bullet point list
2. **`compact`**: Simple list without bullets, with hanging indent
3. **`tabular`**: Two-column table format with quantities aligned

#### Setting the Global Ingredient Style

Set the default style for all recipes using a document class option:

```latex
\documentclass[ingredientstyle=tabular]{CookBook}
```

Or change it in the document preamble:

```latex
\setingredientstyle{compact}
```

#### Override Style Per Recipe

Override the ingredient style for individual recipes:

```latex
\recipe{
    ingredientstyle={tabular},
    ...
}
```

#### Tabular Style Configuration

When using the `tabular` style, you can customize the spacing and alignment:

```latex
% Set spacing between quantity and ingredient name columns (default: 10pt)
\setingredienttabspace{15pt}

% Set alignment for the quantity column: l (left), r (right), c (center)
% Default is 'r' (right-aligned quantities)
\setingredienttabalign{r}

% Set text justification for ingredient descriptions: true (justified), false (ragged-right)
% Default is 'false' (ragged-right, better for long words)
\setingredienttabjustify{false}
```

These can also be overridden per recipe:

```latex
\recipe{
    ingredientstyle={tabular},
    ingredienttabspace={20pt},
    ingredienttabalign={l},
    ingredienttabjustify={false},
    ...
}
```

#### List and Compact Style Configuration

For `list` and `compact` styles, you can adjust the left margin:

```latex
% Set left margin for ingredient list (default: 10pt)
\setingredientleftmargin{15pt}
```

Or override per recipe:

```latex
\recipe{
    ingredientstyle={list},
    ingredientleftmargin={20pt},
    ...
}
```

### Basic Format (Backward Compatible)

Simple single-argument format for quick ingredient entry:

```latex
\ingredient{200g flour}
\ingredient{2 eggs}
\ingredient{1 cup milk}
\ingredient{Salt and pepper to taste}
```

### Structured Format (Recommended)

Enhanced syntax with separate name, quantity, unit, and note parameters:

```latex
\ingredient{name}[quantity][unit][note]
```

**Parameters:**

- `name` (required): The ingredient name and any additional description
- `quantity` (optional): The amount or quantity (e.g., `2`, `1/2`, `1 1/4`)
- `unit` (optional): The unit of measurement (e.g., `cup`, `tbsp`, `tsp`, `g`, `kg`)
- `note` (optional): Additional notes or preparation instructions

### Structured Format Examples

```latex
% With name, quantity, and unit
\ingredient{bananas}[2][][medium-to-large ripe]
\ingredient{whole wheat flour}[1/2][cup][]
\ingredient{large eggs}[4][][]

% With name and quantity only
\ingredient{whole milk}[1][cup][]

% With name and quantity (no unit)
\ingredient{onions}[2][][finely chopped]

% With all parameters including note
\ingredient{bananas}[2][][medium-to-large ripe\note{The riper the bananas, the sweeter the pancakes will be.}]

% Name only (no quantity or unit)
\ingredient{Butter, avocado oil or ghee, for cooking}
\ingredient{Salt and pepper}[][][to taste]

% Empty brackets skip optional fields
\ingredient{eggs}[2][][]  % name=eggs, quantity=2, no unit
```

### Formatting Output

The structured format automatically formats ingredients as: `<quantity> <unit> <ingredient name>, <note>`

- Empty parameters are automatically skipped
- Spaces are automatically inserted between quantity, unit, and name
- Notes are separated with a comma when present
- The command maintains backward compatibility with the single-argument format

**Note:** The input syntax is `\ingredient{name}[quantity][unit][note]`, but the output is formatted as `<quantity> <unit> <ingredient name>, <note>` for readability.

## Ingredient Sections

Organize ingredients into sections for complex recipes:

```latex
ingredients={
    \ingredientsection{Sauce}
    \ingredient{olive oil}[1][tbsp][]
    \ingredient{onions, chopped}[2][][]

    \ingredientsection{Pasta}
    \ingredient{spaghetti}[375][g][]

    \ingredientsection{Serving}
    \ingredient{parmesan, grated}[80][g][]
}
```

**Example Output:**
```
Sauce
  1 tbsp olive oil
  2 onions, chopped

Pasta
  375 g spaghetti

Serving
  80 g parmesan, grated
```

## Instructions

Basic instruction steps are numbered automatically:

```latex
instructions={
    \instruction{Mix all ingredients together in a bowl.}
    \instruction{Heat oil in a pan over medium heat.}
    \instruction{Cook until golden brown, about 5 minutes.}
}
```

**Example Output:**
```
1. Mix all ingredients together in a bowl.
2. Heat oil in a pan over medium heat.
3. Cook until golden brown, about 5 minutes.
```

## Instruction Sections

Organize instructions into phases for complex recipes:

```latex
instructions={
    \instructionsection{Preparing the Sauce}
    \instruction{Heat oil in a pan over medium heat.}
    \instruction{Add ingredients and cook for 5 minutes.}

    \instructionsection{Cooking the Pasta}
    \instruction{Cook pasta in boiling salted water.}
    \instruction{Drain when al dente.}

    \instructionsection{Serving}
    \instruction{Combine pasta with sauce.}
    \instruction{Garnish and serve immediately.}
}
```

**Example Output:**
```
Preparing the Sauce
  1. Heat oil in a pan over medium heat.
  2. Add ingredients and cook for 5 minutes.

Cooking the Pasta
  3. Cook pasta in boiling salted water.
  4. Drain when al dente.

Serving
  5. Combine pasta with sauce.
  6. Garnish and serve immediately.
```

## Recipe Notes

Add contextual notes to ingredients and instructions using the `\note{...}` command. Notes are automatically numbered with superscript references and collected at the bottom of the recipe in a "Notes" section.

### Adding Notes to Ingredients

```latex
\ingredient{flour}[2][cups][\note{Use all-purpose flour for best results}]
\ingredient{butter, softened}[1/2][cup][\note{For the flakiest crust, make sure all ingredients are cold}]
```

### Adding Notes to Instructions

```latex
\instruction{Mix ingredients until just combined.\note{Be careful not to overmix, as this can make the dough tough.}}
\instruction{Bake for 25-30 minutes.\note{The cake is done when a toothpick inserted in the center comes out clean.}}
```

### How Notes Work

- Notes are automatically numbered sequentially (¹, ², ³, etc.) as they appear in the recipe
- Each note appears as a superscript number inline where it's placed
- All notes are collected and displayed at the bottom of the recipe in a numbered list
- Note numbering resets for each new recipe
- If a recipe has no notes, the Notes section is automatically hidden

### Complete Example with Notes

```latex
\recipe{
    title={Banana Pancakes},
    ingredients={
        \ingredient{ripe bananas}[2][][medium-to-large\note{The riper the bananas, the sweeter the pancakes will be.}]
        \ingredient{whole wheat flour}[1/2][cup][\note{For a gluten-free option, use buckwheat or oat flour.}]
        \ingredient{Butter, for cooking}[][][\note{Ghee provides a rich, buttery flavor without burning easily.}]
        \ingredient{eggs}[2][][]
    },
    instructions={
        \instruction{In a medium bowl, mash the bananas with a fork.}
        \instruction{Add eggs and whisk until well combined.}
        \instruction{Scoop ¼ cup batter onto the hot skillet.\note{Don't flip too early! Wait until bubbles form on the surface.}}
        \instruction{Flip and cook until golden.\note{If pancakes are browning too quickly, reduce the heat slightly.}}
    }
}
```

**Example Output:**
```
Ingredients:
  2 medium-to-large ripe bananas¹
  1/2 cup whole wheat flour²
  Butter, for cooking³
  2 eggs

Instructions:
  1. In a medium bowl, mash the bananas with a fork.
  2. Add eggs and whisk until well combined.
  3. Scoop ¼ cup batter onto the hot skillet.⁴
  4. Flip and cook until golden.⁵

Notes:
  ¹ The riper the bananas, the sweeter the pancakes will be.
  ² For a gluten-free option, use buckwheat or oat flour.
  ³ Ghee provides a rich, buttery flavor without burning easily.
  ⁴ Don't flip too early! Wait until bubbles form on the surface.
  ⁵ If pancakes are browning too quickly, reduce the heat slightly.
```

### Customizing the Notes Label

Override the "Notes" label for different languages or custom text:

```latex
\setTextNotes{Remarques}  % French: "Remarques"
\setTextNotes{Tips}       % Custom: "Tips"
```

See [Translation and Language Support](translation.md) for more translation options.

## Complete Recipe Example

```latex
\recipe{
    title={Spaghetti Bolognese},
    serves={4},
    preptime={25 mins},
    cookingtime={1 hour 15 mins},
    ingredients={
        \ingredientsection{Sauce}
        \ingredient{olive oil}[1][tbsp][]
        \ingredient{onions, finely chopped}[2][][]
        \ingredient{garlic, minced}[3][cloves][]
        \ingredient{beef mince}[500][g][]
        \ingredient{diced tomatoes}[2 x 400g][cans][]
        \ingredient{tomato paste}[2][tbsp][]
        \ingredient{dried oregano}[1][tbsp][]
        \ingredient{bay leaves}[2][][\note{Remove before serving}]
        \ingredient{Salt and pepper}[][][to taste]

        \ingredientsection{Serving}
        \ingredient{dried spaghetti}[375][g][]
        \ingredient{parmesan, grated}[80][g][]
        \ingredient{fresh basil}[][][for garnish]
    },
    instructions={
        \instructionsection{Preparing the Sauce}
        \instruction{Heat oil in a large saucepan over medium-high heat.}
        \instruction{Add onions and cook for 3 minutes until softened.\note{Don't let them brown.}}
        \instruction{Add garlic and cook for 1 minute until fragrant.}
        \instruction{Add mince and cook for 5-7 minutes, breaking up lumps with a wooden spoon.}
        \instruction{Stir in tomatoes, tomato paste, oregano, and bay leaves.}
        \instruction{Bring to boil, then reduce heat to low.}
        \instruction{Simmer uncovered for 1 hour, stirring occasionally.\note{The sauce should thicken and reduce by about one-third.}}
        \instruction{Season with salt and pepper to taste. Remove bay leaves.}

        \instructionsection{Cooking and Serving}
        \instruction{About 15 minutes before sauce is ready, cook spaghetti according to packet directions in salted boiling water.}
        \instruction{Drain pasta, reserving 1/2 cup pasta water.}
        \instruction{Add pasta to sauce with a splash of pasta water. Toss to combine.\note{The starchy pasta water helps the sauce cling to the pasta.}}
        \instruction{Divide among serving bowls.}
        \instruction{Top with grated parmesan and fresh basil. Serve immediately.}
    }
}
```

---

## Related Documentation

- [Recipe Command](recipe-command.md) - Complete recipe parameters
- [Recipe Layouts](recipe-layouts.md) - Layout options
- [Translation and Language Support](translation.md) - Customizing text labels

[← Back to Documentation Index](README.md)
