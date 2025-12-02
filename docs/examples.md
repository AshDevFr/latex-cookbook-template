# Complete Examples

Full cookbook examples demonstrating different features and styles.

## Minimal Cookbook

The simplest possible cookbook:

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
        \ingredient{eggs}[4][][]
        \ingredient{milk}[2][tbsp][]
        \ingredient{Salt and pepper}[][][to taste]
        \ingredient{butter}[1][tbsp][]
    },
    instructions={
        \instruction{Beat eggs with milk, salt, and pepper.}
        \instruction{Melt butter in a pan over medium heat.}
        \instruction{Pour in eggs and cook, stirring gently, until set.}
    }
}

\end{document}
```

## Recipe with Notes

Using the `\note` command for tips and variations:

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

\begin{document}

\makecoverpage{
    title={My Cookbook}
}

\maketoc

\makechapterpage{
    title={Breakfast}
}

\recipe{
    title={Banana Pancakes},
    serves={4},
    preptime={5 mins},
    cookingtime={15 mins},
    tags={Breakfast, Sweet},
    vegetarian={yes},
    ingredients={
        \ingredient{ripe bananas}[2][][medium-to-large\note{The riper the bananas, the sweeter the pancakes will be. Look for bananas with brown spots.}]
        \ingredient{whole wheat flour or buckwheat flour}[1/2][cup][\note{For a gluten-free option, use buckwheat or oat flour. The texture will be slightly different but equally delicious.}]
        \ingredient{large eggs}[2][][]
        \ingredient{baking powder}[1/4][tsp][]
        \ingredient{Pinch of salt}
        \ingredient{Butter, avocado oil or ghee, for cooking}[][][\note{Ghee provides a rich, buttery flavor without burning as easily as regular butter.}]
    },
    instructions={
        \instruction{In a medium bowl, mash the bananas with a fork until mostly smooth.}
        \instruction{Add eggs and whisk until well combined.}
        \instruction{Add flour, baking powder, and salt. Stir until just combined.}
        \instruction{Heat a large skillet or griddle over medium heat. Add butter or oil.}
        \instruction{Scoop ¼ cup batter onto the hot skillet, leaving space around each pancake.\note{Don't flip too early! Wait until you see bubbles forming on the surface.}}
        \instruction{Flip the pancakes, then cook until lightly golden on both sides.\note{If pancakes are browning too quickly, reduce the heat slightly. The goal is a golden-brown exterior with a fully cooked interior.}}
    }
}

\end{document}
```

## Recipe with Image and Sections

Complex recipe with images and organized sections:

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

\begin{document}

\makecoverpage{
    title={Italian Classics},
    author={Chef Maria}
}

\maketoc

\makechapterpage{
    title={Pasta Dishes},
    image={images/chapters/pasta.jpg},
    bgcolor={paleorange},
    layout={right}
}

% Full-page image before recipe
\makeimagepage{
    image={images/recipes/bolognese-hero.jpg},
    caption={Spaghetti Bolognese},
    textcolor={white},
    shadowcolor={black}
}

% Detailed recipe
\recipe{
    layout={columns},
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
        \ingredient{olive oil}[1][tbsp][]
        \ingredient{onions, finely chopped}[2][][]
        \ingredient{garlic, minced}[3][cloves][]
        \ingredient{beef mince}[500][g][]
        \ingredient{diced tomatoes}[2 x 400g][cans][]
        \ingredient{tomato paste}[2][tbsp][]
        \ingredient{dried oregano}[1][tbsp][]
        \ingredient{bay leaves}[2][][]
        \ingredient{Salt and pepper}[][][to taste]

        \ingredientsection{Serving}
        \ingredient{dried spaghetti}[375][g][]
        \ingredient{parmesan, grated}[80][g][]
        \ingredient{fresh basil}[][][for garnish]
    },
    instructions={
        \instructionsection{Preparing the Sauce}
        \instruction{Heat oil in a large saucepan over medium-high heat.}
        \instruction{Add onions and cook for 3 minutes until softened.}
        \instruction{Add garlic and cook for 1 minute until fragrant.}
        \instruction{Add mince and cook for 5-7 minutes, breaking up lumps.}
        \instruction{Stir in tomatoes, tomato paste, oregano, and bay leaves.}
        \instruction{Bring to boil, then reduce heat to low.}
        \instruction{Simmer uncovered for 1 hour, stirring occasionally.}
        \instruction{Season with salt and pepper. Remove bay leaves.}

        \instructionsection{Cooking and Serving}
        \instruction{About 15 minutes before sauce is ready, cook spaghetti according to packet directions.}
        \instruction{Drain pasta, reserving 1/2 cup pasta water.}
        \instruction{Add pasta to sauce with a splash of pasta water. Toss to combine.}
        \instruction{Divide among serving bowls.}
        \instruction{Top with grated parmesan and fresh basil. Serve immediately.}
    }
}

