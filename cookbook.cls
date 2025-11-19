%----------------------------------------------------------------------------------------
%   CookBook Template
%   LaTeX Class File
%----------------------------------------------------------------------------------------
%
%   Version:     1.1.0
%   Date:        November 19, 2025
%   Author:      AshDevFr
%   GitHub:      @AshDevFr
%   License:     CC BY-NC-SA 4.0
%
%   A professional LaTeX template for creating beautiful cookbooks
%   and recipe collections with support for multiple languages,
%   custom layouts, and extensive customization options.
%
%----------------------------------------------------------------------------------------


%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CookBook}[2025/11/19 v1.1.0 CookBook Template]

%----------------------------------------------------------------------------------------
%	LANGUAGE OPTIONS
%----------------------------------------------------------------------------------------

\def\cookbook@language{english}

\DeclareOption{english}{
	\def\cookbook@language{english}
}

\DeclareOption{french}{
	\def\cookbook@language{french}
}

% Page layout options
\def\cookbook@leftpage{even}
\def\cookbook@startpage{1}
\def\cookbook@listbefore{0pt}
\def\cookbook@columnsep{0.05\textwidth}
\def\cookbook@ingredientitemsep{0.003\textheight}
\def\cookbook@instructionitemsep{0.005\textheight}

% Bleed configuration
% Default bleed value (0.125in)
% Using only length register - can be used directly in \dimexpr and with \the in TikZ
\newlength{\cookbook@bleedlength}
\setlength{\cookbook@bleedlength}{0.125in}
\def\cookbook@guttermargin{0pt}
\def\cookbook@bleedimageratio{0.5} % Ratio defining how much of images should be in the bleed
% Temporary length registers for bleed calculations
\newlength{\cookbook@tempwidth}
\newlength{\cookbook@tempheight}
\newlength{\cookbook@scaledbleed} % For calculating scaled bleed based on bleedimageratio
\newlength{\cookbook@scaledbleedremainder} % For calculating the remainder of the bleed after the image ratio is applied

% Margin configuration
% Default margins for all sides
\def\cookbook@margintop{1.5cm}
\def\cookbook@marginbottom{1.5cm}
\def\cookbook@marginleft{1.5cm}
\def\cookbook@marginright{1.5cm}

% Boolean flag to track if bleed is enabled
\newif\ifcookbook@bleedenabled
\cookbook@bleedenabledfalse

% Boolean flag to track if bleed debug mode is enabled
\newif\ifcookbook@bleeddebug
\cookbook@bleeddebugfalse

% Left page option (key-value format: left=even or left=odd)
\DeclareOption{left=even}{\def\cookbook@leftpage{even}}
\DeclareOption{left=odd}{\def\cookbook@leftpage{odd}}

% Start page option (key-value format: startpage=1 or startpage=2)
\DeclareOption{startpage=1}{\def\cookbook@startpage{1}}
\DeclareOption{startpage=2}{\def\cookbook@startpage{2}}

% Bleed option (boolean: enables/disables bleed margins for print production)
% When enabled, uses \cookbook@bleedlength value (default: 0.125in)
\DeclareOption{bleed}{\cookbook@bleedenabledtrue}
% Bleed debug option: enables bleed and draws the bleed area boundaries
\DeclareOption{bleed=debug}{%
	\cookbook@bleedenabledtrue
	\cookbook@bleeddebugtrue
}

\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{extbook}%
}

\ProcessOptions\relax

\LoadClass{extbook}

\setcounter{page}{\cookbook@startpage}

\RequirePackage[\cookbook@language]{babel}

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage[dvipsnames, svgnames, table]{xcolor} % Color support for custom color definitions and named colors

\usepackage{etoolbox} % Conditional logic and command modification utilities

\usepackage{emoji} % Color emoji support (requires LuaLaTeX)

\usepackage{setspace} % Line spacing control and adjustment

\usepackage{dashrule} % Dashed line and rule generation

\usepackage{enumitem} % Advanced list formatting and customization options

% Configure list spacing for compact layouts
\setlist{
    nosep,           % Remove all vertical spacing
    leftmargin=*,    % Auto-calculate left margin
    before=\vspace{\cookbook@listbefore}  % Adjust spacing before lists (default: -0.5\baselineskip)
}

