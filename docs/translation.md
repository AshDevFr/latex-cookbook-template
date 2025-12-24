# Translation and Language Support

The template uses the `babel` package for comprehensive multi-language support, providing proper hyphenation, typography rules, and translations.

## Available Languages

The template currently supports English (default) and French. Set the language using document class options:

```latex
% English (default)
\documentclass[english]{CookBook}

% French
\documentclass[french]{CookBook}
```

## Translation Architecture

As of version 2.0.0, translations are organized in separate files located in the `translations/` directory that are automatically loaded based on your language selection.

**For contributors:** If you want to add a new language or understand the translation file structure, see [translations/README.md](../translations/README.md).

**For users:** To customize existing translations in your cookbook document without creating a new language file, see the "Custom Text Override Commands" section below.

## Custom Text Override Commands

You can override any translation after loading the document class. Here are all available translation commands:

### Copy-Paste Template (Basic Labels)

For most users, these basic labels are sufficient:

```latex
\documentclass[french]{CookBook}

% Recipe Information Labels
\setTextRecipes{Mes Recettes}              % Table of contents title
\setTextServes{Pour}                       % Serves/Portions
\setTextPrep{Temps de préparation}         % Preparation time
\setTextCooking{Temps de cuisson}          % Cooking time
\setTextDifficulty{Niveau}                 % Difficulty level
\setTextOrigin{Provenance}                 % Recipe origin
\setTextSpicy{Piquant}                     % Spicy tag
\setTextVegetarian{Végétarien}             % Vegetarian tag
\setTextNotes{Remarques}                   % Notes section title
\setTextIndex{Index des Recettes}          % Index page title

% Conversion Table Titles
\setTextConversionTable{Tableau de Conversion}  % Conversion table title
\setTextVolume{Volume}                     % Volume section title
\setTextWeight{Poids}                      % Weight section title
\setTextTemperature{Température}           % Temperature section title
\setTextLength{Longueur}                   % Length section title
\setTextOvenTemperatures{Températures du Four}  % Oven temperatures title

\begin{document}
% Your content here
\end{document}
```

### Complete Translation Template (All Commands)

For complete language translations, use this comprehensive template with all 71 translation commands:

```latex
\documentclass[english]{CookBook}  % Set base language

% === RECIPE INFORMATION LABELS ===
\setTextRecipes{Recipes}
\setTextServes{Serves}
\setTextPrep{Prep}
\setTextCooking{Cooking}
\setTextDifficulty{Difficulty}
\setTextOrigin{Origin}
\setTextSpicy{Spicy}
\setTextVegetarian{Vegetarian}
\setTextNotes{Notes}
\setTextIndex{Index}

% === CONVERSION TABLE MAIN LABELS ===
\setTextConversionTable{Conversion Tables}
\setTextVolume{Volume}
\setTextWeight{Weight}
\setTextTemperature{Temperature}
\setTextLength{Length}
\setTextOvenTemperatures{Oven Temperatures}

% === CONVERSION SYSTEM LABELS ===
\setTextUSImperial{US/Imperial}
\setTextMetric{Metric}
\setTextFahrenheit{Fahrenheit (°F)}
\setTextCelsius{Celsius (°C)}
\setTextInches{Inches}
\setTextCentimeters{Centimeters}
\setTextUseCase{Use Case}
\setTextCommonUse{Common Use}
\setTextAdditionalConversions{Additional Conversions}
\setTextMeasurement{Measurement}
\setTextConversion{Conversion}
\setTextFormula{Formula}

% === UNIT LABELS ===
\setTextTablespoon{Tablespoon}
\setTextTablespoons{Tablespoons}
\setTextTeaspoon{Teaspoon}
\setTextTeaspoons{Teaspoons}
\setTextCup{Cup}
\setTextCups{Cups}
\setTextQuart{Quart}
\setTextQuarts{Quarts}
\setTextSticksUS{Sticks (US)}

% === TEMPERATURE REFERENCE LABELS ===
\setTextFreezingPoint{Freezing point of water}
\setTextRoomTemperature{Room temperature}
\setTextBodyTemperature{Body temperature}
\setTextBoilingPoint{Boiling point of water}
\setTextCommonBakingTemp{Common baking temperature}

% === OVEN TEMPERATURE USE CASES ===
\setTextSlowRoasting{Slow roasting}
\setTextSlowCooking{Slow cooking, braising}
\setTextDelicateCakes{Delicate cakes, custards}
\setTextCakesCookies{Cakes, cookies}
\setTextQuickBreads{Quick breads, muffins}
\setTextRoastingVegetables{Roasting vegetables, meats}
\setTextPizzaBread{Pizza, artisan bread}
\setTextHighHeatRoasting{High-heat roasting}
\setTextDefaultOvenTemp{Default oven temperature}

% === KITCHEN ITEM LABELS ===
\setTextSmallTartPan{Small tart pan}
\setTextSmallCakePan{Small cake pan}
\setTextStandardCakePan{Standard cake pan}
\setTextStandardPiePan{Standard pie pan}
\setTextLargeCakePan{Large cake pan}
\setTextLargeSkillet{Large skillet}
\setTextStandardBakingDish{Standard baking dish}

% === COMMON INGREDIENT LABELS ===
\setTextStickButter{1 stick butter}
\setTextCupButter{1 cup butter}
\setTextAllPurposeFlour{All-purpose flour (1 cup)}
\setTextGranulatedSugar{Granulated sugar (1 cup)}
\setTextBrownSugar{Brown sugar (1 cup, packed)}
\setTextPowderedSugar{Powdered sugar (1 cup)}
\setTextChocolateChips{Chocolate chips (1 cup)}
\setTextCupMilk{1 cup milk}
\setTextCupWater{1 cup water}
\setTextCupHoney{1 cup honey}
\setTextVegetableOil{Vegetable oil (1 cup)}
\setTextLargeEgg{1 large egg}
\setTextActiveDryYeast{Active dry yeast (1 packet)}

\begin{document}
% Your content here
\end{document}
```

## Complete Translation Commands Reference

### Recipe Information Labels

```latex
\setTextServes{text}       % Default: "Serves" (EN) / "Portions" (FR)
\setTextPrep{text}         % Default: "Prep" (EN) / "Préparation" (FR)
\setTextCooking{text}      % Default: "Cooking" (EN) / "Cuisson" (FR)
\setTextDifficulty{text}   % Default: "Difficulty" (EN) / "Difficulté" (FR)
\setTextOrigin{text}       % Default: "Origin" (EN) / "Origine" (FR)
```

### Tag Labels

```latex
\setTextSpicy{text}        % Default: "Spicy" (EN) / "Épicé" (FR)
\setTextVegetarian{text}   % Default: "Vegetarian" (EN) / "Végétarien" (FR)
```

### Page Titles

```latex
\setTextRecipes{text}      % Default: "Recipes" (EN) / "Recettes" (FR)
\setTextIndex{text}        % Default: "Index" (EN) / "Index" (FR)
\setTextNotes{text}        % Default: "Notes" (EN) / "Notes" (FR)
```

### Conversion Table Labels

```latex
\setTextConversionTable{text}    % Default: "Conversion Table" (EN) / "Table de Conversion" (FR)
\setTextVolume{text}             % Default: "Volume" (EN) / "Volume" (FR)
\setTextWeight{text}             % Default: "Weight" (EN) / "Poids" (FR)
\setTextTemperature{text}        % Default: "Temperature" (EN) / "Température" (FR)
\setTextLength{text}             % Default: "Length" (EN) / "Longueur" (FR)
\setTextOvenTemperatures{text}   % Default: "Oven Temperatures" (EN) / "Températures du Four" (FR)
```

### Conversion Table System Labels

```latex
\setTextUSImperial{text}              % Default: "US/Imperial"
\setTextMetric{text}                  % Default: "Metric"
\setTextFahrenheit{text}              % Default: "Fahrenheit (°F)"
\setTextCelsius{text}                 % Default: "Celsius (°C)"
\setTextInches{text}                  % Default: "Inches"
\setTextCentimeters{text}             % Default: "Centimeters"
\setTextUseCase{text}                 % Default: "Use Case"
\setTextCommonUse{text}               % Default: "Common Use"
\setTextAdditionalConversions{text}   % Default: "Additional Conversions"
\setTextMeasurement{text}             % Default: "Measurement"
\setTextConversion{text}              % Default: "Conversion"
\setTextFormula{text}                 % Default: "Formula"
```