\end{document}
```

## Full Featured Cookbook

Complete cookbook with all features:

```latex
\documentclass[
    letterpaper,
    10pt,
    twoside,
    english,
    bleed
]{CookBook}

% Custom spacing
\setingredientitemsep{0.005\textheight}
\setinstructionitemsep{0.5\baselineskip}

% Custom margins for binding
\setmargintop{2cm}
\setmarginbottom{2cm}
\setmarginleft{2.5cm}
\setmarginright{1.5cm}

% Bleed settings
\setbleedvalue{0.125in}
\setguttermargin{0.5in}

\begin{document}

% ===== FRONT MATTER =====

% Cover Page
\makecoverpage{
    title={My Family Cookbook},
    titlefontsize={\fontsize{48pt}{52pt}},
    subtitle={Recipes from Three Generations},
    subtitlefontsize={\fontsize{28pt}{32pt}},
    author={Jane Smith},
    authorfontsize={\fontsize{22pt}{26pt}},
    image={images/book/cover.jpg},
    opacity={0.6},
    bgcolor={darkgrey},
    textcolor={white},
    shadowcolor={black}
}

% Preface Page
\makeprefacepage{
    title={Preface},
    titlefontsize={\fontsize{36pt}{40pt}},
    text={Welcome to this collection of cherished family recipes. Each dish tells a story of our family's culinary journey through three generations.

    From my grandmother's traditional Sunday roasts to my mother's innovative fusion dishes, and now my own modern interpretations, these recipes represent the heart of our family's kitchen.

    I hope these recipes bring as much joy to your table as they have to ours over the years. Happy cooking!},
    textfontsize={\fontsize{12pt}{16pt}},
    layout={single},
    image={images/book/preface.jpg},
    imageheight={0.4}
}

% Table of Contents
\maketoc

% ===== BREAKFAST CHAPTER =====

\makechapterpage{
    title={Breakfast},
    subtitle={Morning Favorites},
    image={images/chapters/breakfast.jpg},
    opacity={0.7},
    layout={right},
    bgcolor={paleorange}
}

% Full-page image
\makeimagepage{
    image={images/recipes/pancakes-hero.jpg},
    caption={Fluffy Banana Pancakes},
    captionfontsize={\fontsize{24pt}{28pt}},
    textcolor={white},
    shadowcolor={black}
}

% Featured recipe with image
\recipe{
    layout={columns},
    fullpage={true},
    image={images/recipes/pancakes.jpg},
    imageheight={0.3\paperheight},
    title={Banana Pancakes},
    description={Fluffy, naturally sweet pancakes perfect for weekend mornings.},
    serves={4},
    preptime={5 mins},
    cookingtime={15 mins},
    difficulty={Beginner},
    tags={Breakfast, Sweet, Quick},
    vegetarian={yes},
    indexes={Banana Pancakes, Recipes!Breakfast, Pancakes},
    ingredients={
        \ingredient{ripe bananas}[2][][medium-to-large]
        \ingredient{whole wheat flour}[1/2][cup][]
        \ingredient{large eggs}[2][][]
        \ingredient{baking powder}[1/4][tsp][]
        \ingredient{Pinch of salt}
        \ingredient{Butter, for cooking}
    },
    instructions={
        \instruction{Mash bananas in a bowl until mostly smooth.}
        \instruction{Add eggs and whisk until well combined.}
        \instruction{Add flour, baking powder, and salt. Stir until just combined.}
        \instruction{Heat skillet over medium heat. Add butter.}
        \instruction{Scoop ¼ cup batter onto hot skillet.}
        \instruction{Flip when bubbles form on surface.}
        \instruction{Cook until golden brown on both sides.}
    }
}

% Compact variations
\recipe{
    layout={simple},
    fullpage={false},
    title={Blueberry Pancakes},
    description={Add 1/2 cup fresh blueberries to the batter.},
    serves={4},
    tags={Breakfast, Berries},
    ingredients={
        \ingredient{Use Banana Pancake base recipe}
        \ingredient{fresh blueberries}[1/2][cup][]
    },
    instructions={
        \instruction{Follow base recipe through step 3.}
        \instruction{Gently fold in blueberries.}
        \instruction{Continue with steps 4-7.}
    }
}

\recipe{
    layout={simple},
    fullpage={false},
    title={Chocolate Chip Pancakes},
    description={Indulgent chocolate pancakes for special occasions.},
    serves={4},
    tags={Breakfast, Chocolate},
    ingredients={
        \ingredient{Use Banana Pancake base recipe}
        \ingredient{chocolate chips}[1/3][cup][]
    },
    instructions={
        \instruction{Follow base recipe through step 3.}
        \instruction{Gently fold in chocolate chips.}
        \instruction{Continue with steps 4-7.}
    }
}