% Command to override list spacing before value
% Usage: \setlistbefore{-1\baselineskip} or \setlistbefore{0pt}
\NewDocumentCommand{\setlistbefore}{m}{%
    \def\cookbook@listbefore{#1}%
    \setlist{before=\vspace{\cookbook@listbefore}}%
}

% Command to override column spacing globally
% Usage: \setcolumnsep{0.1\textwidth} or \setcolumnsep{10pt}
\NewDocumentCommand{\setcolumnsep}{m}{%
    \def\cookbook@columnsep{#1}%
    \setlength\columnsep{\cookbook@columnsep}%
}

% Command to override ingredient item spacing globally
% Usage: \setingredientitemsep{0.01\textheight} or \setingredientitemsep{2pt}
\NewDocumentCommand{\setingredientitemsep}{m}{%
    \def\cookbook@ingredientitemsep{#1}%
}

% Command to override instruction item spacing globally
% Usage: \setinstructionitemsep{0.5\baselineskip} or \setinstructionitemsep{4pt}
\NewDocumentCommand{\setinstructionitemsep}{m}{%
    \def\cookbook@instructionitemsep{#1}%
}

\setlength{\parindent}{0pt}

\pagestyle{plain}

\usepackage{paracol} % Multi-column page layouts with synchronized columns
\setlength\columnsep{\cookbook@columnsep} % Spacing between parallel columns

\usepackage{changepage} % Dynamic page margin and text block indentation

\usepackage{fancyhdr} % Customizable headers and footers

\usepackage{eso-pic} % Background images and page decorations

\usepackage{graphicx} % Image inclusion and manipulation

\usepackage{needspace} % Prevent page breaks between titles and content

\usepackage{xkeyval} % Key-value option parsing for commands

\usepackage{xparse} % Enhanced command definition with optional arguments

\usepackage{mfirstuc} % Capitalization utilities for text formatting

\usepackage{imakeidx} % Index generation and management
% Note: \makeindex will be called after all key definitions to avoid conflicts

\usepackage{tabularx} % Flexible-width tables with automatic column sizing
\usepackage{booktabs} % Professional table formatting with improved spacing

%----------------------------------------------------------------------------------------
%	LANGUAGE STRINGS (using babel)
%----------------------------------------------------------------------------------------

% Define custom translations for English
\addto\captionsenglish{%
	\def\textRecipes{Recipes}%
	\def\textServes{Serves}%
	\def\textPrep{Prep}%
	\def\textCooking{Cooking}%
	\def\textDifficulty{Difficulty}%
	\def\textOrigin{Origin}%
	\def\textSpicy{Spicy}%
	\def\textVegetarian{Vegetarian}%
	\def\textIndex{Index}%
	\def\textConversionTable{Conversion Table}%
	\def\textVolume{Volume}%
	\def\textWeight{Weight}%
	\def\textTemperature{Temperature}%
	\def\textLength{Length}%
	\def\textOvenTemperatures{Oven Temperatures}%
	\def\textConversionNote{For best accuracy, weighing ingredients is recommended over volume measurements for baking.}%
	\def\textUSImperial{US/Imperial}%
	\def\textMetric{Metric}%
	\def\textNotes{Notes}%
	\def\textFahrenheit{Fahrenheit (°F)}%
	\def\textCelsius{Celsius (°C)}%
	\def\textUseCase{Use Case}%
	\def\textInches{Inches}%
	\def\textCentimeters{Centimeters}%
	\def\textCommonUse{Common Use}%
	\def\textAdditionalConversions{Additional Conversions}%
	\def\textMeasurement{Measurement}%
	\def\textConversion{Conversion}%
	\def\textFreezingPoint{Freezing point of water}%
	\def\textRoomTemperature{Room temperature}%
	\def\textBodyTemperature{Body temperature}%
	\def\textBoilingPoint{Boiling point of water}%
	\def\textCommonBakingTemp{Common baking temperature}%
	\def\textFormula{Formula:}%
	\def\textSlowRoasting{Slow roasting, dehydrating}%
	\def\textSlowCooking{Slow cooking, warming}%
	\def\textDelicateCakes{Delicate cakes, cheesecakes}%
	\def\textCakesCookies{Cakes, cookies, casseroles}%
	\def\textQuickBreads{Quick breads, cookies, roasted chicken}%
	\def\textRoastingVegetables{Roasting vegetables, chicken, fish}%
	\def\textPizzaBread{Pizza, crusty bread, searing meat}%
	\def\textHighHeatRoasting{High-heat roasting, charring}%
	\def\textDefaultOvenTemp{Most recipes default to 350°F unless otherwise specified.}%
	\def\textSmallTartPan{Small tart pan}%
	\def\textSmallCakePan{Small cake pan}%
	\def\textStandardCakePan{Standard cake pan}%
	\def\textStandardPiePan{Standard pie pan}%
	\def\textLargeCakePan{Large cake pan}%
	\def\textLargeSkillet{Large skillet}%
	\def\textStandardBakingDish{Standard baking dish}%
	\def\textStickButter{1 stick butter}%
	\def\textCupButter{1 cup butter}%
	\def\textAllPurposeFlour{1 cup all-purpose flour}%
	\def\textGranulatedSugar{1 cup granulated sugar}%
	\def\textBrownSugar{1 cup brown sugar (packed)}%
	\def\textPowderedSugar{1 cup powdered sugar}%
	\def\textChocolateChips{1 cup chocolate chips}%
	\def\textCupMilk{1 cup milk}%
	\def\textCupWater{1 cup water}%
	\def\textCupHoney{1 cup honey}%
	\def\textVegetableOil{1 cup vegetable oil}%
	\def\textLargeEgg{1 large egg}%
	\def\textActiveDryYeast{1 packet active dry yeast}%
	\def\textTablespoon{tablespoon}%
	\def\textTablespoons{tablespoons}%
	\def\textTeaspoon{teaspoon}%
	\def\textTeaspoons{teaspoons}%
	\def\textSticksUS{sticks (US)}%
	\def\textCup{cup}%
	\def\textCups{cups}%
	\def\textQuart{quart}%
	\def\textQuarts{quarts}%
}

% Define custom translations for French
\addto\captionsfrench{%
	\def\textRecipes{Recettes}%
	\def\textServes{Portions}%
	\def\textPrep{Préparation}%
	\def\textCooking{Cuisson}%
	\def\textDifficulty{Difficulté}%
	\def\textOrigin{Origine}%
	\def\textSpicy{Épicé}%
	\def\textVegetarian{Végétarien}%
	\def\textIndex{Index}%
	\def\textConversionTable{Table de Conversion}%
	\def\textVolume{Volume}%
	\def\textWeight{Poids}%
	\def\textTemperature{Température}%
	\def\textLength{Longueur}%
	\def\textOvenTemperatures{Températures du Four}%
	\def\textConversionNote{Pour une meilleure précision, il est recommandé de peser les ingrédients plutôt que d'utiliser des mesures de volume pour la pâtisserie.}%
	\def\textUSImperial{US/Impérial}%
	\def\textMetric{Métrique}%
	\def\textNotes{Notes}%
	\def\textFahrenheit{Fahrenheit (°F)}%
	\def\textCelsius{Celsius (°C)}%
	\def\textUseCase{Utilisation}%
	\def\textInches{Pouces}%
	\def\textCentimeters{Centimètres}%
	\def\textCommonUse{Usage Courant}%
	\def\textAdditionalConversions{Conversions Supplémentaires}%
	\def\textMeasurement{Mesure}%
	\def\textConversion{Conversion}%
	\def\textFreezingPoint{Point de congélation de l'eau}%
	\def\textRoomTemperature{Température ambiante}%
	\def\textBodyTemperature{Température corporelle}%
	\def\textBoilingPoint{Point d'ébullition de l'eau}%
	\def\textCommonBakingTemp{Température de cuisson courante}%
	\def\textFormula{Formule :}%
	\def\textSlowRoasting{Rôtissage lent, déshydratation}%
	\def\textSlowCooking{Cuisson lente, réchauffage}%
	\def\textDelicateCakes{Gâteaux délicats, cheesecakes}%
	\def\textCakesCookies{Gâteaux, biscuits, plats en cocotte}%
	\def\textQuickBreads{Pains rapides, biscuits, poulet rôti}%
	\def\textRoastingVegetables{Rôtissage de légumes, poulet, poisson}%
	\def\textPizzaBread{Pizza, pain croustillant, saisie de viande}%
	\def\textHighHeatRoasting{Rôtissage à haute température, carbonisation}%
	\def\textDefaultOvenTemp{La plupart des recettes utilisent 350°F par défaut sauf indication contraire.}%
	\def\textSmallTartPan{Petit moule à tarte}%
	\def\textSmallCakePan{Petit moule à gâteau}%
	\def\textStandardCakePan{Moule à gâteau standard}%
	\def\textStandardPiePan{Moule à tarte standard}%
	\def\textLargeCakePan{Grand moule à gâteau}%
	\def\textLargeSkillet{Grande poêle}%
	\def\textStandardBakingDish{Plat de cuisson standard}%
	\def\textStickButter{1 bâton de beurre}%
	\def\textCupButter{1 cup de beurre}%
	\def\textAllPurposeFlour{1 cup de farine tout usage}%
	\def\textGranulatedSugar{1 cup de sucre granulé}%
	\def\textBrownSugar{1 cup de sucre brun (tassé)}%
	\def\textPowderedSugar{1 cup de sucre en poudre}%
	\def\textChocolateChips{1 cup de pépites de chocolat}%
	\def\textCupMilk{1 cup de lait}%
	\def\textCupWater{1 cup d'eau}%
	\def\textCupHoney{1 cup de miel}%
	\def\textVegetableOil{1 cup d'huile végétale}%
	\def\textLargeEgg{1 gros œuf}%
	\def\textActiveDryYeast{1 sachet de levure sèche active}%
	\def\textTablespoon{cuillère à soupe}%
	\def\textTablespoons{cuillères à soupe}%
	\def\textTeaspoon{cuillère à café}%
	\def\textTeaspoons{cuillères à café}%
	\def\textSticksUS{bâtons (US)}%
	\def\textCup{cup}%
	\def\textCups{cups}%
	\def\textQuart{quart}%
	\def\textQuarts{quarts}%
}

% Allow users to override any translation
\NewDocumentCommand{\setTextRecipes}{m}{\def\textRecipes{#1}}
\NewDocumentCommand{\setTextServes}{m}{\def\textServes{#1}}
\NewDocumentCommand{\setTextPrep}{m}{\def\textPrep{#1}}
\NewDocumentCommand{\setTextCooking}{m}{\def\textCooking{#1}}
\NewDocumentCommand{\setTextDifficulty}{m}{\def\textDifficulty{#1}}
\NewDocumentCommand{\setTextOrigin}{m}{\def\textOrigin{#1}}
\NewDocumentCommand{\setTextSpicy}{m}{\def\textSpicy{#1}}
\NewDocumentCommand{\setTextVegetarian}{m}{\def\textVegetarian{#1}}
\NewDocumentCommand{\setTextIndex}{m}{\def\textIndex{#1}}
\NewDocumentCommand{\setTextConversionTable}{m}{\def\textConversionTable{#1}}
\NewDocumentCommand{\setTextVolume}{m}{\def\textVolume{#1}}
\NewDocumentCommand{\setTextWeight}{m}{\def\textWeight{#1}}
\NewDocumentCommand{\setTextTemperature}{m}{\def\textTemperature{#1}}
\NewDocumentCommand{\setTextLength}{m}{\def\textLength{#1}}
\NewDocumentCommand{\setTextOvenTemperatures}{m}{\def\textOvenTemperatures{#1}}
\NewDocumentCommand{\setTextUSImperial}{m}{\def\textUSImperial{#1}}
\NewDocumentCommand{\setTextMetric}{m}{\def\textMetric{#1}}
\NewDocumentCommand{\setTextNotes}{m}{\def\textNotes{#1}}
\NewDocumentCommand{\setTextFahrenheit}{m}{\def\textFahrenheit{#1}}
\NewDocumentCommand{\setTextCelsius}{m}{\def\textCelsius{#1}}
\NewDocumentCommand{\setTextUseCase}{m}{\def\textUseCase{#1}}
\NewDocumentCommand{\setTextInches}{m}{\def\textInches{#1}}
\NewDocumentCommand{\setTextCentimeters}{m}{\def\textCentimeters{#1}}
\NewDocumentCommand{\setTextCommonUse}{m}{\def\textCommonUse{#1}}
\NewDocumentCommand{\setTextAdditionalConversions}{m}{\def\textAdditionalConversions{#1}}
\NewDocumentCommand{\setTextMeasurement}{m}{\def\textMeasurement{#1}}
\NewDocumentCommand{\setTextConversion}{m}{\def\textConversion{#1}}
\NewDocumentCommand{\setTextFreezingPoint}{m}{\def\textFreezingPoint{#1}}
\NewDocumentCommand{\setTextRoomTemperature}{m}{\def\textRoomTemperature{#1}}
\NewDocumentCommand{\setTextBodyTemperature}{m}{\def\textBodyTemperature{#1}}
\NewDocumentCommand{\setTextBoilingPoint}{m}{\def\textBoilingPoint{#1}}
\NewDocumentCommand{\setTextCommonBakingTemp}{m}{\def\textCommonBakingTemp{#1}}
\NewDocumentCommand{\setTextFormula}{m}{\def\textFormula{#1}}
\NewDocumentCommand{\setTextSlowRoasting}{m}{\def\textSlowRoasting{#1}}
\NewDocumentCommand{\setTextSlowCooking}{m}{\def\textSlowCooking{#1}}
\NewDocumentCommand{\setTextDelicateCakes}{m}{\def\textDelicateCakes{#1}}
\NewDocumentCommand{\setTextCakesCookies}{m}{\def\textCakesCookies{#1}}
\NewDocumentCommand{\setTextQuickBreads}{m}{\def\textQuickBreads{#1}}
\NewDocumentCommand{\setTextRoastingVegetables}{m}{\def\textRoastingVegetables{#1}}
\NewDocumentCommand{\setTextPizzaBread}{m}{\def\textPizzaBread{#1}}
\NewDocumentCommand{\setTextHighHeatRoasting}{m}{\def\textHighHeatRoasting{#1}}
\NewDocumentCommand{\setTextDefaultOvenTemp}{m}{\def\textDefaultOvenTemp{#1}}
\NewDocumentCommand{\setTextSmallTartPan}{m}{\def\textSmallTartPan{#1}}
\NewDocumentCommand{\setTextSmallCakePan}{m}{\def\textSmallCakePan{#1}}
\NewDocumentCommand{\setTextStandardCakePan}{m}{\def\textStandardCakePan{#1}}
\NewDocumentCommand{\setTextStandardPiePan}{m}{\def\textStandardPiePan{#1}}
\NewDocumentCommand{\setTextLargeCakePan}{m}{\def\textLargeCakePan{#1}}
\NewDocumentCommand{\setTextLargeSkillet}{m}{\def\textLargeSkillet{#1}}
\NewDocumentCommand{\setTextStandardBakingDish}{m}{\def\textStandardBakingDish{#1}}
\NewDocumentCommand{\setTextStickButter}{m}{\def\textStickButter{#1}}
\NewDocumentCommand{\setTextCupButter}{m}{\def\textCupButter{#1}}
\NewDocumentCommand{\setTextAllPurposeFlour}{m}{\def\textAllPurposeFlour{#1}}
\NewDocumentCommand{\setTextGranulatedSugar}{m}{\def\textGranulatedSugar{#1}}
\NewDocumentCommand{\setTextBrownSugar}{m}{\def\textBrownSugar{#1}}
\NewDocumentCommand{\setTextPowderedSugar}{m}{\def\textPowderedSugar{#1}}
\NewDocumentCommand{\setTextChocolateChips}{m}{\def\textChocolateChips{#1}}
\NewDocumentCommand{\setTextCupMilk}{m}{\def\textCupMilk{#1}}
\NewDocumentCommand{\setTextCupWater}{m}{\def\textCupWater{#1}}
\NewDocumentCommand{\setTextCupHoney}{m}{\def\textCupHoney{#1}}
\NewDocumentCommand{\setTextVegetableOil}{m}{\def\textVegetableOil{#1}}
\NewDocumentCommand{\setTextLargeEgg}{m}{\def\textLargeEgg{#1}}
\NewDocumentCommand{\setTextActiveDryYeast}{m}{\def\textActiveDryYeast{#1}}
\NewDocumentCommand{\setTextSticksUS}{m}{\def\textSticksUS{#1}}
\NewDocumentCommand{\setTextTablespoon}{m}{\def\textTablespoon{#1}}
\NewDocumentCommand{\setTextTablespoons}{m}{\def\textTablespoons{#1}}
\NewDocumentCommand{\setTextTeaspoon}{m}{\def\textTeaspoon{#1}}
\NewDocumentCommand{\setTextTeaspoons}{m}{\def\textTeaspoons{#1}}
\NewDocumentCommand{\setTextCup}{m}{\def\textCup{#1}}
\NewDocumentCommand{\setTextCups}{m}{\def\textCups{#1}}
\NewDocumentCommand{\setTextQuart}{m}{\def\textQuart{#1}}
\NewDocumentCommand{\setTextQuarts}{m}{\def\textQuarts{#1}}

%----------------------------------------------------------------------------------------
%	MARGINS AND BLEED
%----------------------------------------------------------------------------------------

% Commands to override margin values (call after \documentclass)
% Usage: \setmargintop{2cm}, \setmarginbottom{2cm}, \setmarginleft{2cm}, \setmarginright{2cm}
\NewDocumentCommand{\setmargintop}{m}{%
	\def\cookbook@margintop{#1}%
	\geometry{top=#1}%
}
\NewDocumentCommand{\setmarginbottom}{m}{%
	\def\cookbook@marginbottom{#1}%
	\geometry{bottom=#1}%
}
\NewDocumentCommand{\setmarginleft}{m}{%
	\def\cookbook@marginleft{#1}%
	\if@twoside
		\geometry{inner=#1}%
	\else
		\geometry{left=#1}%
	\fi
}
\NewDocumentCommand{\setmarginright}{m}{%
	\def\cookbook@marginright{#1}%
	\if@twoside
		\geometry{outer=#1}%
	\else
		\geometry{right=#1}%
	\fi
}

% Store original paper dimensions before bleed is applied
\newlength{\cookbook@origpaperwidth}
\newlength{\cookbook@origpaperheight}

% Helper command to apply bleed geometry adjustments
\NewDocumentCommand{\cookbook@applybleedgeometry}{}{%
	% FIRST: Store original paper dimensions BEFORE any changes
	\setlength{\cookbook@origpaperwidth}{\paperwidth}%
	\setlength{\cookbook@origpaperheight}{\paperheight}%

	% Calculate new paper dimensions
	\setlength{\cookbook@tempwidth}{\dimexpr\paperwidth+2\cookbook@bleedlength\relax}%
	\setlength{\cookbook@tempheight}{\dimexpr\paperheight+2\cookbook@bleedlength\relax}%
	% Expand dimension values to strings
	\edef\cookbook@paperwidthval{\the\cookbook@tempwidth}%
	\edef\cookbook@paperheightval{\the\cookbook@tempheight}%
	% Calculate new margins that include bleed
	\edef\cookbook@leftwithbleed{\the\dimexpr\cookbook@marginleft+\cookbook@bleedlength\relax}%
	\edef\cookbook@rightwithbleed{\the\dimexpr\cookbook@marginright+\cookbook@bleedlength\relax}%
	\edef\cookbook@topwithbleed{\the\dimexpr\cookbook@margintop+\cookbook@bleedlength\relax}%
	\edef\cookbook@bottomwithbleed{\the\dimexpr\cookbook@marginbottom+\cookbook@bleedlength\relax}%
	\if@twoside
		% For twoside documents, use inner/outer
		\geometry{
			paperwidth=\cookbook@paperwidthval,
			paperheight=\cookbook@paperheightval,
			inner=\cookbook@leftwithbleed,
			outer=\cookbook@rightwithbleed,
			top=\cookbook@topwithbleed,
			bottom=\cookbook@bottomwithbleed,
		}%
	\else
		% For oneside documents, use left/right
		\geometry{
			paperwidth=\cookbook@paperwidthval,
			paperheight=\cookbook@paperheightval,
			left=\cookbook@leftwithbleed,
			right=\cookbook@rightwithbleed,
			top=\cookbook@topwithbleed,
			bottom=\cookbook@bottomwithbleed,
		}%
	\fi
}

% Helper command to calculate and set bleed extension
% This centralizes the bleed extension calculation
\NewDocumentCommand{\cookbook@updatebleedextension}{}{%
	\ifcookbook@bleedenabled
		% With bleed: extend by margin + bleed to reach the paper edge
		\setlength{\cookbook@bleedextension}{\dimexpr-\cookbook@margintop-\cookbook@bleedlength\relax}%
	\else
		\setlength{\cookbook@bleedextension}{-\cookbook@margintop}%
	\fi
}

% Helper macros to get effective paper dimensions for content positioning
% When bleed is enabled, use original paper dimensions for positioning
% When disabled, use current paper dimensions
\NewDocumentCommand{\cookbook@contentpaperwidth}{}{%
	\ifcookbook@bleedenabled
		\cookbook@origpaperwidth
	\else
		\paperwidth
	\fi
}

\NewDocumentCommand{\cookbook@contentpaperheight}{}{%
	\ifcookbook@bleedenabled
		\cookbook@origpaperheight
	\else
		\paperheight
	\fi
}

% Command to override the bleed value (call after \documentclass)
% Usage: \setbleedvalue{0.125in} or \setbleedvalue{3.175mm}
% This sets the bleed amount that will be used when bleed is enabled
\NewDocumentCommand{\setbleedvalue}{m}{%
	% Update the length register
	\setlength{\cookbook@bleedlength}{#1}%
	% Update scaled bleed
	\cookbook@updatescaledbleed
	% If bleed is already enabled, recalculate geometry with new bleed value
	\ifcookbook@bleedenabled
		\cookbook@applybleedgeometry
		\cookbook@updatebleedextension
	\fi
}

% Command to enable bleed and optionally set a custom value
% Usage: \enablebleed or \enablebleed{0.125in}
\NewDocumentCommand{\enablebleed}{O{}}{%
	\cookbook@bleedenabledtrue%
	\ifx#1\@empty\else
		% Update the length register
		\setlength{\cookbook@bleedlength}{#1}%
	\fi
	% Update scaled bleed
	\cookbook@updatescaledbleed
	% Apply bleed to geometry
	\cookbook@applybleedgeometry
	\cookbook@updatebleedextension
}

% Calculate bleed extension for edge content (negative margin adjustment)
\newlength{\cookbook@bleedextension}
\setlength{\cookbook@bleedextension}{0pt}

% Command to set gutter margin (for print binding)
% Usage: \setguttermargin{0.5in} or \setguttermargin{1.25cm}
% Adds the specified value to the inner margin for binding (left on right pages, right on left pages)
% Note: Gutter is only for two-sided printing, so it always uses inner margin
\NewDocumentCommand{\setguttermargin}{m}{%
	\def\cookbook@guttermargin{#1}%
	\geometry{inner=\dimexpr\cookbook@marginleft+\cookbook@guttermargin\relax}%
}

% Command to set bleed image ratio
% Usage: \setbleedimageratio{1} or \setbleedimageratio{0.5}
% Defines how much of the images should be in the bleed (1 = full bleed, 0.5 = half bleed, etc.)
\NewDocumentCommand{\setbleedimageratio}{m}{%
	\def\cookbook@bleedimageratio{#1}%
	% Update scaled bleed
	\cookbook@updatescaledbleed
}

% Set up geometry - load first, then adjust for bleed if needed
% This approach allows us to reference \paperwidth and \paperheight after they're set
% Use inner/outer for twoside documents, left/right for oneside documents
\if@twoside
	\usepackage[
		top=\cookbook@margintop,
		bottom=\cookbook@marginbottom,
		inner=\cookbook@marginleft,
		outer=\cookbook@marginright,
		%showframe % Enable to display margin boundaries for layout debugging
	]{geometry}
\else
	\usepackage[
		top=\cookbook@margintop,
		bottom=\cookbook@marginbottom,
		left=\cookbook@marginleft,
		right=\cookbook@marginright,
		%showframe % Enable to display margin boundaries for layout debugging
	]{geometry}
\fi

% Apply bleed adjustments if enabled
% When bleed is enabled, we:
% 1. Increase paper size by 2*bleed (bleed on each side)
% 2. Shift content area by bleed amount (hoffset/voffset)
% 3. Maintain text margins (these become safety margins from trim edge)
\ifcookbook@bleedenabled
	% Adjust geometry for bleed - now we can reference \paperwidth and \paperheight
	\cookbook@applybleedgeometry
\fi
% Set bleed extension for edge content (works for both enabled and disabled states)
\cookbook@updatebleedextension

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Modern font selection for LuaLaTeX/XeLaTeX
\usepackage{unicode-math} % Unicode math support

\setmainfont{TeX Gyre Pagella} % Palatino-like font with full Unicode support
\setmathfont{TeX Gyre Pagella Math} % Matching math font

% Source Sans Pro font command (using system sans-serif as fallback)
\NewDocumentCommand{\sourcesanspro}{+m}{{\sffamily\selectfont #1}}

\usepackage{microtype} % Improve typography

\usepackage{titlesec} % Format titles
\usepackage{tocloft} % Customize Table of Contents, List of Figures, and List of Tables

%----------------------------------------------------------------------------------------
%	CUSTOM GRAPHICS
%----------------------------------------------------------------------------------------

\usepackage{tikz} % Vector graphics and diagram creation
\usetikzlibrary{calc} % Coordinate calculations and transformations
\usetikzlibrary{shadows} % Drop shadows and shadow effects for shapes
\usetikzlibrary{backgrounds} % Background layers for layered graphics

% Helper command to update scaled bleed whenever bleedlength or bleedimageratio changes
\NewDocumentCommand{\cookbook@updatescaledbleed}{}{%
    \pgfmathsetlength{\cookbook@scaledbleed}{\cookbook@bleedlength * (1 - \cookbook@bleedimageratio)}%
	\pgfmathsetlength{\cookbook@scaledbleedremainder}{\cookbook@bleedlength - \cookbook@scaledbleed}%
}

% Initialize scaled bleed with default values
\cookbook@updatescaledbleed

\usepackage{tikzfill} % Fill shapes with images and patterns

\NewDocumentCommand{\circled}{O{1.5pt} O{black} O{white} O{0ex} m}{%
	% #1 = inner padding (default: 1.5pt)
	% #2 = fill color (default: black)
	% #3 = text color (default: white)
	% #4 = vertical offset (default: 0ex)
	% #5 = content to display
	\raisebox{#4}{%
		\tikz[baseline=(char.base)]{%
			\node[
				shape=circle,
				draw,
				inner sep=#1,
				fill=#2,
				text=#3,
				minimum width=1.2em,
				minimum height=1.2em,
				anchor=base
			] (char) {%
				\footnotesize\bfseries\sffamily #5%
			};%
		}%
	}%
}

\NewDocumentCommand{\circledinstruction}{m}{%
	\circled[1.5pt][black][white][0.2ex]{#1}
}

\usepackage{tcolorbox} % Colored boxes with advanced styling options
\usepackage{xstring} % String manipulation and trimming utilities
\tcbset{on line, boxsep=1pt,left=1.5pt,right=1.5pt,top=1.5pt,bottom=1.5pt,colframe=Grey,valign=center,halign=center} % Custom badge tcolorbox with centered alignment
\NewDocumentCommand{\tbadge}{m}{\StrSubstitute{#1}{ }{}[\trimmedtext]\tcbox[grow to right by=-1pt,tcbox raise base]{\small\vphantom{Ag}\capitalisewords{\ignorespaces#1\unskip}}} % Custom command for smaller badges with fixed height and trimmed spaces

% Index entry processing with string normalization
% This command processes index entries to ensure consistency:
% 1. Removes extra spaces using \zap@space (LaTeX's space removal macro)
% 2. Converts to uppercase for uniform sorting
% 3. Uses expansion control (\edef, \expandafter) to ensure proper text processing
%
% The \begingroup/\endgroup ensures processing doesn't affect other commands.
% This is critical because index entries may contain inconsistent spacing from user input,
% and LaTeX's index sorting requires consistent formatting.
\NewDocumentCommand{\indexentry}{m}{%
    \begingroup
    \edef\temptext{\zap@space#1 \@empty}% Remove extra spaces
    \edef\temptext{\expandafter\MakeUppercase\temptext}% Capitalize (if using standard LaTeX)
    \expandafter\index\expandafter{\temptext}%
    \endgroup
}

% Configurable emoji values for recipe indicators
% These are simple string values, so we use \def for proper expansion in \emoji{}
\def\spicyemoji{hot-pepper} % Default emoji name for spicy recipes
\def\vegetarianemoji{seedling} % Default emoji name for vegetarian recipes

% Commands to customize emoji icons globally
\NewDocumentCommand{\setspicyemoji}{m}{\def\spicyemoji{#1}}
\NewDocumentCommand{\setvegetarianemoji}{m}{\def\vegetarianemoji{#1}}

% Define icon commands that render emojis at appropriate size
\NewDocumentCommand{\spicyicon}{}{{\fontsize{18pt}{20pt}\selectfont\emoji{\spicyemoji}}}
\NewDocumentCommand{\vegetarianicon}{}{{\fontsize{18pt}{20pt}\selectfont\emoji{\vegetarianemoji}}}

% Define custom TikZ layers for proper rendering order
\pgfdeclarelayer{foreground} % Top layer for page numbers and overlays
\pgfdeclarelayer{images} % Layer for background images
\pgfsetlayers{background,main,images,foreground} % Set layer rendering order

%----------------------------------------------------------------------------------------
%	CUSTOM PAGE STYLES
%----------------------------------------------------------------------------------------

% Define length for page number box minimum height (defined once, used in \pagenumberbox)
\newlength{\pagenumberbox@textheight}
\newlength{\pagenumberbox@minimumheight}

\NewDocumentCommand{\pagenumberbox}{m m}{%
	\begin{tikzpicture}[remember picture, overlay]
		\begin{pgfonlayer}{foreground}
			\begin{scope}
				\ifcookbook@bleedenabled
					\setlength{\pagenumberbox@minimumheight}{\dimexpr1.5cm+\cookbook@bleedlength\relax}
					\setlength{\pagenumberbox@textheight}{\dimexpr1.2cm+\cookbook@bleedlength\relax}
				\else
					\setlength{\pagenumberbox@minimumheight}{1.5cm}
					\setlength{\pagenumberbox@textheight}{1.2cm}
				\fi
				\node[
					text height=\pagenumberbox@textheight,
					text depth=0.2cm,
					draw,
					fill=black,
					text=white,
					rectangle,
					minimum width=0.8cm,
					minimum height=\pagenumberbox@minimumheight,
					anchor=#1
				] at (#2) {\thepage};
			\end{scope}
		\end{pgfonlayer}
	\end{tikzpicture}%
}

\fancypagestyle{custompagestyle}{
	\fancyhf{} % Clear all header and footer fields
	\renewcommand{\headrulewidth}{0pt} % Remove the line at the top of the header
}

% Flag to track if page numbers should be suppressed
\newif\ifnopagenumberstyle
\nopagenumberstylefalse

% Helper macros to check if current page is left or right based on cookbook@leftpage setting
% These create conditional flags that can be used with \ifcookbook@isleftpage and \ifcookbook@isrightpage
\newif\ifcookbook@isleftpage
\newif\ifcookbook@isrightpage

% This command determines whether the current page is a "left" or "right" page based on:
% 1. The user's configuration (left=even or left=odd)
% 2. The actual page number (odd or even)
%
% The logic works as follows:
% - If left=even: Even page numbers (2, 4, 6...) are left pages, odd (1, 3, 5...) are right
% - If left=odd: Odd page numbers (1, 3, 5...) are left pages, even (2, 4, 6...) are right
%
% This is essential for proper page number placement and chapter/image positioning
% in two-page spreads, as different book conventions use different page numbering schemes.
\NewDocumentCommand{\cookbook@checkpageparity}{}{%
	\def\cookbook@tempeven{even}%
	\ifx\cookbook@leftpage\cookbook@tempeven
		% Left pages are even (standard book convention)
		\ifodd\value{page}%
			% Current page is odd → it's a right page
			\cookbook@isleftpagefalse
			\cookbook@isrightpagetrue
		\else
			% Current page is even → it's a left page
			\cookbook@isleftpagetrue
			\cookbook@isrightpagefalse
		\fi
	\else
		% Left pages are odd (alternative convention)
		\ifodd\value{page}%
			% Current page is odd → it's a left page
			\cookbook@isleftpagetrue
			\cookbook@isrightpagefalse
		\else
			% Current page is even → it's a right page
			\cookbook@isleftpagefalse
			\cookbook@isrightpagetrue
		\fi
	\fi
}

\AddToShipoutPictureFG{%
	\ifnum\value{page}>0
		% Draw bleed area boundaries if debug mode is enabled
		\ifcookbook@bleeddebug
			\begin{tikzpicture}[remember picture, overlay]
				\ifcookbook@bleedenabled
					% With margin-based bleed, current page = full PDF paper (including bleed)

					% BLUE SOLID LINE = Bleed edge (actual PDF paper boundary)
					\draw[blue, solid, line width=1pt]
						(current page.south west) rectangle (current page.north east);

					% RED DASHED LINE = Trim edge (where page will be cut, inset by bleed amount)
					\draw[red, dashed, line width=1pt]
						([xshift=\the\cookbook@bleedlength, yshift=\the\cookbook@bleedlength]current page.south west)
						rectangle
						([xshift=-\the\cookbook@bleedlength, yshift=-\the\cookbook@bleedlength]current page.north east);
				\else
					% When bleed is disabled, current page is the trim edge
					\draw[red, dashed, line width=1pt]
						(current page.south west) rectangle (current page.north east);
				\fi
			\end{tikzpicture}%
		\fi
		\ifnopagenumberstyle\else
			\cookbook@checkpageparity
			\ifcookbook@isrightpage
				% Right page - number on the right
				\ifcookbook@bleedenabled
					\pagenumberbox{north east}{[xshift=-1cm-\the\cookbook@bleedlength, yshift=0.5cm]current page.north east}%
				\else
					\pagenumberbox{north east}{[xshift=-1cm, yshift=0.5cm]current page.north east}%
				\fi
			\else
				% Left page - number on the left
				\ifcookbook@bleedenabled
					\pagenumberbox{north west}{[xshift=1cm+\the\cookbook@bleedlength, yshift=0.5cm]current page.north west}%
				\else
					\pagenumberbox{north west}{[xshift=1cm, yshift=0.5cm]current page.north west}%
				\fi
			\fi
		\fi
	\fi
}

\pagestyle{custompagestyle}

%----------------------------------------------------------------------------------------
%	CUSTOM COLORS
%----------------------------------------------------------------------------------------

% Define custom color palette for the cookbook template
\definecolor{darkgrey}{HTML}{1a1a1a} % Dark grey for text and accents
\definecolor{lightgrey}{HTML}{808080} % Light grey for separators and subtle elements
\definecolor{paleorange}{HTML}{eb984e} % Pale orange accent color


%----------------------------------------------------------------------------------------
%	TEXT STYLING COMMANDS
%----------------------------------------------------------------------------------------

% Recipe tag command for displaying category badges
\NewDocumentCommand{\recipeTag}{m}{\tbadge{#1}\hspace{0.2em}}

% Flag to track first ingredient section for spacing control
\newif\iffirstingredientsection
\NewDocumentCommand{\ingredientsection}{m}{%
	\item[]
	\iffirstingredientsection%
		\firstingredientsectionfalse%
	\else%
		\vspace{0.01\textheight}%
	\fi%
	{\bfseries{#1}}\par\vspace{0.005\textheight}%
} % Format ingredient section headers with spacing

\NewDocumentCommand{\ingredient}{m}{
	\iffirstingredientsection%
		\firstingredientsectionfalse%
	\fi%
	\item
	{\textit{\small #1}}%
} % Format individual recipe ingredient entries

\newif\iffirstinstructionsection
\NewDocumentCommand{\instructionsection}{m}{
	\item[]
	\iffirstinstructionsection%
		\firstinstructionsectionfalse%
	\else%
		\vspace{0.01\textheight}%
	\fi%
	\begin{center}
		\raisebox{0.25\baselineskip}{\rule{5pt}{0.5pt}}
		{\hspace{0.5em}\bfseries{#1}\hspace{0.5em}}
		\raisebox{0.25\baselineskip}{\rule{5pt}{0.5pt}}
	\end{center}
	\par\vspace{0.005\textheight}
} % Format instruction section headers within recipe steps

\NewDocumentCommand{\instruction}{O{-2pt} m}{%
	% #1 = horizontal adjustment (default: -2pt for tighter spacing)
	% #2 = instruction text content
	\item
	\hspace{#1}%
	{#2}%
}

% Recipe separator with customizable appearance
% #1 = line width (default: 0.5pt)
% #2 = dash pattern spacing (default: 1pt)
% #3 = color (default: lightgrey)
\NewDocumentCommand{\recipeSeparator}{O{0.5pt} O{1pt} O{lightgrey}}{%
    \par\vspace{0.3\baselineskip}%
    \begin{tikzpicture}[baseline={(current bounding box.center)}]
        \draw[#3, dash pattern=on #2 off #2, line width=#1]
            (0,0) -- (\textwidth,0);
    \end{tikzpicture}%
    \par\vspace{0.3\baselineskip}%
}

%----------------------------------------------------------------------------------------
%	COVER PAGE COMMAND
%----------------------------------------------------------------------------------------

% Cover page parameters
\define@key{cover}{title}{\def\cover@title{#1}}
\define@key{cover}{titlefontsize}{\def\cover@titlefontsize{#1}}
\define@key{cover}{subtitle}{\def\cover@subtitle{#1}}
\define@key{cover}{subtitlefontsize}{\def\cover@subtitlefontsize{#1}}
\define@key{cover}{author}{\def\cover@author{#1}}
\define@key{cover}{authorfontsize}{\def\cover@authorfontsize{#1}}
\define@key{cover}{textcolor}{\def\cover@textcolor{#1}}
\define@key{cover}{shadowcolor}{\def\cover@shadowcolor{#1}}
\define@key{cover}{shadowoffset}{\def\cover@shadowoffset{#1}}
\define@key{cover}{image}{\def\cover@image{#1}}
\define@key{cover}{opacity}{\def\cover@opacity{#1}}
\define@key{cover}{bgcolor}{\def\cover@bgcolor{#1}}

% Cover page commands
\NewDocumentCommand{\cover@init}{}{%
	\def\cover@title{}
	\def\cover@titlefontsize{\fontsize{48pt}{52pt}}
	\def\cover@subtitle{}
	\def\cover@subtitlefontsize{\fontsize{28pt}{30pt}}
	\def\cover@author{}
	\def\cover@authorfontsize{\fontsize{20pt}{22pt}}
	\def\cover@textcolor{darkgrey}
	\def\cover@shadowcolor{black}
	\def\cover@shadowoffset{0.05cm}
	\def\cover@image{}
	\def\cover@opacity{1}
	\def\cover@bgcolor{}
}


% Create a cover page
\NewDocumentCommand{\makecoverpage}{+m}{%
	% Initialize cover properties with defaults
	\cover@init

	% Process the key-value pairs
	\setkeys{cover}{#1}

	% Set flag to suppress page numbers on cover page
	\nopagenumberstyletrue

	% Set page counter before titlepage to ensure hyperref tracks it correctly
	\setcounter{page}{\cookbook@startpage}
	\phantomsection
	\label{coverpage}
	\begin{titlepage}
		\thispagestyle{empty}
		\noindent
		\begin{adjustwidth}{\cookbook@bleedextension}{\cookbook@bleedextension}% Extend to page edges including bleed
			\begin{tikzpicture}[remember picture, overlay]
				% Background color
				\ifx\cover@bgcolor\@empty\else
					\fill[\cover@bgcolor]
					(current page.south west) rectangle (current page.north east);
				\fi

				% Add cover image if provided
				\ifx\cover@image\@empty\else
					\begin{scope}
						% Extend image into bleed area
						\ifcookbook@bleedenabled
							\clip ([xshift=\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]current page.south west) rectangle ([xshift=-\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north east);
							\path[fill overzoom image={\cover@image},fill image opacity={\cover@opacity}]
								($(current page.south west)+(\the\cookbook@scaledbleed,\the\cookbook@scaledbleed)$)
								rectangle
								($(current page.north east)-(\the\cookbook@scaledbleed,\the\cookbook@scaledbleed)$);
						\else
							\clip (current page.south west) rectangle (current page.north east);
							\path[fill overzoom image={\cover@image},fill image opacity={\cover@opacity}]
								(current page.south west)
								rectangle
								(current page.north east);
						\fi
					\end{scope}
				\fi

			% Add title and subtitle with drop shadow for visibility
			% First draw the shadow (offset behind the text)
			\node[text=\cover@shadowcolor, font=\sourcesanspro\bfseries,
				align=center] at ($(current page.center)+(\cover@shadowoffset,-\cover@shadowoffset)$) {
				{\cover@titlefontsize\selectfont\MakeUppercase{\cover@title}}
				\\[20pt]
				\ifx\cover@subtitle\@empty
				\\[10pt]
				\else
				{\cover@subtitlefontsize\selectfont\cover@subtitle}
				\\[20pt]
				\fi
				{\cover@authorfontsize\selectfont\cover@author}
			};
			% Then draw the actual text on top
			\node[text=\cover@textcolor, font=\sourcesanspro\bfseries,
				align=center] at (current page.center) {
				{\cover@titlefontsize\selectfont\MakeUppercase{\cover@title}}
				\\[20pt]
				\ifx\cover@subtitle\@empty
				\\[10pt]
				\else
				{\cover@subtitlefontsize\selectfont\cover@subtitle}
				\\[20pt]
				\fi
				{\cover@authorfontsize\selectfont\cover@author}
			};
		\end{tikzpicture}
	\end{adjustwidth}
	\end{titlepage}
	\clearpage
	\nopagenumberstylefalse % Clear flag after cover page
}

%----------------------------------------------------------------------------------------
%	PREFACE PAGE COMMAND
%----------------------------------------------------------------------------------------

% Preface page parameters
\define@key{preface}{title}{\def\preface@title{#1}}
\define@key{preface}{titlefontsize}{\def\preface@titlefontsize{#1}}
\define@key{preface}{text}{\def\preface@text{#1}}
\define@key{preface}{textfontsize}{\def\preface@textfontsize{#1}}
\define@key{preface}{textcolor}{\def\preface@textcolor{#1}}
\define@key{preface}{image}{\def\preface@image{#1}}
\define@key{preface}{imageheight}{\def\preface@imageheight{#1}}
\define@key{preface}{opacity}{\def\preface@opacity{#1}}
\define@key{preface}{bgcolor}{\def\preface@bgcolor{#1}}
\define@key{preface}{layout}{\def\preface@layout{#1}}
\define@key{preface}{pagecontent}{\def\preface@pagecontent{#1}}

% Preface page commands
\NewDocumentCommand{\preface@init}{}{%
	\def\preface@title{}
	\def\preface@titlefontsize{\fontsize{32pt}{36pt}}
	\def\preface@text{}
	\def\preface@textfontsize{\fontsize{12pt}{16pt}}
	\def\preface@textcolor{darkgrey}
	\def\preface@image{}
	\def\preface@imageheight{0.5}
	\def\preface@opacity{1}
	\def\preface@bgcolor{}
	\def\preface@layout{single}
	\def\preface@pagecontent{}
}


% Single page layout helper
\NewDocumentCommand{\preface@singlelayout}{}{%
	\thispagestyle{custompagestyle}
	\noindent
	\begin{adjustwidth}{\cookbook@bleedextension}{\cookbook@bleedextension}% Extend to page edges including bleed
		\begin{tikzpicture}[remember picture, overlay]
			% Background color
			\ifx\preface@bgcolor\@empty\else
				\fill[\preface@bgcolor]
				(current page.south west) rectangle (current page.north east);
			\fi

		% Add preface image if provided (at top of page)
		\ifx\preface@image\@empty\else
			\begin{scope}
				% Extend clip area into bleed if enabled
				\ifcookbook@bleedenabled
				    % \clip ([xshift=\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north west)
					% 	  rectangle
					% 	  ([xshift=-\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]$(current page.north east) + (0,-\preface@imageheight\cookbook@contentpaperheight)$);
					\path[fill overzoom image={\preface@image},fill image opacity={\preface@opacity}]
					([xshift=\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north west)
					rectangle
					([xshift=-\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]$(current page.north east) + (0,-\cookbook@scaledbleed-\preface@imageheight\cookbook@contentpaperheight)$);
				\else
					\clip (current page.north west)
					      rectangle
					      ($(current page.north east) + (0,-\preface@imageheight\cookbook@contentpaperheight)$);
					\path[fill overzoom image={\preface@image},fill image opacity={\preface@opacity}]
					($(current page.north west) + (0,-\preface@imageheight\cookbook@contentpaperheight)$)
					rectangle
					(current page.north east);
				\fi
			\end{scope}
		\fi
		\end{tikzpicture}
	\end{adjustwidth}

	% Add vertical space after image if present
	\ifx\preface@image\@empty\else
		\vspace*{\dimexpr\preface@imageheight\cookbook@contentpaperheight-\cookbook@margintop\relax}
		\vspace*{0.01\textheight}
	\fi

	% Check if custom page content is provided
	\ifx\preface@pagecontent\@empty
		% Use default title and text rendering
		% Add title if provided
		\ifx\preface@title\@empty\else
			\begin{center}
				{\preface@titlefontsize\sourcesanspro\bfseries\selectfont\MakeUppercase{\preface@title}}
			\end{center}
			\vspace*{0.02\textheight}
		\fi

		% Add preface text content
		\ifx\preface@text\@empty\else
			\begin{adjustwidth}{1cm}{1cm}
				{\preface@textfontsize\selectfont\color{\preface@textcolor}\preface@text}
			\end{adjustwidth}
		\fi
	\else
		% Use custom page content
		\preface@pagecontent
	\fi

	\clearpage
}

% Double-page preface layout (two-page spread)
% This creates a two-page spread where the left page shows an image and
% the right page shows text content. The complexity lies in:
%
% 1. Page positioning: Forces the layout to start on a left page by checking
%    page parity and inserting a blank page if necessary
% 2. Image clipping: Uses TikZ coordinate calculations with margins to create
%    a bordered image effect on the left page
% 3. Content flexibility: Supports both default rendering (title + text) and
%    custom page content via \preface@pagecontent
% 4. Background handling: Applies background color to both pages consistently
%
% The coordinate calculations use xshift/yshift to account for image margins,
% creating a visual border around the image while maintaining full-page coverage.
\NewDocumentCommand{\preface@doublelayout}{}{%
	% Force to left page by checking parity and inserting blank page if needed
	\clearpage
	\cookbook@checkpageparity
	\ifcookbook@isleftpage\else
		% Current page is right, add blank page to get to left
		\thispagestyle{empty}
		\mbox{}
		\newpage
	\fi

	% LEFT PAGE - Image
	\thispagestyle{custompagestyle}
	\noindent
	\begin{adjustwidth}{\cookbook@bleedextension}{\cookbook@bleedextension}% Extend to page edges including bleed
		\begin{tikzpicture}[remember picture, overlay]
			% Background color
			\ifx\preface@bgcolor\@empty\else
				\fill[\preface@bgcolor]
				(current page.south west) rectangle (current page.north east);
			\fi

		% Add preface image (full page with margins)
		% The clip and path coordinates use imagemargin to create a border effect
		\ifx\preface@image\@empty\else
			\begin{scope}
				% Clip to page area minus margins (creates border), extend into bleed if enabled
				\ifcookbook@bleedenabled
					\clip ([xshift=\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]current page.south west) rectangle ([xshift=-\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north east);
					\path[fill overzoom image={\preface@image},fill image opacity={\preface@opacity}]
						($(current page.south west)+(\the\cookbook@scaledbleed,\the\cookbook@scaledbleed)$)
						rectangle
						($(current page.north east)-(\the\cookbook@scaledbleed,\the\cookbook@scaledbleed)$);
				\else
					\clip (current page.south west) rectangle (current page.north east);
					\path[fill overzoom image={\preface@image},fill image opacity={\preface@opacity}]
						(current page.south west)
						rectangle
						(current page.north east);
				\fi
			\end{scope}
		\fi
		\end{tikzpicture}
	\end{adjustwidth}
	\clearpage

	% RIGHT PAGE - Text content
	\thispagestyle{custompagestyle}
	\noindent
	\begin{adjustwidth}{\cookbook@bleedextension}{\cookbook@bleedextension}% Extend to page edges including bleed
		\begin{tikzpicture}[remember picture, overlay]
			% Background color
			\ifx\preface@bgcolor\@empty\else
				\fill[\preface@bgcolor]
				(current page.south west) rectangle (current page.north east);
			\fi
		\end{tikzpicture}
	\end{adjustwidth}

	% Check if custom page content is provided
	\ifx\preface@pagecontent\@empty
		% Use default title and text rendering
		% Add title if provided
		\ifx\preface@title\@empty\else
			\begin{center}
				{\preface@titlefontsize\sourcesanspro\bfseries\selectfont\MakeUppercase{\preface@title}}
			\end{center}
			\vspace*{0.03\textheight}
		\fi

		% Add preface text content
		\ifx\preface@text\@empty\else
			\begin{adjustwidth}{2cm}{2cm}
				{\preface@textfontsize\selectfont\color{\preface@textcolor}\preface@text}
			\end{adjustwidth}
		\fi
	\else
		% Use custom page content (allows complete control over right page layout)
		\preface@pagecontent
	\fi

	\clearpage
}

% Create a preface page
\NewDocumentCommand{\makeprefacepage}{+m}{%
	% Initialize preface properties with defaults
	\preface@init

	% Process the key-value pairs
	\setkeys{preface}{#1}

	% Choose layout
	\ifdefstring{\preface@layout}{double}{
		\preface@doublelayout
	}{
		\ifdefstring{\preface@layout}{single}{
			\preface@singlelayout
		}{
			% Default to single if unknown layout
			\preface@singlelayout
		}
	}
}

%----------------------------------------------------------------------------------------
%	CHAPTER PAGE COMMAND
%----------------------------------------------------------------------------------------

% Define keys for chapter page command
\define@key{chapterpage}{title}{\def\chapterpage@title{#1}}
\define@key{chapterpage}{subtitle}{\def\chapterpage@subtitle{#1}}
\define@key{chapterpage}{textcolor}{\def\chapterpage@textcolor{#1}}
\define@key{chapterpage}{image}{\def\chapterpage@image{#1}}
\define@key{chapterpage}{opacity}{\def\chapterpage@opacity{#1}}
\define@key{chapterpage}{bgcolor}{\def\chapterpage@bgcolor{#1}}
\define@key{chapterpage}{layout}{\def\chapterpage@layout{#1}}
\define@key{chapterpage}{pagecontent}{\def\chapterpage@pagecontent{#1}}


% Initialize defaults for chapter page properties
\NewDocumentCommand{\chapterpage@init}{}{%
	\def\chapterpage@title{}
	\def\chapterpage@subtitle{}
	\def\chapterpage@textcolor{darkgrey}
	\def\chapterpage@image{}
	\def\chapterpage@opacity{1}
	\def\chapterpage@bgcolor{}
	\def\chapterpage@layout{}
	\def\chapterpage@pagecontent{}
}

% Create a chapter page
\NewDocumentCommand{\makechapterpage}{+m}{
	% Initialize chapter properties with defaults
	\chapterpage@init

	% Process the key-value pairs
	\setkeys{chapterpage}{#1}

	% Chapter page layout positioning logic
	% This section handles three layout options: right, left, and double (two-page spread).
	% The complexity comes from:
	% 1. Conditional page forcing: Checks current page parity and inserts blank pages
	%    to ensure chapter starts on the correct page type
	% 2. Nested conditionals: Uses \ifx comparisons with temporary definitions to
	%    determine which layout option was specified
	% 3. Double-page spread: Creates a two-page spread with custom content on left
	%    and chapter content on right
	%
	% The \ifx\chapterpage@layout\layoutright pattern compares the user's layout
	% string with predefined strings to determine which branch to execute.
	% Handle page layout options
	\ifx\chapterpage@layout\@empty
		% No layout specified, don't force any page position
	\else
		% Define comparison strings for layout matching
		\def\layoutright{right}
		\def\layoutleft{left}
		\def\layoutdouble{double}

		\ifx\chapterpage@layout\layoutright
			% Force to right page
			\clearpage
			\cookbook@checkpageparity
			\ifcookbook@isrightpage\else
				% Current page is left, add blank page to get to right
				\thispagestyle{empty}
				\mbox{}
				\newpage
			\fi
		\else\ifx\chapterpage@layout\layoutleft
			% Force to left page
			\clearpage
			\cookbook@checkpageparity
			\ifcookbook@isleftpage\else
				% Current page is right, add blank page to get to left
				\thispagestyle{empty}
				\mbox{}
				\newpage
			\fi
		\else\ifx\chapterpage@layout\layoutdouble
			% Force to double page spread (start on left, end on right)
			\clearpage
			\cookbook@checkpageparity
			\ifcookbook@isleftpage\else
				% We're on a right page, add blank page to get to left
				\thispagestyle{empty}
				\mbox{}
				\newpage
		\fi
		% Add the left page content here (custom content for double-page spread)
		\clearpage
		\thispagestyle{empty}
		\ifx\chapterpage@pagecontent\@empty
			\mbox{} % Empty left page if no custom content
		\else
			\chapterpage@pagecontent % Render custom left page content
		\fi
		\newpage
	\fi\fi\fi
	\fi

	\thispagestyle{custompagestyle}
	\phantomsection
	\addcontentsline{toc}{chapter}{\chapterpage@title}
	\noindent
	\begin{adjustwidth}{\cookbook@bleedextension}{\cookbook@bleedextension}% Extend to page edges including bleed
		\begin{tikzpicture}[remember picture, overlay]
			% Background color
			\ifx\chapterpage@bgcolor\@empty\else
				\begin{pgfonlayer}{background}
					\fill[\chapterpage@bgcolor]
					(current page.south west) rectangle (current page.north east);
				\end{pgfonlayer}
			\fi

			\cookbook@checkpageparity
			\ifcookbook@isrightpage
				% Right page
				\def\@titleangle{-90}
				\def\@titlealign{right}
				\ifcookbook@bleedenabled
					\coordinate (titleat) at ([xshift=-\dimexpr\cookbook@bleedlength\relax]$(current page.east) - (0.5cm,0cm)$);
					\coordinate (clipstart) at ([xshift=\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north west);
					\coordinate (clipend) at ($([xshift=\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]current page.south west) + (\cookbook@scaledbleedremainder+0.7\cookbook@contentpaperwidth,0)$);
				\else
					\coordinate (titleat) at ($(current page.east) - (0.5cm,0cm)$);
					\coordinate (clipstart) at (current page.north west);
					\coordinate (clipend) at ($(current page.south west) + (0.7\cookbook@contentpaperwidth,0)$);
				\fi
			\else
				% Left page
				\def\@titleangle{90}
				\def\@titlealign{left}
				\ifcookbook@bleedenabled
					\coordinate (titleat) at ($([xshift=\dimexpr\cookbook@bleedlength\relax]current page.west) + (0.5cm,0cm)$);
					\coordinate (clipstart) at ([xshift=-\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north east);
					\coordinate (clipend) at ($([xshift=-\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]current page.south east) - (\cookbook@scaledbleedremainder+0.7\cookbook@contentpaperwidth,0)$);
				\else
					\coordinate (titleat) at ($(current page.west) + (0.5cm,0cm)$);
					\coordinate (clipstart) at (current page.north east);
					\coordinate (clipend) at (current page.south east);
				\fi
			\fi

			% Add chapter image if provided
			\ifx\chapterpage@image\@empty\else
				\begin{pgfonlayer}{images}
					\begin{scope}
						\clip (clipstart) rectangle (clipend);
						\path[fill overzoom image={\chapterpage@image},fill image opacity={\chapterpage@opacity}]
						(clipstart)
						rectangle
						(clipend);
					\end{scope}
				\end{pgfonlayer}
			\fi

			% Add title and subtitle
			\node[inner sep=5pt, rotate=\@titleangle, text=\chapterpage@textcolor, font=\sourcesanspro\bfseries,
			align=\@titlealign, anchor=north, text width=\cookbook@contentpaperheight-3cm] at (titleat) {
			\\[10pt]
			{\fontsize{32pt}{36pt}\selectfont\bfseries\MakeUppercase{\chapterpage@title}}
			\\[10pt]
			\ifx\chapterpage@subtitle\@empty\else
				{\fontsize{24pt}{28pt}\selectfont\chapterpage@subtitle}
			\fi
			};
		\end{tikzpicture}
	\end{adjustwidth}
	\clearpage
}

%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS
%----------------------------------------------------------------------------------------

% Redefine ToC title to use translated "Recipes" instead of "Contents"
\renewcommand*\contentsname{\textRecipes}

% Configure font sizes and styles for Table of Contents entries
\renewcommand{\cfttoctitlefont}{\fontsize{36pt}{40pt}\sourcesanspro\bfseries\selectfont} % Title font (reduced from 42pt)
\renewcommand{\cftaftertoctitle}{\par\vspace{-0.02\textheight}} % Space after title

% Chapter entries in ToC
\setlength{\cftbeforechapskip}{8pt}  % Space before chapters in TOC (reduced from 10pt)
\renewcommand{\cftchapfont}{\fontsize{14pt}{16pt}\sourcesanspro\bfseries\selectfont} % Chapter entry font (reduced from 18pt)
\renewcommand{\cftchappagefont}{\sourcesanspro\small\bfseries} % Page number font (reduced from normalsize)

% Section entries in ToC
\setlength{\cftbeforesecskip}{6pt}    % Space before sections in TOC (reduced from 10pt)
\renewcommand{\cftsecfont}{\fontsize{11pt}{13pt}\sourcesanspro\bfseries\selectfont} % Section entry font (reduced from 14pt)
\renewcommand{\cftsubsecfont}{\sourcesanspro\small} % Subsection entry font (reduced from normalsize)
\renewcommand{\cftsecpagefont}{\sourcesanspro\small\bfseries} % Page number font (reduced from normalsize)

% Configure ToC spacing and dot leader formatting
\setlength{\cftbeforetoctitleskip}{30pt}
\renewcommand{\cftdotsep}{1} % Dot spacing in leaders

% Suppress page numbers on ToC pages
\tocloftpagestyle{empty}

\NewDocumentCommand{\maketoc}{}{
	\tableofcontents
	\thispagestyle{custompagestyle}
	\clearpage
}

%----------------------------------------------------------------------------------------
%	IMAGE PAGE COMMAND
%----------------------------------------------------------------------------------------

% Image page parameters
\define@key{image}{caption}{\def\image@caption{#1}}
\define@key{image}{captionfontsize}{\def\image@captionfontsize{#1}}
\define@key{image}{textcolor}{\def\image@textcolor{#1}}
\define@key{image}{shadowcolor}{\def\image@shadowcolor{#1}}
\define@key{image}{shadowoffset}{\def\image@shadowoffset{#1}}
\define@key{image}{image}{\def\image@image{#1}}
\define@key{image}{opacity}{\def\image@opacity{#1}}
\define@key{image}{bgcolor}{\def\image@bgcolor{#1}}

% Image page commands
\NewDocumentCommand{\image@init}{}{%
	\def\image@caption{}
	\def\image@captionfontsize{\fontsize{18pt}{20pt}}
	\def\image@textcolor{white}
	\def\image@shadowcolor{black}
	\def\image@shadowoffset{0.05cm}
	\def\image@image{}
	\def\image@opacity{1}
	\def\image@bgcolor{}
}


% Create an image page
\NewDocumentCommand{\makeimagepage}{+m}{%
	% Initialize image page properties with defaults
	\image@init

	% Process the key-value pairs
	\setkeys{image}{#1}

	\begin{adjustwidth}{\cookbook@bleedextension}{\cookbook@bleedextension}% Extend to page edges including bleed
		\begin{tikzpicture}[remember picture, overlay]
			% Background color
			\ifx\image@bgcolor\@empty\else
				\fill[\image@bgcolor]
				(current page.south west) rectangle (current page.north east);
			\fi

			% Add full-page image if provided
			\ifx\image@image\@empty\else
				\begin{scope}
					% Extend image into bleed area
					\ifcookbook@bleedenabled
						\clip ([xshift=\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]current page.south west) rectangle ([xshift=-\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north east);
						\path[fill overzoom image={\image@image},fill image opacity={\image@opacity}]
							($(current page.south west)+(\the\cookbook@scaledbleed,\the\cookbook@scaledbleed)$)
							rectangle
							($(current page.north east)-(\the\cookbook@scaledbleed,\the\cookbook@scaledbleed)$);
					\else
						\clip (current page.south west) rectangle (current page.north east);
						\path[fill overzoom image={\image@image},fill image opacity={\image@opacity}]
							(current page.south west)
							rectangle
							(current page.north east);
					\fi
				\end{scope}
			\fi

			\ifx\image@image\@empty\else
			\cookbook@checkpageparity
			\ifcookbook@isrightpage
			% Right page
			\def\@captionalign{left}
			\else
			% Left page
			\def\@captionalign{right}
			\fi

			\ifcookbook@bleedenabled
				\coordinate (captionpos) at ($(current page.south)+(0,\dimexpr0.5cm+\cookbook@bleedlength\relax)$);
				\coordinate (captionshadowpos) at ($(current page.south)+(\image@shadowoffset,\dimexpr0.5cm+\cookbook@bleedlength-\image@shadowoffset\relax)$);
			\else
				\coordinate (captionpos) at ($(current page.south)+(0,0.5cm)$);
				\coordinate (captionshadowpos) at ($(current page.south)+(\image@shadowoffset,0.5cm-\image@shadowoffset)$);
			\fi

			% Add caption with drop shadow for visibility
			% First draw the shadow (offset behind the text)
			\node[text=\image@shadowcolor, font=\sourcesanspro\bfseries,
				align=\@captionalign, anchor=south, text width=\cookbook@contentpaperwidth-1cm] at (captionshadowpos) {
				{\image@captionfontsize\selectfont\image@caption}
			};
			% Then draw the actual text on top
			\node[text=\image@textcolor, font=\sourcesanspro\bfseries,
				align=\@captionalign, anchor=south, text width=\cookbook@contentpaperwidth-1cm] at (captionpos) {
				{\image@captionfontsize\selectfont\image@caption}
			};
			\fi
		\end{tikzpicture}
	\end{adjustwidth}

	\clearpage
}

%----------------------------------------------------------------------------------------
%	RECIPE ENVIRONMENT COMMANDS
%----------------------------------------------------------------------------------------

% Define keys for recipe command
\define@key{recipe}{layout}{\def\recipe@layout{#1}}
\define@key{recipe}{image}{\def\recipe@image{#1}}
\define@key{recipe}{imageopacity}{\def\recipe@imageopacity{#1}}
\define@key{recipe}{imageheight}{\def\recipe@imageheight{#1}}
\define@key{recipe}{imageoverlayspace}{\def\recipe@imageoverlayspace{#1}}
\define@key{recipe}{imageposition}{\def\recipe@imageposition{#1}}
\define@key{recipe}{title}{\def\recipe@title{#1}}
\define@key{recipe}{description}{\def\recipe@description{#1}}
\define@key{recipe}{serves}{\def\recipe@serves{#1}}
\define@key{recipe}{preptime}{\def\recipe@preptime{#1}}
\define@key{recipe}{cookingtime}{\def\recipe@cookingtime{#1}}
\define@key{recipe}{difficulty}{\def\recipe@difficulty{#1}}
\define@key{recipe}{origin}{\def\recipe@origin{#1}}
\define@key{recipe}{spicy}{\def\recipe@spicy{#1}}
\define@key{recipe}{vegetarian}{\def\recipe@vegetarian{#1}}
\define@key{recipe}{tags}{\def\recipe@tags{#1}}
\define@key{recipe}{extrainstructioninfo}{\def\recipe@extrainstructioninfo{#1}}
\define@key{recipe}{ingredients}{\def\recipe@ingredients{#1}}
\define@key{recipe}{instructions}{\def\recipe@instructions{#1}}
\define@key{recipe}{columnsep}{\def\recipe@columnsep{#1}}
\define@key{recipe}{columnseprule}{\def\recipe@columnseprule{#1}}
\define@key{recipe}{columnseprulecolor}{\def\recipe@columnseprulecolor{#1}}
\define@key{recipe}{columnratio}{\def\recipe@columnratio{#1}}
\define@key{recipe}{indexes}{\def\recipe@indexes{#1}}
\define@key{recipe}{ingredientitemsep}{\def\recipe@ingredientitemsep{#1}}
\define@key{recipe}{instructionitemsep}{\def\recipe@instructionitemsep{#1}}

% Initialize defaults for recipe properties
\NewDocumentCommand{\recipe@init}{}{%
	\def\recipe@layout{columns} % Default layout: 2 columns; available layouts: 'columns' and 'simple'
	\def\recipe@image{}%
	\def\recipe@imageopacity{1}%
	\def\recipe@imageheight{0.3\cookbook@contentpaperheight}%
	\def\recipe@imageoverlayspace{0.25\cookbook@contentpaperheight}%
	\def\recipe@imageposition{top}% Default image position: top or bottom
	\def\recipe@title{}%
	\def\recipe@description{}%
	\def\recipe@serves{}%
	\def\recipe@preptime{}%
	\def\recipe@cookingtime{}%
	\def\recipe@difficulty{}%
	\def\recipe@origin{}%
	\def\recipe@spicy{}%
	\def\recipe@vegetarian{}%
	\def\recipe@tags{}%
	\def\recipe@extrainstructioninfo{}%
	\def\recipe@ingredients{}%
	\def\recipe@instructions{}%
	\def\recipe@columnsep{\cookbook@columnsep}% Default column spacing
	\def\recipe@columnseprule{0.5pt}% Default separator thickness
	\def\recipe@columnseprulecolor{lightgrey}% Default separator color
	\def\recipe@columnratio{0.3, 0.7}% Default column ratio
	\def\recipe@indexes{}% Default empty indexes
	\def\recipe@ingredientitemsep{\cookbook@ingredientitemsep}% Default to global ingredient item spacing
	\def\recipe@instructionitemsep{\cookbook@instructionitemsep}% Default to global instruction item spacing
}

% Main recipe command: processes key-value options and renders complete recipe page
\NewDocumentCommand{\recipe}{+m}{%
	% Initialize recipe properties with defaults
	\recipe@init

	% Process the key-value pairs
	\setkeys{recipe}{#1}

	% Process indexes array and create \index commands
	% Iterates through comma-separated index entries and creates index entries for each.
	% Uses \@for loop which expands each item in the comma-separated list.
	\ifx\recipe@indexes\@empty\else
		\@for\idx:=\recipe@indexes\do{%
			\indexentry{\idx}%
		}%
	\fi

	% Automatic tag addition with duplicate checking
	% This section automatically adds "Spicy" and "Vegetarian" tags to the recipe
	% if the corresponding flags are set, but only if they're not already present.
	%
	% The logic uses \in@ (from etoolbox) to check if a tag already exists in the list.
	% This prevents duplicate tags when users explicitly add them AND set the flag.
	%
	% The \expandafter chain is necessary because \in@ needs the arguments fully expanded
	% before it can perform the string search. \edef is used to expand the tag list when
	% appending new tags, ensuring proper comma-separated list formatting.
	\ifx\recipe@spicy\@empty\else
		% Check if "Spicy" is already in tags using string search
		\expandafter\in@\expandafter{\textSpicy}{\recipe@tags}%
		\ifin@\else
			% Tag not found, add it to the list
			\ifx\recipe@tags\@empty
				% Empty list: just add the tag
				\edef\recipe@tags{\textSpicy}%
			\else
				% Non-empty list: append with comma separator
				\edef\recipe@tags{\recipe@tags, \textSpicy}%
			\fi
		\fi
	\fi
	\ifx\recipe@vegetarian\@empty\else
		% Check if "Vegetarian" is already in tags using string search
		\expandafter\in@\expandafter{\textVegetarian}{\recipe@tags}%
		\ifin@\else
			% Tag not found, add it to the list
			\ifx\recipe@tags\@empty
				% Empty list: just add the tag
				\edef\recipe@tags{\textVegetarian}%
			\else
				% Non-empty list: append with comma separator
				\edef\recipe@tags{\recipe@tags, \textVegetarian}%
			\fi
		\fi
	\fi

	% Recipe image positioning at top of page
	% This section handles images positioned at the top of recipe pages.
	%
	% The TikZ implementation uses:
	% - remember picture, overlay: Places image relative to page coordinates
	% - \clip: Restricts image to the top portion of the page
	% - fill overzoom image: Fills the clipped area with image, allowing slight overflow (1.02x)
	%   to prevent white edges from rounding errors
	% - Coordinate calculations: Uses calc library to position image precisely
	%
	% The \vspace* ensures content starts below the image overlay area.
	\ifx\recipe@image\@empty\else
		\ifdefstring{\recipe@imageposition}{top}{%
			\begin{tikzpicture}[remember picture, overlay]
				\begin{scope}
					\ifcookbook@bleedenabled
						\clip ([xshift=\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north west)
						      rectangle
							  ([xshift=-\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]$(current page.north east) - (0,\recipe@imageheight)$);
						\path[fill overzoom image={\recipe@image},fill image opacity={\recipe@imageopacity}]
						    ([xshift=\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]current page.north west)
							rectangle
							([xshift=-\cookbook@scaledbleed,yshift=-\cookbook@scaledbleed]$(current page.north east) - (0,\recipe@imageheight)$);
					\else
						\clip (current page.north west) rectangle ($(current page.north east) - (0,\recipe@imageheight)$);
						\path[fill overzoom image={\recipe@image},fill image opacity={\recipe@imageopacity}]
						($(current page.north west) - (0,\recipe@imageheight)$)
						rectangle
						++(1.02\cookbook@contentpaperwidth,\recipe@imageheight);
					\fi
				\end{scope}
			\end{tikzpicture}

			% Add vertical space after the image before content begins
			\vspace*{\dimexpr\recipe@imageoverlayspace - \cookbook@scaledbleedremainder\relax}
		}{}%
	\fi

	% Output the recipe header
	\outputrecipetitle

	\ifdefstring{\recipe@layout}{columns}{%
		\recipecolumnslayout
	}{%
		\ifdefstring{\recipe@layout}{simple}{%
			\recipesimplelayout
		}{%
			\vspace*{0.01\textheight}
			\begin{center}
				{\large\bfseries Invalid Recipe Layout: \recipe@layout}
			\end{center}
		}%
	}%

	% Recipe image positioning at bottom of page
	% Similar to top positioning but places image at bottom.
	% The clip rectangle extends below the page edge to ensure full coverage,
	% and the image is positioned from the bottom edge upward.
	\ifx\recipe@image\@empty\else
		\ifdefstring{\recipe@imageposition}{bottom}{%
			\begin{tikzpicture}[remember picture, overlay]
				\begin{scope}
					\ifcookbook@bleedenabled
						\clip ([xshift=\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]current page.south west)
						      rectangle
							  ([xshift=-\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]$(current page.south east) + (0,\recipe@imageheight)$);
						\path[fill overzoom image={\recipe@image},fill image opacity={\recipe@imageopacity}]
						    ([xshift=\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]current page.south west)
							rectangle
							([xshift=-\cookbook@scaledbleed,yshift=\cookbook@scaledbleed]$(current page.south east) + (0,\recipe@imageheight)$);
					\else
						\clip (current page.south west) rectangle ($(current page.south east) + (0,\recipe@imageheight)$);
						\path[fill overzoom image={\recipe@image},fill image opacity={\recipe@imageopacity}]
						(current page.south west)
						rectangle
						++(1.02\cookbook@contentpaperwidth,\recipe@imageheight);
					\fi
				\end{scope}
			\end{tikzpicture}
		}{}%
	\fi

	\clearpage
}

% Two-column recipe layout with synchronized columns
% This layout uses the paracol package to create parallel columns that stay
% synchronized across page breaks. The implementation is complex because:
%
% 1. Column ratio parsing: \expandafter\columnratio expands the comma-separated
%    ratio string (e.g., "0.3, 0.7") into paracol's column ratio format
% 2. Column switching: \switchcolumn[0]* with asterisk synchronizes the left column
%    with the right column's starting position, ensuring tags align with instructions
% 3. Tag processing: Uses \@for loop to iterate through comma-separated tags
% 4. Column synchronization: The asterisk (*) in \switchcolumn[0]* is critical -
%    it tells paracol to align this column's content with the next column switch,
%    preventing misalignment when content heights differ
\NewDocumentCommand{\recipecolumnslayout}{}{
	\outputrecipeinfoinline

	% Set column ratio for ingredients and instructions
	% \expandafter ensures the ratio string is fully expanded before \columnratio processes it
	\expandafter\columnratio\expandafter{\recipe@columnratio}

	% Configure column separator using recipe parameters
	\setlength{\columnsep}{\recipe@columnsep}
	\setlength{\columnseprule}{\recipe@columnseprule}
	\def\columnseprulecolor{\color{\recipe@columnseprulecolor}}

	% Start the two-column layout using paracol package
	\begin{paracol}{2}

		% Tags section - placed in left column with synchronization
		% The asterisk (*) synchronizes this column's top with the next column switch
		\switchcolumn[0]* % Move to left column, * synchronizes column alignment with instructions start
		\begin{recipetagslist}
			% Process each tag individually using \@for loop
			\@for\t:=\recipe@tags\do{%
				\recipeTag{\t}%
			}%
		\end{recipetagslist}

		\begin{center}
			\rule{20pt}{0.5pt}
		\end{center}

		% Ingredients list in left column
		\switchcolumn[0] % Move to left column
		\begin{recipeingredients}
			\recipe@ingredients
		\end{recipeingredients}

		% Instructions in right column
		\switchcolumn[1] % Move to right column
		\begin{recipeinstructions}
			\recipe@instructions
		\end{recipeinstructions}

	\end{paracol}
}

\NewDocumentCommand{\recipesimplelayout}{}{
	\vspace*{0.01\textheight}

	\expandafter\columnratio\expandafter{\recipe@columnratio}

	\begin{paracol}{2}

		% Tags section
		\switchcolumn[0]* % Move to left column, * synchronizes column alignment with instructions start

		\outputrecipeinfoblock

		\begin{center}
			\rule{20pt}{0.5pt}
		\end{center}
		\vspace*{0.002\textheight}

		\begin{recipetagslist}
			% Process each tag individually
			\@for\t:=\recipe@tags\do{%
				\recipeTag{\t}%
			}%
		\end{recipetagslist}

		\switchcolumn[1] % Move to right column for instructions
		\begin{recipeingredients}
			\recipe@ingredients
		\end{recipeingredients}
	\end{paracol}

	\begin{center}
		\rule{100pt}{0.5pt}
	\end{center}
	\vspace*{0.002\textheight} % Vertical whitespace

	\begin{recipeinstructions}
		\recipe@instructions
	\end{recipeinstructions}
}

%----------------------------------------------------------------------------------------
%	RECIPE HEADER
%----------------------------------------------------------------------------------------

\NewDocumentCommand{\outputrecipetitle}{}{
	\phantomsection
	\addcontentsline{toc}{section}{\recipe@title}

	\ifx\recipe@description\@empty\else
		\textit{\color{Grey}\recipe@description}

		\vspace*{0.01\textheight}
	\fi

	{\raggedright\sourcesanspro{\fontsize{32pt}{36pt}\selectfont\bfseries\MakeUppercase{\recipe@title}\par}}


	\ifx\recipe@origin\@empty
		\vspace*{0.025\textheight}
	\else
		\vspace*{0.01\textheight}
		\begin{minipage}[t]{0.7\textwidth}
			{\raggedright\sourcesanspro{\fontsize{18pt}{20pt}\selectfont\bfseries\MakeUppercase{\textOrigin: \recipe@origin}}}
		\end{minipage}%
		\hfill%
		\begin{minipage}[t]{0.25\textwidth}
			\raggedleft
			\raisebox{-0.1\baselineskip}{%
				\ifx\recipe@spicy\@empty\else\spicyicon\hspace{0.4em}\fi
				\ifx\recipe@vegetarian\@empty\else\vegetarianicon\fi
			}
		\end{minipage}
		\par
		\vspace*{0.005\textheight}
	\fi

	\recipeSeparator
	\vspace*{0.0055\textheight}
}

% Boolean flag to efficiently check if any recipe metadata is provided
\newif\ifrecipehasinfo
\recipehasinfofalse

\NewDocumentCommand{\recipe@checkinfo}{}{%
	\recipehasinfofalse
	\ifx\recipe@serves\@empty\else\recipehasinfotrue\fi
	\ifx\recipe@preptime\@empty\else\recipehasinfotrue\fi
	\ifx\recipe@cookingtime\@empty\else\recipehasinfotrue\fi
	\ifx\recipe@difficulty\@empty\else\recipehasinfotrue\fi
}


\NewDocumentCommand{\outputrecipeinfoinline}{O{4pt}}{
	% #1 = horizontal spacing between text and value
	\recipe@checkinfo
	\ifrecipehasinfo
		\sourcesanspro{%
			\ifx\recipe@serves\@empty\else
				\textbf{\MakeUppercase{\textServes}}\hspace{#1}\recipe@serves\hspace{#1}\hspace{#1}%
			\fi
			\ifx\recipe@preptime\@empty\else
				\textbf{\MakeUppercase{\textPrep}}\hspace{#1}\recipe@preptime\hspace{#1}\hspace{#1}%
			\fi
			\ifx\recipe@cookingtime\@empty\else
				\textbf{\MakeUppercase{\textCooking}}\hspace{#1}\recipe@cookingtime\hspace{#1}\hspace{#1}%
			\fi
			\ifx\recipe@difficulty\@empty\else
				\textbf{\MakeUppercase{\textDifficulty}}\hspace{#1}\recipe@difficulty%
			\fi
		}

		\vspace*{-0.004\textheight}

		\recipeSeparator

		\vspace*{0.02\textheight}
	\else
		\vspace*{0.0145\textheight}
	\fi
}

\NewDocumentCommand{\outputrecipeinfoblock}{O{4pt}}{
	% #1 = horizontal spacing between text and value

	\recipe@checkinfo
	\ifrecipehasinfo
		\sourcesanspro{%
			\ifx\recipe@serves\@empty\else
				\textbf{\MakeUppercase{\textServes}}\hspace{#1}\recipe@serves\par%
			\fi
			\ifx\recipe@preptime\@empty\else
				\textbf{\MakeUppercase{\textPrep}}\hspace{#1}\recipe@preptime\par%
			\fi
			\ifx\recipe@cookingtime\@empty\else
				\textbf{\MakeUppercase{\textCooking}}\hspace{#1}\recipe@cookingtime\par%
			\fi
			\ifx\recipe@difficulty\@empty\else
				\textbf{\MakeUppercase{\textDifficulty}}\hspace{#1}\recipe@difficulty\par%
			\fi
		}
	\fi
}

%----------------------------------------------------------------------------------------
%	TAGS LIST
%----------------------------------------------------------------------------------------

\NewDocumentEnvironment{recipetagslist}{}{
	\raggedright
	\begin{sloppypar}
		}{
	\end{sloppypar}
	\vspace*{-0.01\textheight}
}

%----------------------------------------------------------------------------------------
%	INGREDIENTS LIST
%----------------------------------------------------------------------------------------

\NewDocumentEnvironment{recipeingredients}{}{%
	\vspace*{-0.01\textheight}
	\firstingredientsectiontrue
	\begin{sloppypar}%
		\raggedright
		\begin{enumerate}[
			align=left,
			leftmargin=10pt,
			itemindent=0pt,
			labelwidth=10pt,
			labelsep=2pt,
			labelindent=0pt,
			label=\protect\textbullet,
			itemsep=\recipe@ingredientitemsep,
		]%
		}{%
		\end{enumerate}%
	\end{sloppypar}%
}

%----------------------------------------------------------------------------------------
%	INSTRUCTIONS LIST
%----------------------------------------------------------------------------------------

\NewDocumentEnvironment{recipeinstructions}{}{%
	\firstinstructionsectiontrue
	\begin{sloppypar}%
		\begin{enumerate}[
			align=left,
			leftmargin=20pt,
			itemindent=0pt,
			labelwidth=15pt,
			labelsep=5pt,
			labelindent=0pt,
			label=\protect\circledinstruction{\arabic{*}},
			itemsep=\recipe@instructionitemsep,
		]%
		}{%
		\end{enumerate}%
		\ifdefempty{\recipe@extrainstructioninfo}{}{%
			\bigskip
			\textit{\color{Grey}\recipe@extrainstructioninfo}%
		}%
	\end{sloppypar}%
}

%----------------------------------------------------------------------------------------
%	CONVERSION TABLE PAGE COMMAND
%----------------------------------------------------------------------------------------

% Conversion table page parameters
\define@key{conversion}{title}{\def\conversion@title{#1}}
\define@key{conversion}{titlefontsize}{\def\conversion@titlefontsize{#1}}
\define@key{conversion}{textcolor}{\def\conversion@textcolor{#1}}
\define@key{conversion}{bgcolor}{\def\conversion@bgcolor{#1}}
\define@key{conversion}{layout}{\def\conversion@layout{#1}}

% Flag to track conversion page state for background color application
\newif\ifconversionpage
\conversionpagefalse

% Global storage for conversion page background color (applied to all conversion pages)
\def\conversion@globalbgcolor{}

% Conversion table page commands
\NewDocumentCommand{\conversion@init}{}{%
	\def\conversion@title{\textConversionTable}%
	\def\conversion@titlefontsize{\fontsize{32pt}{36pt}}%
	\def\conversion@textcolor{darkgrey}%
	\def\conversion@bgcolor{}%
	\def\conversion@layout{single}%
}

% Apply background color to all conversion pages via shipout hook
\AddToShipoutPictureBG{%
	\ifconversionpage
		\ifx\conversion@globalbgcolor\@empty\else
			\begin{tikzpicture}[remember picture, overlay]
				\fill[\conversion@globalbgcolor]
				(current page.south west) rectangle (current page.north east);
			\end{tikzpicture}
		\fi
	\fi
}

% Create a conversion table page
\NewDocumentCommand{\makeconversionpage}{+m}{%
	% Initialize conversion page properties with defaults
	\conversion@init

	% Process the key-value pairs
	\setkeys{conversion}{#1}

	% Store background color globally and set flag to enable background on all conversion pages
	\ifx\conversion@bgcolor\@empty
		\def\conversion@globalbgcolor{}%
	\else
		\def\conversion@globalbgcolor{\conversion@bgcolor}%
	\fi
	\conversionpagetrue

	\thispagestyle{custompagestyle}
	\phantomsection
	\addcontentsline{toc}{chapter}{\conversion@title}

	% Add title
	\begin{center}
		\vspace*{0.03\textheight}
		{\conversion@titlefontsize\sourcesanspro\bfseries\selectfont\MakeUppercase{\conversion@title}}
		\vspace*{0.03\textheight}
	\end{center}

	% Render conversion tables with proper spacing and formatting
	\begin{adjustwidth}{0.5cm}{0.5cm}
		\color{\conversion@textcolor}

		% Volume Conversions
		\needspace{5\baselineskip}
		{\fontsize{18pt}{22pt}\sourcesanspro\bfseries\selectfont\textVolume}\par
		\vspace{0.01\textheight}
		\begin{tabularx}{\textwidth}{X X X}
			\toprule
			\textbf{\textUSImperial} & \textbf{\textMetric} & \textbf{\textNotes} \\
			\midrule
			1 \textTeaspoon (tsp) & 5 ml & \\
			1 \textTablespoon (tbsp) & 15 ml & 3 \textTeaspoons \\
			1 fluid ounce (fl oz) & 30 ml & 2 \textTablespoons \\
			$\frac{1}{8}$ cup & 30 ml & 2 \textTablespoons \\
			$\frac{1}{4}$ cup & 60 ml & 4 \textTablespoons \\
			$\frac{1}{3}$ cup & 80 ml & 5 \textTablespoons + 1 \textTeaspoon \\
			$\frac{1}{2}$ cup & 120 ml & 8 \textTablespoons \\
			$\frac{2}{3}$ cup & 160 ml & 10 \textTablespoons + 2 \textTeaspoons \\
			$\frac{3}{4}$ cup & 180 ml & 12 \textTablespoons \\
			1 cup & 240 ml & 16 \textTablespoons \\
			1 pint (pt) & 480 ml & 2 \textCups \\
			1 quart (qt) & 960 ml & 4 \textCups \\
			1 gallon (gal) & 3.8 L & 4 \textQuarts \\
			\bottomrule
		\end{tabularx}

		\vspace{0.03\textheight}

		% Weight Conversions
		\needspace{5\baselineskip}
		{\fontsize{18pt}{22pt}\sourcesanspro\bfseries\selectfont\textWeight}\par
		\vspace{0.01\textheight}
		\begin{tabularx}{\textwidth}{X X X}
			\toprule
			\textbf{\textUSImperial} & \textbf{\textMetric} & \textbf{\textNotes} \\
			\midrule
			1 ounce (oz) & 28 g & \\
			2 ounces & 57 g & \\
			3 ounces & 85 g & \\
			4 ounces & 113 g & $\frac{1}{4}$ pound \\
			6 ounces & 170 g & \\
			8 ounces & 227 g & $\frac{1}{2}$ pound \\
			12 ounces & 340 g & $\frac{3}{4}$ pound \\
			16 ounces & 454 g & 1 pound (lb) \\
			1 pound (lb) & 454 g & 16 ounces \\
			2 pounds & 907 g & 0.9 kg \\
			1 kilogram (kg) & 2.2 pounds & 1000 g \\
			\bottomrule
		\end{tabularx}

		\vspace{0.03\textheight}

		% Temperature Conversions
		\needspace{5\baselineskip}
		{\fontsize{18pt}{22pt}\sourcesanspro\bfseries\selectfont\textTemperature}\par
		\vspace{0.01\textheight}
		\begin{tabularx}{\textwidth}{X X X}
			\toprule
			\textbf{\textFahrenheit} & \textbf{\textCelsius} & \textbf{\textNotes} \\
			\midrule
			32°F & 0°C & \textFreezingPoint \\
			68°F & 20°C & \textRoomTemperature \\
			100°F & 38°C & \textBodyTemperature \\
			212°F & 100°C & \textBoilingPoint \\
			\midrule
			325°F & 165°C & \textCommonBakingTemp \\
			375°F & 190°C & \textCommonBakingTemp \\
			425°F & 220°C & \textCommonBakingTemp \\
			450°F & 230°C & \textCommonBakingTemp \\
			\midrule
			\textbf{\textFormula} & \textbf{°C = (°F - 32) × 5/9} & \\
			\textbf{\textFormula} & \textbf{°F = (°C × 9/5) + 32} & \\
			\bottomrule
		\end{tabularx}

		\vspace{0.03\textheight}

		% Oven Temperature Guide
		\needspace{5\baselineskip}
		{\fontsize{18pt}{22pt}\sourcesanspro\bfseries\selectfont\textOvenTemperatures}\par
		\vspace{0.01\textheight}
		\begin{tabularx}{\textwidth}{X X X}
			\toprule
			\textbf{\textUseCase} & \textbf{°F} & \textbf{°C} \\
			\midrule
			\textSlowRoasting & 200-250°F & 95-120°C \\
			\textSlowCooking & 250-300°F & 120-150°C \\
			\textDelicateCakes & 325°F & 165°C \\
			\textCakesCookies & 350°F & 175°C \\
			\textQuickBreads & 375°F & 190°C \\
			\textRoastingVegetables & 400-425°F & 200-220°C \\
			\textPizzaBread & 450-475°F & 230-245°C \\
			\textHighHeatRoasting & 500°F & 260°C \\
			\bottomrule
		\end{tabularx}
		\vspace{0.5\baselineskip}
		{\footnotesize\itshape\textDefaultOvenTemp}\par

		\vspace{0.03\textheight}

		% Length Conversions (useful for pan sizes)
		\needspace{5\baselineskip}
		{\fontsize{18pt}{22pt}\sourcesanspro\bfseries\selectfont\textLength}\par
		\vspace{0.01\textheight}
		\begin{tabularx}{\textwidth}{X X X}
			\toprule
			\textbf{\textInches} & \textbf{\textCentimeters} & \textbf{\textCommonUse} \\
			\midrule
			1 inch & 2.5 cm & \\
			4 inches & 10 cm & \textSmallTartPan \\
			6 inches & 15 cm & \textSmallCakePan \\
			8 inches & 20 cm & \textStandardCakePan \\
			9 inches & 23 cm & \textStandardPiePan \\
			10 inches & 25 cm & \textLargeCakePan \\
			12 inches & 30 cm & \textLargeSkillet \\
			13 × 9 inches & 33 × 23 cm & \textStandardBakingDish \\
			\bottomrule
		\end{tabularx}

		\vspace{0.02\textheight}

		% Additional helpful conversions
		\needspace{5\baselineskip}
		{\fontsize{14pt}{18pt}\sourcesanspro\bfseries\selectfont\textAdditionalConversions}\par
		\vspace{0.01\textheight}
		\begin{tabularx}{\textwidth}{X X}
			\toprule
			\textbf{\textMeasurement} & \textbf{\textConversion} \\
			\midrule
			\textStickButter & 8 \textTablespoons = $\frac{1}{2}$ \textCup = 113 g \\
			\textCupButter & 227 g = 2 \textSticksUS \\
			\textAllPurposeFlour & 120 g \\
			\textGranulatedSugar & 200 g \\
			\textBrownSugar & 220 g \\
			\textPowderedSugar & 120 g \\
			\textChocolateChips & 170 g \\
			\textCupMilk & 240 ml = 240 g \\
			\textCupWater & 240 ml = 240 g \\
			\textCupHoney & 340 g \\
			\textVegetableOil & 220 g \\
			\textLargeEgg & 50 g / 3 \textTablespoons \\
			\textActiveDryYeast & 2$\frac{1}{4}$ \textTeaspoons = 7 g \\
			\bottomrule
		\end{tabularx}

		\vspace{0.02\textheight}

		% Note about weighing ingredients
		\begin{center}
			{\itshape\small\textConversionNote}
		\end{center}

	\end{adjustwidth}

	% Reset conversion page flag and clear background color after rendering
	\clearpage
	\conversionpagefalse
	\def\conversion@globalbgcolor{}%
}

%----------------------------------------------------------------------------------------
%	BACK COVER PAGE COMMAND
%----------------------------------------------------------------------------------------

% Back cover page parameters
\define@key{backcover}{topcontent}{\def\backcover@topcontent{#1}}
\define@key{backcover}{image}{\def\backcover@image{#1}}
\define@key{backcover}{imageopacity}{\def\backcover@imageopacity{#1}}
\define@key{backcover}{imageposition}{\def\backcover@imageposition{#1}}
\define@key{backcover}{columnratio}{\def\backcover@columnratio{#1}}
\define@key{backcover}{verticalsplit}{\def\backcover@verticalsplit{#1}}
\define@key{backcover}{bottomcontent}{\def\backcover@bottomcontent{#1}}
\define@key{backcover}{isbn}{\def\backcover@isbn{#1}}
\define@key{backcover}{barcodeimage}{\def\backcover@barcodeimage{#1}}
\define@key{backcover}{publisher}{\def\backcover@publisher{#1}}
\define@key{backcover}{copyright}{\def\backcover@copyright{#1}}
\define@key{backcover}{textcolor}{\def\backcover@textcolor{#1}}
\define@key{backcover}{bgcolor}{\def\backcover@bgcolor{#1}}
\define@key{backcover}{divider}{\def\backcover@divider{#1}}
\define@key{backcover}{barcodeplaceholder}{\def\backcover@barcodeplaceholder{#1}}

% Back cover page commands
\NewDocumentCommand{\backcover@init}{}{%
	\def\backcover@topcontent{}
	\def\backcover@image{}
	\def\backcover@imageopacity{1}
	\def\backcover@imageposition{right}
	\def\backcover@columnratio{0.6,0.4}
	\def\backcover@verticalsplit{0.5}
	\def\backcover@bottomcontent{}
	\def\backcover@isbn{}
	\def\backcover@barcodeimage{}
	\def\backcover@publisher{}
	\def\backcover@copyright{}
	\def\backcover@textcolor{darkgrey}
	\def\backcover@bgcolor{}
	\def\backcover@divider{no}
	\def\backcover@barcodeplaceholder{false}
}

% Create a back cover page
\NewDocumentCommand{\makebackcoverpage}{+m}{%
	% Initialize back cover properties with defaults
	\backcover@init

	% Process the key-value pairs
	\setkeys{backcover}{#1}

	% Ensure back cover is on a left page
	\clearpage
	% Set flag before any blank page or back cover to suppress page numbers
	\nopagenumberstyletrue
	\cookbook@checkpageparity
	\ifcookbook@isleftpage\else
		% Current page is right, add blank page to get to left
		\thispagestyle{empty}
		\mbox{}
		\newpage
	\fi

	% Now we're on an even page, create the back cover
	\thispagestyle{empty}
	\noindent
	\begin{adjustwidth}{\cookbook@bleedextension}{\cookbook@bleedextension}% Extend to page edges including bleed
		\begin{tikzpicture}[remember picture, overlay]
			% Background color
			\ifx\backcover@bgcolor\@empty\else
				\fill[\backcover@bgcolor]
				(current page.south west) rectangle (current page.north east);
			\fi
		\end{tikzpicture}
	\end{adjustwidth}

	% Top padding (5% of page)
	\vspace*{0.05\textheight}

	% Parse column ratio (format: "0.6,0.4" or "60%,40%")
	\StrBefore{\backcover@columnratio}{,}[\backcover@colratio@text]
	\StrBehind{\backcover@columnratio}{,}[\backcover@colratio@image]
	% Remove % if present
	\StrSubstitute{\backcover@colratio@text}{\%}{}[\backcover@colratio@text]
	\StrSubstitute{\backcover@colratio@image}{\%}{}[\backcover@colratio@image]
	% Convert to decimal if needed (if > 1, assume it's percentage)
	\pgfmathparse{\backcover@colratio@text}
	\ifdim\pgfmathresult pt>1pt
		\pgfmathparse{\backcover@colratio@text/100}
	\fi
	\edef\backcover@colratio@text{\pgfmathresult}
	\pgfmathparse{\backcover@colratio@image}
	\ifdim\pgfmathresult pt>1pt
		\pgfmathparse{\backcover@colratio@image/100}
	\fi
	\edef\backcover@colratio@image{\pgfmathresult}

	% Calculate available content height for upper and lower sections
	% Account for: top padding (0.05), and reserve space for bottom section (~0.12)
	% The vertical split applies to the remaining usable space
	\pgfmathparse{(1 - 0.05 - 0.12) * \textheight}
	\edef\backcover@availableheight{\pgfmathresult pt}

	% Calculate upper section height based on verticalsplit of available content area
	% This gives us the actual split point in the middle when verticalsplit=0.5
	\pgfmathparse{\backcover@verticalsplit * \backcover@availableheight}
	\edef\backcover@upperheight{\pgfmathresult pt}

	% Upper section two-column layout with dynamic sizing
	% This creates a flexible two-column layout where:
	% 1. The parbox constrains the upper section to the calculated height
	% 2. Column widths are calculated dynamically from the parsed ratios
	% 3. Image position (left/right) is configurable, swapping minipage order
	% 4. Placeholder images are generated using TikZ when no image is provided
	%
	% The \parbox with [t] alignment ensures content starts at the top, and the
	% calculated widths ensure columns fit exactly within the text width.
	% Upper section: Two-column layout with configurable ratio and image position
	% Constrain upper section to the calculated height
	\noindent
	\parbox[t][\backcover@upperheight][t]{\textwidth}{%
		% Calculate column widths from parsed ratios
		\pgfmathparse{\backcover@colratio@text * \textwidth}
		\edef\backcover@textwidth{\pgfmathresult pt}
		\pgfmathparse{\backcover@colratio@image * \textwidth}
		\edef\backcover@imagewidth{\pgfmathresult pt}
		\ifdefstring{\backcover@imageposition}{left}{%
		% Image on left, text on right
		\begin{minipage}[t]{\backcover@imagewidth}
			\raggedleft
			\vspace*{0pt}%
			% Image
			\ifx\backcover@image\@empty
				\begin{tikzpicture}[baseline=(current bounding box.north west), anchor=north west]
					\pgfmathparse{0.9 * \textwidth}
					\draw[fill=lightgrey!30, draw=lightgrey, line width=1pt] (0,0) rectangle (\pgfmathresult pt,\backcover@upperheight);
					\node[text=lightgrey, font=\sourcesanspro\small, align=center] at (0.45\textwidth,0.5\backcover@upperheight) {Image\\Placeholder};
				\end{tikzpicture}
			\else
				\begin{tikzpicture}[baseline=(current bounding box.north west), anchor=north west]
					\node[inner sep=0pt, opacity=\backcover@imageopacity] {
						\includegraphics[width=0.9\textwidth, height=\backcover@upperheight, keepaspectratio]{\backcover@image}
					};
				\end{tikzpicture}
			\fi
		\end{minipage}%
		\hspace{0.02\textwidth}%
		\begin{minipage}[t]{\backcover@textwidth}
			\raggedright
			\vspace*{0pt}%
			% Top content
			\ifx\backcover@topcontent\@empty\else
				{\color{\backcover@textcolor}\backcover@topcontent}\par
			\fi
		\end{minipage}
	}{%
		% Image on right, text on left (default)
		\begin{minipage}[t]{\backcover@textwidth}
			\raggedright
			\vspace*{0pt}%
			% Top content
			\ifx\backcover@topcontent\@empty\else
				{\color{\backcover@textcolor}\backcover@topcontent}\par
			\fi
		\end{minipage}%
		\hspace{0.02\textwidth}%
		\begin{minipage}[t]{\backcover@imagewidth}
			\raggedleft
			\vspace*{0pt}%
			% Image
			\ifx\backcover@image\@empty
				\begin{tikzpicture}[baseline=(current bounding box.north west), anchor=north west]
					\pgfmathparse{0.9 * \textwidth}
					\draw[fill=lightgrey!30, draw=lightgrey, line width=1pt] (0,0) rectangle (\pgfmathresult pt,\backcover@upperheight);
					\node[text=lightgrey, font=\sourcesanspro\small, align=center] at (0.45\textwidth,0.5\backcover@upperheight) {Image\\Placeholder};
				\end{tikzpicture}
			\else
				\begin{tikzpicture}[baseline=(current bounding box.north west), anchor=north west]
					\node[inner sep=0pt, opacity=\backcover@imageopacity] {
						\includegraphics[width=0.9\textwidth, height=\backcover@upperheight, keepaspectratio]{\backcover@image}
					};
				\end{tikzpicture}
			\fi
		\end{minipage}
		}%
	}

	% Divider or spacing between upper and lower halves (optional)
	\ifdefstring{\backcover@divider}{true}{%
		\vspace{0.02\textheight}
		\begin{center}
			{\color{\backcover@textcolor}\rule{0.3\textwidth}{0.5pt}}
		\end{center}
		\vspace{0.02\textheight}
	}{%
		\vspace{0.01\textheight}
	}

	% Lower section: Full-width bottom content area
	\ifx\backcover@bottomcontent\@empty\else
		\noindent
		\begin{minipage}{\textwidth}
			{\color{\backcover@textcolor}\backcover@bottomcontent}
		\end{minipage}
		\vspace{0.02\textheight}
	\fi

	% Bottom section with conditional ISBN/barcode rendering
	% This section handles multiple combinations of ISBN text, barcode image, and placeholder:
	%
	% Logic tree:
	% 1. If barcode image exists:
	%    - Show ISBN text above barcode (if ISBN provided)
	%    - Or show just barcode (if no ISBN)
	% 2. If no barcode image:
	%    - If ISBN provided:
	%      * Show ISBN + placeholder (if placeholder enabled)
	%      * Or show just ISBN (if placeholder disabled)
	%    - If no ISBN:
	%      * Show placeholder only (if placeholder enabled)
	%      * Or show nothing (if placeholder disabled)
	%
	% The alignment uses \hfill and [b] minipage alignment to ensure ISBN and barcode
	% align to the same right edge, creating a professional appearance.
	% Bottom section: ISBN barcode (right) and publisher/copyright (left)
	\vfill
	\noindent
	\begin{minipage}[b]{0.5\textwidth}
		\raggedright
		% Publisher info
		\ifx\backcover@publisher\@empty\else
			{\footnotesize\color{\backcover@textcolor}\backcover@publisher}\par
		\fi
		% Copyright notice
		\ifx\backcover@copyright\@empty\else
			{\footnotesize\color{\backcover@textcolor}\backcover@copyright}\par
		\fi
	\end{minipage}%
	\hfill
	\begin{minipage}[b]{0.45\textwidth}
		\raggedleft
		% ISBN barcode section
		\ifx\backcover@barcodeimage\@empty
			% No barcode image provided
			\ifx\backcover@isbn\@empty
				% No ISBN either
				\ifdefstring{\backcover@barcodeplaceholder}{true}{%
					% Placeholder option is true - create space for barcode, right-aligned
					\hfill\begin{tikzpicture}
						\draw[fill=white, draw=lightgrey, line width=0.5pt] (0,0) rectangle (4.5cm,1.8cm);
						\node[text=lightgrey, font=\sourcesanspro\tiny, align=center] at (2.25cm,0.9cm) {Barcode\\Placeholder};
					\end{tikzpicture}
				}{%
					% No placeholder - don't show anything
				}
			\else
				% ISBN text provided but no image - align ISBN and placeholder box to same right edge
				\ifdefstring{\backcover@barcodeplaceholder}{true}{%
					% Placeholder option is true - create space for barcode below ISBN, right-aligned
					\hfill\begin{minipage}[b]{4.5cm}
						\raggedleft
						{\footnotesize\color{\backcover@textcolor}\sourcesanspro\bfseries ISBN: \backcover@isbn}\par
						\vspace{3pt}
						\begin{tikzpicture}[baseline=(current bounding box.south west)]
							\draw[fill=white, draw=lightgrey, line width=0.5pt] (0,0) rectangle (4.5cm,1.8cm);
							\node[text=lightgrey, font=\sourcesanspro\tiny, align=center] at (2.25cm,0.9cm) {Barcode\\Placeholder};
						\end{tikzpicture}
					\end{minipage}
				}{%
					% No placeholder - just show ISBN text, right-aligned
					\hfill{\footnotesize\color{\backcover@textcolor}\sourcesanspro\bfseries ISBN: \backcover@isbn}\par
				}
			\fi
		\else
			% Barcode image provided
			\ifx\backcover@isbn\@empty\else
				% Show ISBN text above barcode if provided, align to same right edge as barcode
				\hfill\begin{minipage}[b]{4.5cm}
					\raggedleft
					{\footnotesize\color{\backcover@textcolor}\sourcesanspro\bfseries ISBN: \backcover@isbn}\par
					\vspace{3pt}
					\includegraphics[width=4.5cm, height=1.8cm, keepaspectratio]{\backcover@barcodeimage}
				\end{minipage}
			\else
				% No ISBN, just barcode image, right-aligned
				\hfill\includegraphics[width=4.5cm, height=1.8cm, keepaspectratio]{\backcover@barcodeimage}
			\fi
		\fi
	\end{minipage}

	\clearpage
	\nopagenumberstylefalse % Clear flag after back cover
}

%----------------------------------------------------------------------------------------
%	INDEX
%----------------------------------------------------------------------------------------

% Initialize index AFTER all key definitions to avoid xkeyval conflicts
% Customize index title formatting to use translated text
\renewcommand{\indexname}{\textIndex}

% Create index with 2 columns and add to TOC (title will use \indexname)
\makeindex[columns=2, intoc]

% Set the page style for index pages to use custom page style (no bottom page numbers)
\indexsetup{level=\chapter*, toclevel=chapter, noclearpage}

% Redefine index environment to use custom page style and formatting
\makeatletter
\renewenvironment{theindex}{%
	\if@twocolumn
		\@restonecolfalse
	\else
		\@restonecoltrue
	\fi
	\columnseprule \z@
	\columnsep 35\p@
	% Custom compact title instead of \@makeschapterhead
	\twocolumn[%
		\vspace*{30pt}% Reduced top space (was implicit in \@makeschapterhead)
		{\fontsize{36pt}{40pt}\sourcesanspro\bfseries\selectfont\MakeUppercase{\indexname}\par}%
		\vspace{20pt}% Space after title
	]%
	% Add index to table of contents
	\phantomsection
	\addcontentsline{toc}{chapter}{\indexname}%
	\@mkboth{\MakeUppercase\indexname}%
	{\MakeUppercase\indexname}%
	\thispagestyle{custompagestyle}% Use custom page style instead of plain
	\parindent\z@
	\parskip\z@ \@plus .3\p@\relax
	\let\item\@idxitem
}{%
	\if@restonecol
		\onecolumn
	\else
		\clearpage
	\fi
}
\makeatother

%----------------------------------------------------------------------------------------
%	HYPERREF AND BOOKMARK (load at the end to fix TOC links)
%----------------------------------------------------------------------------------------

% Load hyperref as the last package to avoid conflicts
\usepackage{hyperref}
% Expand startpage value for hyperref
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	linktoc=page, % Make only page numbers clickable
	pdfstartpage=1 % Use the configured start page number
}

% Load bookmark package AFTER hyperref to fix TOC and bookmark issues
% Regenerates bookmarks and corrects page references that hyperref may misidentify
\usepackage{bookmark}
\bookmarksetup{
	open, % Open bookmarks by default
	numbered, % Show numbers in bookmarks
}
