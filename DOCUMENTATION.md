# LaTeX Cookbook Template - Documentation

Complete documentation for the LaTeX Cookbook Template.

## Table of Contents

- [Document Class Options](#document-class-options)
- [Language Support](#language-support)
- [Page Components](#page-components)
  - [Cover Page](#cover-page)
  - [Preface Page](#preface-page)
  - [Table of Contents](#table-of-contents)
  - [Chapter Pages](#chapter-pages)
  - [Full-Page Images](#full-page-images)
  - [Conversion Tables](#conversion-tables)
  - [Back Cover](#back-cover)
  - [Index](#index)
- [Recipe Command](#recipe-command)
  - [Recipe Parameters](#recipe-parameters)
  - [Recipe Layouts](#recipe-layouts)
  - [Recipe Elements](#recipe-elements)
- [Customization](#customization)
  - [Colors](#colors)
  - [Margins](#margins)
  - [Spacing](#spacing)
  - [Fonts](#fonts)
- [Complete Examples](#complete-examples)
- [Build System](#build-system)
- [Troubleshooting](#troubleshooting)

---

## Document Class Options

The `CookBook` class extends `extbook` and accepts various options:

```latex
\documentclass[
    letterpaper,  % Paper size: 'letterpaper' or 'a4paper'
    10pt,         % Font size: 8pt, 9pt, 10pt, 11pt, 12pt, 14pt, 17pt, 20pt
    twoside,      % Two-sided printing (affects margins and page numbering)
    english,      % Language: 'english' or 'french' (default: english)
    left=even,    % Left pages: 'even' or 'odd' (default: even)
    startpage=1,  % Starting page number: 1 or 2 (default: 1)
    bleed,        % Enable bleed margins for print production (default: disabled)
]{CookBook}
```

### Paper Size Options

- `letterpaper` - US Letter (8.5" × 11")
- `a4paper` - A4 (210mm × 297mm)

### Font Size Options

Available sizes: `8pt`, `9pt`, `10pt`, `11pt`, `12pt`, `14pt`, `17pt`, `20pt`

### Page Layout Options

- `twoside` - Enables two-sided printing (mirrored margins)
- `left=even` - Left pages are even-numbered (default for two-sided)
- `left=odd` - Left pages are odd-numbered
- `startpage=1` - Start page numbering from 1 (default)
- `startpage=2` - Start page numbering from 2

### Language Options

- `english` - English language (default)
- `french` - French language

All text labels (Serves, Prep, Cooking, etc.) are automatically translated based on the language setting.

### Bleed Options

Bleed margins are required for professional print production (e.g., Lulu, Blurb, etc.) to ensure images and backgrounds extend to the page edges after trimming.

- `bleed` - Enable bleed margins (boolean option, default: disabled)
  - When enabled, uses default bleed value of 0.125 inches (3.175 mm) on all sides (Lulu standard)
- `bleed=debug` - Enable bleed margins and draw the bleed area boundaries for visualization
  - Draws a red dashed line at the trim edge (where the page will be cut)
  - Draws a blue solid line at the bleed edge (outer boundary of the bleed area)
  - Useful for verifying that content extends into the bleed area correctly

**Setting Custom Bleed Values:**

You can override the default bleed value using the `\setbleedvalue` command:

```latex
\documentclass[letterpaper, 10pt, twoside, bleed]{CookBook}
\setbleedvalue{0.125in}  % Override bleed value (default is already 0.125in)
% or
\setbleedvalue{3.175mm}  % Metric equivalent
```

**Enabling Bleed After Document Class:**

You can also enable bleed after the document class declaration:

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}
\enablebleed          % Enable with default 0.125in bleed
% or
\enablebleed{0.125in} % Enable with custom bleed value
```

**Gutter Margins for Print Binding:**

For print production, you may need to adjust inner margins (gutter) to prevent content from being lost in the binding. The gutter margin adds extra space to the inner (left) margin.

```latex
\documentclass[letterpaper, 10pt, twoside, bleed]{CookBook}
\setguttermargin{0.5in}  % Add 0.5 inches to inner margin for binding
% or
\setguttermargin{1.25cm} % Metric equivalent
```

**Bleed Image Ratio:**

Control how much of images should extend into the bleed area. This is useful for fine-tuning how images are positioned relative to the trim edge.

```latex
\documentclass[letterpaper, 10pt, twoside, bleed]{CookBook}
\setbleedimageratio{0.5}  % Default: 50% of images in bleed area
\setbleedimageratio{0.3}  % 30% of images in bleed area (more conservative)
\setbleedimageratio{1.0}  % 100% of images in bleed area (full bleed)
\setbleedimageratio{0.0}  % No images in bleed area
```

- **Default:** `0.5` (50% of images extend into bleed)
- **Range:** `0.0` to `1.0`
  - `0.0` = No image content in bleed area
  - `0.5` = Half of image extends into bleed (default)
  - `1.0` = Full image extends into bleed area

**Complete Example:**

```latex
\documentclass[
    letterpaper,
    10pt,
    twoside,
    bleed,  % Enable bleed for print production
]{CookBook}

% Optionally override default bleed value
\setbleedvalue{0.125in}

% Set gutter margin for binding
\setguttermargin{0.5in}

% Control how much of images extend into bleed area
\setbleedimageratio{0.3}

\begin{document}
% ... your content ...
\end{document}
```

**Important Notes:**

- When bleed is enabled, the PDF paper size is automatically increased by 2×bleed (bleed on each side)
- All edge-extending content (cover images, full-page images, etc.) automatically extends into the bleed area
- Text content maintains safety margins (0.5" minimum from trim edge) to prevent cutting

---

## Language Support

The template uses the `babel` package for comprehensive multi-language support, providing proper hyphenation, typography rules, and translations.

### Available Languages

```latex
% English (default)
\documentclass[english]{CookBook}

% French
\documentclass[french]{CookBook}
```

### Translated Elements

The following elements are automatically translated:

| Element             | English           | French               |
| ------------------- | ----------------- | -------------------- |
| Recipes (TOC title) | Recipes           | Recettes             |
| Serves              | Serves            | Portions             |
| Prep                | Prep              | Préparation          |
| Cooking             | Cooking           | Cuisson              |
| Difficulty          | Difficulty        | Difficulté           |
| Origin              | Origin            | Origine              |
| Spicy               | Spicy             | Épicé                |
| Vegetarian          | Vegetarian        | Végétarien           |
| Notes               | Notes             | Notes                |
| Index               | Index             | Index                |
| Conversion Table    | Conversion Table  | Table de Conversion  |
| Volume              | Volume            | Volume               |
| Weight              | Weight            | Poids                |
| Temperature         | Temperature       | Température          |
| Length              | Length            | Longueur             |
| Oven Temperatures   | Oven Temperatures | Températures du Four |

### Custom Text Override

Override any translation after loading the class:

```latex
\documentclass[french]{CookBook}

\setTextRecipes{Mes Recettes}
\setTextServes{Pour}
\setTextPrep{Temps de préparation}
\setTextCooking{Temps de cuisson}
\setTextDifficulty{Niveau}
\setTextOrigin{Provenance}
\setTextSpicy{Piquant}
\setTextVegetarian{Végétarien}
\setTextNotes{Remarques}
\setTextIndex{Index des Recettes}
\setTextConversionTable{Tableau de Conversion}
% ... and more
```

---

## Page Components

### Cover Page

Create a professional cover page with customizable styling:

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

**Example:**

```latex
\makecoverpage{
    title={My Cookbook},
    subtitle={Recipes from Three Generations},
    author={Your Name},
    image={images/book/cover.jpg},
    opacity={0.6},
    bgcolor={darkgrey},
    textcolor={white}
}
```

---

### Preface Page

Create a preface or introduction page:

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

**Layout Options:**

- `single` - Single page with image at top and text below
- `double` - Two-page spread with image on left, text on right

**Example:**

```latex
\makeprefacepage{
    title={Preface},
    text={Welcome to this collection of recipes...},
    layout={single},
    image={images/book/preface.jpg}
}
```

---

### Table of Contents

Generate a table of contents:

```latex
\maketoc
```

This automatically includes all chapters and properly formats page numbers.

---

### Chapter Pages

Create chapter divider pages:

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

**Layout Options:**

- `right` - Force chapter to start on right (odd) page
- `left` - Force chapter to start on left (even) page
- `double` - Two-page spread (left page uses `pagecontent`, right shows title)

**Example:**

```latex
\makechapterpage{
    title={Breakfast},
    image={images/book/breakfast.jpg},
    layout={right},
    bgcolor={paleorange}
}
```

---

### Full-Page Images

Add dramatic full-page recipe images:

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

**Example:**

```latex
\makeimagepage{
    image={images/recipes/banana-pancake.jpg},
    caption={Banana Pancakes},
    textcolor={black},
    shadowcolor={white}
}
```

---

### Conversion Tables

Generate comprehensive measurement conversion pages:

```latex
\makeconversionpage{
    title={Conversion Tables},           % Optional: Page title (default: translated)
    titlefontsize={\fontsize{32pt}{36pt}}, % Optional: Title font size
    textcolor={darkgrey},                % Optional: Text color
    bgcolor={colorname},                  % Optional: Background color
    layout={single}                       % Optional: 'single' or 'double'
}
```

**Includes:**

- Volume conversions (teaspoons to gallons)
- Weight conversions (ounces to kilograms)
- Temperature conversions (Fahrenheit to Celsius)
- Oven temperature guide
- Length conversions (inches to centimeters)
- Common ingredient conversions (butter, flour, sugar)

**Example:**

```latex
\makeconversionpage{
    title={Conversion Tables}
}
```

---

### Back Cover

Create a professional back cover:

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

**Layout Structure:**

- **Top section:** Two-column layout with text and image
- **Bottom section:** Full-width content area
- **Footer:** Publisher info (left) and ISBN/barcode (right)

**Example:**

```latex
\makebackcoverpage{
    topcontent={About this cookbook...},
    image={images/book/back-cover.jpg},
    isbn={978-0-123456-78-9},
    publisher={Published by Your Publisher},
    copyright={© 2025 All rights reserved.},
    bgcolor={darkgrey},
    textcolor={white}
}
```

---

### Index

Generate an index of recipes and ingredients:

```latex
\printindex
```

The index automatically includes all entries specified in the `indexes` parameter of recipes. It appears in the table of contents with the translated "Index" title.

---

## Recipe Command

The `\recipe{}` command is the heart of the template, supporting extensive customization:

### Recipe Parameters

```latex
\recipe{
    % Layout
    layout={columns},                   % 'columns' or 'simple' (default: columns)

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
    spicy={yes},                        % Optional: Auto-add Spicy tag with 🌶️
    vegetarian={yes},                   % Optional: Auto-add Vegetarian tag with 🌱
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

---

### Recipe Layouts

#### Columns Layout (Default)

The default layout with a two-column structure:

- **Left column:** Recipe tags and ingredients
- **Right column:** Instructions

```latex
\recipe{
    layout={columns},  % or omit (it's the default)
    title={My Recipe},
    % ...
}
```

#### Simple Layout

Alternative single-column layout:

- **Left column:** Recipe information and tags
- **Right column:** Ingredients
- **Below:** Instructions in full width

```latex
\recipe{
    layout={simple},
    title={My Recipe},
    % ...
}
```

---

### Recipe Elements

#### Ingredients

Basic ingredient entry:

```latex
\ingredient{200g flour}
\ingredient{2 eggs}
\ingredient{1 cup milk}
```

#### Ingredient Sections

Organize ingredients into sections for complex recipes:

```latex
\ingredientsection{Sauce}
\ingredient{1 tbsp olive oil}
\ingredient{2 onions, chopped}

\ingredientsection{Serving}
\ingredient{375g spaghetti}
\ingredient{80g parmesan}
```

#### Instructions

Basic instruction step:

```latex
\instruction{Mix all ingredients together in a bowl.}
\instruction{Heat oil in a pan over medium heat.}
```

#### Instruction Sections

Organize instructions into phases:

```latex
\instructionsection{Preparing the Sauce}
\instruction{Heat oil in a pan...}
\instruction{Add ingredients and cook...}

\instructionsection{Cooking the Pasta}
\instruction{Cook pasta in boiling water...}

\instructionsection{Serving}
\instruction{Combine and serve...}
```

#### Tags

Tags are automatically formatted as badges:

```latex
tags={Breakfast, Sweet, Vegetarian}
```

#### Auto-Generated Tags

Special flags automatically add tags with emoji icons:

```latex
spicy={yes}        % Adds "Spicy" tag with 🌶️ icon
vegetarian={yes}   % Adds "Vegetarian" tag with 🌱 icon
```

**Customize emoji icons:**

```latex
\setspicyemoji{hot-pepper}      % Default: hot-pepper
\setvegetarianemoji{seedling}   % Default: seedling
```

Use any valid emoji name from the `emoji` package.

#### Index Entries

Add recipes to the index with comma-separated entries:

```latex
indexes={Spaghetti Bolognese, Recipes!Entrees, Recipes!Pasta, Italian cuisine}
```

Use `!` for hierarchical entries:

- `Recipes!Breakfast` → "Breakfast" under "Recipes"
- `Cuisine!Italian` → "Italian" under "Cuisine"

#### Recipe Notes

Add contextual notes to ingredients and instructions using the `\note{...}` command. Notes are automatically numbered with superscript references and collected at the bottom of the recipe in a "Notes" section.

**Adding Notes to Ingredients:**

```latex
\ingredient{2 cups flour\note{Use all-purpose flour for best results}}
\ingredient{1/2 cup butter, softened\note{For the flakiest crust, make sure all ingredients are cold}}
```

**Adding Notes to Instructions:**

```latex
\instruction{Mix ingredients until just combined.\note{Be careful not to overmix, as this can make the dough tough.}}
\instruction{Bake for 25-30 minutes.\note{The cake is done when a toothpick inserted in the center comes out clean.}}
```

**How It Works:**

- Notes are automatically numbered sequentially (¹, ², ³, etc.) as they appear in the recipe
- Each note appears as a superscript number inline where it's placed
- All notes are collected and displayed at the bottom of the recipe in a numbered list
- Note numbering resets for each new recipe
- If a recipe has no notes, the Notes section is automatically hidden

**Example Recipe with Notes:**

```latex
\recipe{
    title={Banana Pancakes},
    ingredients={
        \ingredient{2 medium-to-large ripe bananas\note{The riper the bananas, the sweeter the pancakes will be.}}
        \ingredient{1/2 cup whole wheat flour\note{For a gluten-free option, use buckwheat or oat flour.}}
        \ingredient{Butter, for cooking\note{Ghee provides a rich, buttery flavor without burning easily.}}
    },
    instructions={
        \instruction{Scoop ¼ cup batter onto the hot skillet.\note{Don't flip too early! Wait until bubbles form on the surface.}}
        \instruction{Flip and cook until golden.\note{If pancakes are browning too quickly, reduce the heat slightly.}}
    }
}
```

**Customizing the Notes Label:**

Override the "Notes" label for different languages or custom text:

```latex
\setTextNotes{Remarques}  % French: "Remarques"
\setTextNotes{Tips}       % Custom: "Tips"
```

---

## Customization

### Colors

#### Predefined Colors

The template includes three predefined colors:

```latex
darkgrey   % HTML: #1a1a1a
lightgrey  % HTML: #808080
paleorange % HTML: #eb984e
```

#### Using Colors

```latex
\makecoverpage{
    bgcolor={darkgrey},
    textcolor={white}
}
```

#### Defining Custom Colors

Use any LaTeX color name or define your own:

```latex
% Using standard colors
bgcolor={red}
bgcolor={blue!50}  % 50% blue

% Define custom colors
\definecolor{myblue}{RGB}{0, 120, 200}
\definecolor{warmgray}{HTML}{8B8680}
```

---

### Margins

#### Customizing Page Margins

You can customize individual page margins after loading the document class:

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

% Customize margins
\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2cm}    % Uses 'inner' for twoside, 'left' for oneside
\setmarginright{2cm}    % Uses 'outer' for twoside, 'right' for oneside
```

**Important Notes:**

- For **two-sided documents** (`twoside` option):
  - `\setmarginleft` sets the **inner** margin (left edge of left pages, right edge of right pages)
  - `\setmarginright` sets the **outer** margin (right edge of left pages, left edge of right pages)
- For **one-sided documents**:
  - `\setmarginleft` sets the **left** margin
  - `\setmarginright` sets the **right** margin

**Default Margins:**

- Top: `1.5cm`
- Bottom: `1.5cm`
- Left/Inner: `1.5cm`
- Right/Outer: `1.5cm`

**Example:**

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

% Increase margins for better readability
\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2.5cm}  % Larger inner margin for binding
\setmarginright{1.5cm}

\begin{document}
% ... your content ...
\end{document}
```

---

### Spacing

#### Global Spacing Controls

Control spacing throughout your document:

```latex
% Spacing before lists (default: 0pt)
\setlistbefore{-1\baselineskip}
\setlistbefore{0pt}

% Ingredient item spacing (default: 0.005\textheight)
\setingredientitemsep{0.01\textheight}
\setingredientitemsep{2pt}

% Instruction item spacing (default: 0.005\textheight)
\setinstructionitemsep{0.5\baselineskip}
\setinstructionitemsep{4pt}

% Column spacing (default: 0.05\textwidth)
\setcolumnsep{0.1\textwidth}
\setcolumnsep{10pt}
```

#### Per-Recipe Spacing

Override global settings for individual recipes:

```latex
\recipe{
    ingredientitemsep={0.01\textheight},
    instructionitemsep={0.5\baselineskip},
    % ...
}
```

---

### Fonts

The template uses `fontspec` for modern font management:

#### Default Fonts

- **Serif:** EB Garamond
- **Sans-serif:** Source Sans Pro
- **Monospace:** Courier

#### Font Commands

```latex
% Sans-serif text
{\sourcesanspro Your text here}

% Garamond text (default)
{\ebgaramond Your text here}

% Font sizes
\fontsize{24pt}{28pt}\selectfont Your text
```

#### Changing Default Fonts

Modify the font definitions in the class file or override in your document:

```latex
\setmainfont{Your Serif Font}
\setsansfont{Your Sans Font}
\setmonofont{Your Mono Font}
```

---

## Complete Examples

### Minimal Cookbook

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

\begin{document}

\makecoverpage{
    title={My Recipes},
    author={Your Name}
}

\maketoc

\makechapterpage{
    title={Breakfast}
}

\recipe{
    title={Scrambled Eggs},
    serves={2},
    preptime={5 mins},
    cookingtime={5 mins},
    tags={Breakfast, Quick},
    ingredients={
        \ingredient{4 eggs}
        \ingredient{2 tbsp milk}
        \ingredient{Salt and pepper}
        \ingredient{1 tbsp butter}
    },
    instructions={
        \instruction{Beat eggs with milk, salt, and pepper.}
        \instruction{Melt butter in a pan over medium heat.}
        \instruction{Pour in eggs and cook, stirring gently, until set.}
    }
}

\end{document}
```

---

### Recipe with Notes

```latex
\recipe{
    title={Banana Pancakes},
    serves={4},
    preptime={5 mins},
    cookingtime={15 mins},
    tags={Breakfast, Sweet},
    vegetarian={yes},
    ingredients={
        \ingredient{2 medium-to-large ripe bananas\note{The riper the bananas, the sweeter the pancakes will be. Look for bananas with brown spots on the peel.}}
        \ingredient{1/2 cup whole wheat flour or buckwheat flour\note{For a gluten-free option, use buckwheat or oat flour. The texture will be slightly different but equally delicious.}}
        \ingredient{Butter, avocado oil or ghee, for cooking\note{Ghee provides a rich, buttery flavor without burning as easily as regular butter.}}
        \ingredient{2 large eggs}
        \ingredient{1/4 tsp baking powder}
        \ingredient{Pinch of salt}
    },
    instructions={
        \instruction{In a medium bowl, mash the bananas with a fork until mostly smooth.}
        \instruction{Add eggs and whisk until well combined.}
        \instruction{Add flour, baking powder, and salt. Stir until just combined.}
        \instruction{Heat a large skillet or griddle over medium heat. Add butter or oil.}
        \instruction{Scoop ¼ cup batter onto the hot skillet, leaving space around each pancake.\note{Don't flip too early! Wait until you see bubbles forming on the surface, which indicates the bottom is cooked.}}
        \instruction{Flip the pancakes, then cook until lightly golden on both sides.\note{If pancakes are browning too quickly, reduce the heat slightly. The goal is a golden-brown exterior with a fully cooked interior.}}
    }
}
```

---

### Recipe with Image and Sections

```latex
\recipe{
    image={images/recipes/bolognese.jpg},
    imageheight={0.4\paperheight},
    title={Spaghetti Bolognese},
    description={Classic Italian meat sauce with rich tomato flavor.},
    serves={4},
    preptime={25 mins},
    cookingtime={1 hour 15 mins},
    difficulty={Intermediate},
    origin={Italy},
    tags={Pasta, Meat, Italian},
    indexes={Spaghetti Bolognese, Recipes!Pasta, Italian cuisine},
    extrainstructioninfo={This sauce freezes well for up to 2 months.},
    ingredients={
        \ingredientsection{Sauce}
        \ingredient{1 tbsp olive oil}
        \ingredient{2 onions, finely chopped}
        \ingredient{500g beef mince}
        \ingredient{2 x 400g cans diced tomatoes}
        \ingredient{1 tbsp dried oregano}

        \ingredientsection{Serving}
        \ingredient{375g dried spaghetti}
        \ingredient{80g parmesan, grated}
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

### Full Cookbook Structure

```latex
\documentclass[letterpaper, 10pt, twoside, english]{CookBook}

% Custom spacing
\setingredientitemsep{0.005\textheight}
\setinstructionitemsep{0.5\baselineskip}

\begin{document}

% Cover
\makecoverpage{
    title={My Family Cookbook},
    subtitle={Recipes from Three Generations},
    author={Your Name},
    image={images/book/cover.jpg},
    opacity={0.6},
    bgcolor={darkgrey},
    textcolor={white}
}

% Preface
\makeprefacepage{
    title={Preface},
    text={Welcome to this collection of cherished family recipes...},
    layout={single},
    image={images/book/preface.jpg}
}

% Table of Contents
\maketoc

% Breakfast Chapter
\makechapterpage{
    title={Breakfast},
    image={images/book/breakfast.jpg},
    layout={right},
    bgcolor={paleorange}
}

% Full-page recipe image
\makeimagepage{
    image={images/recipes/banana-pancake.jpg},
    caption={Banana Pancakes}
}

% Recipe
\recipe{
    layout={simple},
    title={Banana Pancakes},
    serves={4},
    preptime={5 mins},
    cookingtime={15 mins},
    tags={Breakfast, Sweet},
    vegetarian={yes},
    indexes={Banana Pancakes, Recipes!Breakfast},
    ingredients={
        \ingredient{2 ripe bananas}
        \ingredient{2 eggs}
        \ingredient{1/2 cup flour}
    },
    instructions={
        \instruction{Mash bananas in a bowl.}
        \instruction{Add eggs and flour, mix well.}
        \instruction{Cook on a hot griddle until golden.}
    }
}

% More chapters and recipes...

% Conversion tables
\makeconversionpage{}

% Index
\printindex

% Back cover
\makebackcoverpage{
    topcontent={About this book...},
    image={images/book/back-cover.jpg},
    isbn={978-0-123456-78-9},
    publisher={Published by Your Publisher},
    copyright={© 2025 All rights reserved.},
    bgcolor={darkgrey},
    textcolor={white}
}

\end{document}
```

---

## Build System

### Using the Build Script

The included `build.sh` script simplifies compilation:

```bash
# Basic compilation
./build.sh

# Verbose output
./build.sh -v

# Help
./build.sh -h
```

The script:

1. Compiles with LuaLaTeX
2. Generates the index
3. Runs additional passes for cross-references
4. Moves the final PDF to `dist/`
5. Cleans up temporary files (stored in `tmp/`)

### Manual Compilation

If you prefer manual compilation:

```bash
lualatex --output-directory=tmp your-cookbook.tex
makeindex tmp/your-cookbook.idx
lualatex --output-directory=tmp your-cookbook.tex
lualatex --output-directory=tmp your-cookbook.tex
```

### Directory Structure

```
project/
├── your-cookbook.tex    # Your cookbook source
├── cookbook.cls         # Template class file
├── dist/               # Final PDFs (created by build script)
└── tmp/                # Temporary build files
```

---

## Troubleshooting

### Common Issues

#### "Command not found: lualatex"

**Solution:** Install a LaTeX distribution:

- **macOS:** `brew install --cask mactex`
- **Ubuntu/Debian:** `sudo apt-get install texlive-full`
- **Windows:** Install MiKTeX or TeX Live

#### "Font not found" errors

**Solution:** Ensure you're using LuaLaTeX (not pdfLaTeX). The template requires LuaLaTeX for fontspec support.

#### Images not displaying

**Solution:**

- Check image paths are relative to your `.tex` file
- Ensure images are in supported formats (JPG, PNG, PDF)
- Verify image files exist at the specified paths

#### Index not generating

**Solution:**

1. Ensure you run `makeindex` between LaTeX passes
2. Use the build script which handles this automatically
3. Check that recipes include `indexes` parameter

#### Babel errors

**Solution:**

- Ensure babel is installed: `tlmgr install babel babel-english babel-french`
- Use valid language options: `english` or `french`

#### Page numbering issues

**Solution:**

- Use `startpage` option to control starting page number
- Use `left=even` or `left=odd` to control page layout
- Check `twoside` option for proper two-sided layouts

### Getting Help

If you encounter issues:

1. Check the [examples](samples/) directory for working code
2. Review this documentation for correct syntax
3. Open an issue on GitHub with:
   - Your LaTeX version
   - Minimal example reproducing the issue
   - Error messages from the log file

---

## Advanced Tips

### Performance Optimization

For large cookbooks (100+ recipes):

1. **Use draft mode during editing:**

   ```latex
   \documentclass[draft]{CookBook}
   ```

   This skips image loading for faster compilation.

2. **Comment out completed sections:**

   ```latex
   % \input{chapters/breakfast.tex}
   \input{chapters/lunch.tex}  % Working on this
   ```

3. **Split into multiple files:**
   ```latex
   % main.tex
   \input{chapters/breakfast}
   \input{chapters/lunch}
   \input{chapters/dinner}
   ```

### Custom Page Layouts

Create custom layouts by combining elements:

```latex
% Left page: custom content
\clearpage
\thispagestyle{empty}
Your custom content here

% Right page: chapter
\makechapterpage{
    title={Chapter},
    layout={right}
}
```

### Batch Image Processing

For consistent image sizing:

```bash
# Resize all images to 1920x1080
mogrify -resize 1920x1080 -quality 85 images/recipes/*.jpg
```

---

_For more information, visit the [GitHub repository](https://github.com/AshDevFr/latex-cookbook-template.git) or open an issue._