% ===== MORE CHAPTERS =====
% (Add more chapters and recipes here)

% ===== BACK MATTER =====

% Conversion Tables
\makeconversionpage{
    title={Conversion Tables},
    titlefontsize={\fontsize{36pt}{40pt}}
}

% Index
\printindex

% Back Cover
\makebackcoverpage{
    topcontent={
        \textbf{Inside This Cookbook}

        \vspace{0.5cm}

        This comprehensive collection includes over 100 family recipes spanning breakfast, lunch, dinner, and desserts. Each recipe has been tested and perfected over generations.

        Features:
        \begin{itemize}
        \item Detailed instructions for all skill levels
        \item Preparation and cooking times
        \item Serving suggestions
        \item Helpful notes and variations
        \end{itemize}
    },
    image={images/book/back-cover.jpg},
    imageopacity={0.9},
    imageposition={right},
    bottomcontent={
        \textbf{About the Author}

        \vspace{0.3cm}

        Jane Smith has been sharing her culinary passion for over 20 years. This cookbook brings together recipes from her grandmother, mother, and her own kitchen.
    },
    isbn={978-0-123456-78-9},
    publisher={Published by Family Press},
    copyright={© 2025 Jane Smith. All rights reserved.},
    bgcolor={darkgrey},
    textcolor={white}
}

\end{document}
```

## Multi-Language Cookbook

French cookbook with custom translations:

```latex
\documentclass[french, letterpaper, 10pt, twoside]{CookBook}

% Custom French labels
\setTextRecipes{Mes Recettes}
\setTextServes{Pour}
\setTextPrep{Temps de préparation}
\setTextCooking{Temps de cuisson}

\begin{document}

\makecoverpage{
    title={Mon Livre de Cuisine},
    subtitle={Recettes de Famille},
    author={Marie Dupont},
    bgcolor={darkgrey},
    textcolor={white}
}

\maketoc

\makechapterpage{
    title={Petit Déjeuner}
}

\recipe{
    title={Crêpes aux Bananes},
    serves={4},
    preptime={5 min},
    cookingtime={15 min},
    tags={Petit Déjeuner, Sucré},
    vegetarian={yes},
    ingredients={
        \ingredient{bananes mûres}[2][][]
        \ingredient{farine}[1/2][tasse][]
        \ingredient{œufs}[2][][]
    },
    instructions={
        \instruction{Écraser les bananes dans un bol.}
        \instruction{Ajouter les œufs et mélanger.}
        \instruction{Incorporer la farine.}
        \instruction{Cuire à feu moyen.}
    }
}

\end{document}
```

## Compact Recipe Collection

Multiple short recipes on same pages:

```latex
\documentclass[letterpaper, 10pt, twoside]{CookBook}

\begin{document}

\makecoverpage{
    title={Quick Recipes},
    subtitle={Fast and Delicious}
}

\makechapterpage{
    title={5-Minute Breakfasts}
}

\recipe{
    layout={simple},
    fullpage={false},
    title={Scrambled Eggs},
    serves={1},
    preptime={2 mins},
    cookingtime={3 mins},
    ingredients={
        \ingredient{eggs}[2][][]
        \ingredient{butter}[1][tsp][]
        \ingredient{Salt and pepper}
    },
    instructions={
        \instruction{Beat eggs with salt and pepper.}
        \instruction{Melt butter in pan.}
        \instruction{Cook eggs, stirring, until set.}
    }
}

\recipe{
    layout={simple},
    fullpage={false},
    title={Toast with Avocado},
    serves={1},
    preptime={3 mins},
    cookingtime={2 mins},
    ingredients={
        \ingredient{bread}[2][slices][]
        \ingredient{avocado}[1/2][][]
        \ingredient{Salt and pepper}
    },
    instructions={
        \instruction{Toast bread.}
        \instruction{Mash avocado with salt and pepper.}
        \instruction{Spread on toast.}
    }
}

\recipe{
    layout={simple},
    fullpage={false},
    title={Yogurt Parfait},
    serves={1},
    preptime={5 mins},
    ingredients={
        \ingredient{Greek yogurt}[1][cup][]
        \ingredient{granola}[1/4][cup][]
        \ingredient{berries}[1/2][cup][]
        \ingredient{honey}[1][tbsp][]
    },
    instructions={
        \instruction{Layer yogurt, granola, and berries in a glass.}
        \instruction{Drizzle with honey.}
    }
}

\end{document}
```

---

[← Back to Documentation Index](README.md)