### Unit Labels

```latex
\setTextTablespoon{text}    % Default: "Tablespoon" / "1 Tbsp"
\setTextTablespoons{text}   % Default: "Tablespoons" / "Tbsp"
\setTextTeaspoon{text}      % Default: "Teaspoon" / "1 tsp"
\setTextTeaspoons{text}     % Default: "Teaspoons" / "tsp"
\setTextCup{text}           % Default: "Cup" / "1 cup"
\setTextCups{text}          % Default: "Cups" / "cups"
\setTextQuart{text}         % Default: "Quart" / "1 qt"
\setTextQuarts{text}        % Default: "Quarts" / "qt"
\setTextSticksUS{text}      % Default: "Sticks (US)"
```

### Temperature Reference Labels

```latex
\setTextFreezingPoint{text}      % Default: "Freezing point of water"
\setTextRoomTemperature{text}    % Default: "Room temperature"
\setTextBodyTemperature{text}    % Default: "Body temperature"
\setTextBoilingPoint{text}       % Default: "Boiling point of water"
\setTextCommonBakingTemp{text}   % Default: "Common baking temperature"
```

### Oven Temperature Use Case Labels

```latex
\setTextSlowRoasting{text}         % Default: "Slow roasting"
\setTextSlowCooking{text}          % Default: "Slow cooking, braising"
\setTextDelicateCakes{text}        % Default: "Delicate cakes, custards"
\setTextCakesCookies{text}         % Default: "Cakes, cookies"
\setTextQuickBreads{text}          % Default: "Quick breads, muffins"
\setTextRoastingVegetables{text}   % Default: "Roasting vegetables, meats"
\setTextPizzaBread{text}           % Default: "Pizza, artisan bread"
\setTextHighHeatRoasting{text}     % Default: "High-heat roasting"
\setTextDefaultOvenTemp{text}      % Default: "Default oven temperature"
```

### Kitchen Item Labels

```latex
\setTextSmallTartPan{text}       % Default: "Small tart pan"
\setTextSmallCakePan{text}       % Default: "Small cake pan"
\setTextStandardCakePan{text}    % Default: "Standard cake pan"
\setTextStandardPiePan{text}     % Default: "Standard pie pan"
\setTextLargeCakePan{text}       % Default: "Large cake pan"
\setTextLargeSkillet{text}       % Default: "Large skillet"
\setTextStandardBakingDish{text} % Default: "Standard baking dish"
```

### Common Ingredient Labels

```latex
\setTextStickButter{text}        % Default: "1 stick butter"
\setTextCupButter{text}          % Default: "1 cup butter"
\setTextAllPurposeFlour{text}    % Default: "All-purpose flour (1 cup)"
\setTextGranulatedSugar{text}    % Default: "Granulated sugar (1 cup)"
\setTextBrownSugar{text}         % Default: "Brown sugar (1 cup, packed)"
\setTextPowderedSugar{text}      % Default: "Powdered sugar (1 cup)"
\setTextChocolateChips{text}     % Default: "Chocolate chips (1 cup)"
\setTextCupMilk{text}            % Default: "1 cup milk"
\setTextCupWater{text}           % Default: "1 cup water"
\setTextCupHoney{text}           % Default: "1 cup honey"
\setTextVegetableOil{text}       % Default: "Vegetable oil (1 cup)"
\setTextLargeEgg{text}           % Default: "1 large egg"
\setTextActiveDryYeast{text}     % Default: "Active dry yeast (1 packet)"
```

## Tag Icon Customization

The template includes a tag-to-icon mapping system that allows you to associate visual icons with specific tags. Icons can be either emojis or text abbreviations.

### Registering Tag Icons

