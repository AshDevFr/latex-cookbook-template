# Cookbook Class Translations

This directory contains translation files for the Cookbook LaTeX class. Each translation file defines all the text strings used by the class in a specific language.

**For end users:** If you want to customize translations in your cookbook document without creating a new language file, see [docs/translation.md](../docs/translation.md) for override commands and usage examples.

## Available Languages

- **English** (`cookbook-english.def`) - Default language
- **French** (`cookbook-french.def`) - French translation

## Adding a New Language

To add support for a new language, follow these steps:

### 1. Create a new translation file

Copy an existing translation file (e.g., `cookbook-english.def`) and rename it:

```bash
cp cookbook-english.def cookbook-<language>.def
```

Replace `<language>` with the language name (must match Babel's language name, e.g., `german`, `spanish`, `italian`).

### 2. Translate all strings

Open your new file and translate all the text strings inside the `\addto\captions<language>{...}` block. Make sure to:

- Update the header comment to reflect the new language
- Change `\addto\captionsenglish{` to `\addto\captions<language>{` (matching Babel's language name)
- Translate all `\def\text...{...}%` entries

### 3. Register the language option

Edit the main `cookbook.cls` file and add a new language option in the "LANGUAGE OPTIONS" section:

```latex
\DeclareOption{<language>}{
	\def\cookbook@language{<language>}
}
```

### 4. Test your translation

Create a test document using your new language:

```latex
\documentclass[<language>]{cookbook}
\begin{document}
% Your content here
\end{document}
```

Compile with LuaLaTeX and verify all strings appear correctly.

## Translation Strings

Each translation file must define the following strings:

### Recipe Metadata

- `\textRecipes` - "Recipes"
- `\textServes` - "Serves"
- `\textPrep` - "Prep"
- `\textCooking` - "Cooking"
- `\textDifficulty` - "Difficulty"
- `\textOrigin` - "Origin"
- `\textEquipment` - "Equipment"
- `\textIndex` - "Index"

### Conversion Table

- `\textConversionTable` - "Conversion Table"
- `\textVolume` - "Volume"
- `\textWeight` - "Weight"
- `\textTemperature` - "Temperature"
- `\textLength` - "Length"
- `\textOvenTemperatures` - "Oven Temperatures"
- `\textConversionNote` - Note about weighing ingredients
- `\textUSImperial` - "US/Imperial"
- `\textMetric` - "Metric"
- `\textNotes` - "Notes"

### Temperature

- `\textFahrenheit` - "Fahrenheit (°F)"
- `\textCelsius` - "Celsius (°C)"
- `\textUseCase` - "Use Case"
- `\textFormula` - "Formula:"
- `\textFreezingPoint` - "Freezing point of water"
- `\textRoomTemperature` - "Room temperature"
- `\textBodyTemperature` - "Body temperature"
- `\textBoilingPoint` - "Boiling point of water"
- `\textCommonBakingTemp` - "Common baking temperature"
- `\textDefaultOvenTemp` - Note about default oven temperature

### Oven Use Cases

- `\textSlowRoasting` - "Slow roasting, dehydrating"
- `\textSlowCooking` - "Slow cooking, warming"
- `\textDelicateCakes` - "Delicate cakes, cheesecakes"
- `\textCakesCookies` - "Cakes, cookies, casseroles"
- `\textQuickBreads` - "Quick breads, cookies, roasted chicken"
- `\textRoastingVegetables` - "Roasting vegetables, chicken, fish"
- `\textPizzaBread` - "Pizza, crusty bread, searing meat"
- `\textHighHeatRoasting` - "High-heat roasting, charring"

### Measurements

- `\textInches` - "Inches"
- `\textCentimeters` - "Centimeters"
- `\textCommonUse` - "Common Use"
- `\textAdditionalConversions` - "Additional Conversions"
- `\textMeasurement` - "Measurement"
- `\textConversion` - "Conversion"

### Cookware Sizes

- `\textSmallTartPan` - "Small tart pan"
- `\textSmallCakePan` - "Small cake pan"
- `\textStandardCakePan` - "Standard cake pan"
- `\textStandardPiePan` - "Standard pie pan"
- `\textLargeCakePan` - "Large cake pan"
- `\textLargeSkillet` - "Large skillet"
- `\textStandardBakingDish` - "Standard baking dish"

### Common Ingredients

- `\textStickButter` - "1 stick butter"
- `\textCupButter` - "1 cup butter"
- `\textAllPurposeFlour` - "1 cup all-purpose flour"
- `\textGranulatedSugar` - "1 cup granulated sugar"
- `\textBrownSugar` - "1 cup brown sugar (packed)"
- `\textPowderedSugar` - "1 cup powdered sugar"
- `\textChocolateChips` - "1 cup chocolate chips"
- `\textCupMilk` - "1 cup milk"
- `\textCupWater` - "1 cup water"
- `\textCupHoney` - "1 cup honey"
- `\textVegetableOil` - "1 cup vegetable oil"
- `\textLargeEgg` - "1 large egg"
- `\textActiveDryYeast` - "1 packet active dry yeast"

### Units

- `\textTablespoon` - "tablespoon" (singular)
- `\textTablespoons` - "tablespoons" (plural)
- `\textTeaspoon` - "teaspoon" (singular)
- `\textTeaspoons` - "teaspoons" (plural)
- `\textSticksUS` - "sticks (US)"
- `\textCup` - "cup" (singular)
- `\textCups` - "cups" (plural)
- `\textQuart` - "quart" (singular)
- `\textQuarts` - "quarts" (plural)

## Contributing

We welcome translations for new languages! If you'd like to contribute a translation:

1. Follow the steps above to create your translation file
2. Test it thoroughly with sample documents
3. Submit a pull request with your new translation file

Please ensure your translation is accurate and culturally appropriate for the target audience.