```latex
% Register an emoji icon
\registerTagIcon{Spicy}{emoji}{hot-pepper}        % 🌶️
\registerTagIcon{Vegetarian}{emoji}{seedling}     % 🌱

% Register a text icon
\registerTagIcon{Gluten-free}{text}{GF}
\registerTagIcon{Vegan}{text}{V}
\registerTagIcon{Dairy-free}{text}{DF}
```

### Default Tag Icons

The following tag icons are pre-registered:
- `Spicy` → 🌶️ (hot-pepper emoji)
- `Vegetarian` → 🌱 (seedling emoji)
- `Vegan` → V (text)
- `Gluten-free` → GF (text)
- `Dairy-free` → DF (text)

Icons appear in the recipe header next to the origin, while the tag badges appear in the tag list.

For emoji icons, you can use any valid emoji name from the `emoji` package.

## Usage Examples

### English Cookbook with Custom Labels

```latex
\documentclass[english]{CookBook}

% Customize some labels
\setTextServes{Servings}
\setTextPrep{Preparation Time}
\setTextCooking{Cook Time}

\begin{document}
\recipe{
    title={My Recipe},
    serves={4},
    preptime={15 mins},
    cookingtime={30 mins},
    % ... rest of recipe
}
\end{document}
```

### French Cookbook with Custom Labels

```latex
\documentclass[french]{CookBook}

% Customize French labels
\setTextRecipes{Mes Recettes Favorites}
\setTextServes{Pour}
\setTextPrep{Préparation}
\setTextCooking{Cuisson}
\setTextDifficulty{Niveau de Difficulté}
\setTextNotes{Conseils}

\begin{document}
\recipe{
    title={Ma Recette},
    serves={4},
    preptime={15 min},
    cookingtime={30 min},
    difficulty={Facile},
    % ... rest of recipe
}
\end{document}
```

### Custom Language Using Override Commands

While it's recommended to create a proper translation file (see "Translation Architecture" section above), you can also use override commands for quick customization or languages that don't have a full translation file yet:

```latex
\documentclass[english]{CookBook}  % Use english as base

% Override all labels for Spanish
\setTextRecipes{Recetas}
\setTextServes{Porciones}
\setTextPrep{Preparación}
\setTextCooking{Cocción}
\setTextDifficulty{Dificultad}
\setTextOrigin{Origen}
\setTextSpicy{Picante}
\setTextVegetarian{Vegetariano}
\setTextNotes{Notas}
\setTextIndex{Índice}
\setTextConversionTable{Tabla de Conversión}
\setTextVolume{Volumen}
\setTextWeight{Peso}
\setTextTemperature{Temperatura}
\setTextLength{Longitud}
\setTextOvenTemperatures{Temperaturas del Horno}
% ... (71 total translation commands available)

\begin{document}
% Your Spanish cookbook content
\end{document}
```

**Note:** For a complete language translation, it's better to create a dedicated translation file (e.g., `translations/cookbook-spanish.def`) following the instructions in the "Adding a New Language" section above. This approach is cleaner and makes the translation reusable.

## Tips for Translation

1. **Use Translation Files for New Languages**: If you're adding a complete language translation, create a new translation file in `translations/` rather than using override commands in your document. This makes the translation:
   - Reusable across multiple cookbooks
   - Easier to maintain and update
   - Shareable with the community
   - Cleaner in your main document

2. **Set Language First**: Always set the language option in the document class declaration before any custom overrides.

3. **Consistent Terminology**: Keep your terminology consistent throughout the cookbook. Use the same translation for each label across all recipes.

4. **Test Output**: After setting custom translations, compile your document to ensure all labels appear correctly.

5. **Typography Rules**: The `babel` package automatically handles language-specific typography rules (hyphenation, spacing, etc.) for English and French. For other languages, you may need to load additional babel language modules.

6. **Character Encoding**: The template uses `fontspec` with LuaLaTeX, which fully supports Unicode. You can use any characters from any language directly in your source file.

7. **Contribute Your Translations**: If you create a translation file for a new language, consider contributing it back to the project by submitting a pull request to the [GitHub repository](https://github.com/AshDevFr/latex-cookbook-template).

---

[← Back to Documentation Index](README.md)
