# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

[3.0.1]: https://github.com/AshDevFr/latex-cookbook-template/compare/v3.0.0...v3.0.1

## [3.0.1] - 2025-12-25

### Changed

- Fix formating when no tags are present

[3.0.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v2.1.0...v3.0.0

## [3.0.0] - 2025-12-23

### ⚠️ BREAKING CHANGES

- **Removed `spicy` and `vegetarian` recipe parameters**: These parameters have been replaced by the unified tag icon system

  - **Old syntax (v2.1.0)**:
    ```latex
    \recipe{
        spicy={true},
        vegetarian={true},
        ...
    }
    ```
  - **New syntax (v3.0.0)**:
    ```latex
    \recipe{
        tags={Spicy, Vegetarian},
        ...
    }
    ```
  - **Rationale**: The tag-based system is more flexible, allowing any number of dietary indicators and custom icons, not just spicy and vegetarian
  - **Migration required**: Replace `spicy={true}` with `tags={Spicy}` and `vegetarian={true}` with `tags={Vegetarian}` (or combine them in the tags list)

- **Removed emoji customization commands**: `\setspicyemoji{}` and `\setvegetarianemoji{}` are no longer available

  - Use `\registerTagIcon{}{}{}` instead to customize tag icons
  - **Example migration**:

    ```latex
    % Old (v2.1.0)
    \setspicyemoji{fire}
    \setvegetarianemoji{herb}

    % New (v3.0.0)
    \registerTagIcon{Spicy}{emoji}{fire}
    \registerTagIcon{Vegetarian}{emoji}{herb}
    ```

### Added

- **Equipment parameter**: New optional recipe parameter for listing specialized equipment

  - Add equipment with `equipment={Item1, Item2, Item3}` (comma-separated list)
  - Equipment is displayed as badges below the tags list
  - Only appears when populated (empty by default)
  - Useful for highlighting non-standard equipment like specific pan sizes, specialized tools, or equipment that affects recipe outcome
  - Example: `equipment={9-inch round cake pans, Electric mixer, Wire rack}`

- **Tag icon system**: Complete redesign of recipe indicators using a flexible tag-to-icon mapping system

  - Register custom tag icons with `\registerTagIcon{TagName}{type}{content}`
  - Support for both emoji icons (e.g., 🌶️) and text icons (e.g., "GF")
  - Default icons registered for common tags: Spicy 🌶️, Vegetarian 🌱, Vegan (V), Gluten-Free (GF), Dairy-Free (DF)
  - Icons automatically display in recipe header when corresponding tags are used
  - Tags without registered icons are silently skipped

- **Tag icon spacing**: Icons now have configurable spacing between them (default: 5pt)

  - Multiple tag icons no longer appear crowded together
  - Customize via `\setlength{\tagiconspacing}{<length>}`

- **Configurable tag icon appearance**: New length variables for customizing tag icon display
  - `\tagiconspacing`: Space between icons (default: 5pt)
  - `\tagiconsize`: Icon font size (default: 16pt)
  - `\tagiconlineheight`: Icon line height (default: 20pt)
  - All settings can be adjusted in the document preamble

### Changed

- Tag icon rendering now only adds spacing between actually rendered icons (tags without registered icons don't create gaps)
- Icon size default changed from 18pt to 16pt for better visual balance
- Updated documentation in [docs/recipe-command.md](docs/recipe-command.md) with tag icon system and customization examples

### Removed

- `spicy={true/false}` recipe parameter (use `tags={Spicy}` instead)
- `vegetarian={true/false}` recipe parameter (use `tags={Vegetarian}` instead)
- `\setspicyemoji{}` command (use `\registerTagIcon{Spicy}{emoji}{...}` instead)
- `\setvegetarianemoji{}` command (use `\registerTagIcon{Vegetarian}{emoji}{...}` instead)
- `\spicyicon` command (now handled automatically by tag system)
- `\vegetarianicon` command (now handled automatically by tag system)

[2.1.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v2.0.0...v2.1.0

## [2.1.0] - 2025-12-03

### Added

- **Modular translation system**: Translations are now organized in separate files in the `translations/` directory
  - `translations/cookbook-english.def` - English translations
  - `translations/cookbook-french.def` - French translations
  - `translations/README.md` - Comprehensive guide for contributors adding new languages
- Translation files are automatically loaded based on the selected language option

### Changed

- **Improved documentation structure**: Eliminated duplicate content between documentation files
  - `docs/translation.md` - Updated with user-focused translation customization guide
  - `translations/README.md` - New contributor-focused guide for adding languages
  - Cross-references between documentation files for better navigation
  - Updated main `README.md` with translation contribution guidelines

### Improved

- **Easier translation maintenance**: Each language is now in its own file
- **Simplified adding new languages**: Contributors can now add languages without modifying the main class file
- **Better organized documentation**: Clear separation between user and contributor documentation

[2.0.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.5.0...v2.0.0

## [2.0.0] - 2025-11-27

### ⚠️ BREAKING CHANGES

- **`\ingredient` command syntax has been completely redesigned** for better semantic clarity:

  - **Old syntax (v1.5.0)**: `\ingredient{quantity}[unit][name][note]`
  - **New syntax (v2.0.0)**: `\ingredient{name}[quantity][unit][note]`
  - **Rationale**: The ingredient name is now the primary (required) parameter, with quantity, unit, and note as optional parameters. This aligns better with semantic structure where the ingredient name is the most important piece of information.
  - **Migration required**: All existing `\ingredient` commands must be updated to use the new syntax.
  - **Example migration**:

    ```latex
    % Old (v1.5.0)
    \ingredient{2}[cups][all-purpose flour]

    % New (v2.0.0)
    \ingredient{all-purpose flour}[2][cups]
    ```

### Changed

- Updated sample files ([cookbook-sample.tex](samples/cookbook-sample.tex), [cookbook-sample-fr.tex](samples/cookbook-sample-fr.tex), [cookbook-sample-print.tex](samples/cookbook-sample-print.tex)) to use new ingredient syntax

[1.5.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.4.0...v1.5.0

## [1.5.0] - 2025-11-26

### Changed

- Enhanced `\ingredient` command to support structured syntax with separate quantity, unit, name, and note parameters
  - New syntax: `\ingredient{quantity}[unit][name][note]`
  - Maintains backward compatibility with single-argument format: `\ingredient{200g flour}`
  - Allows structured ingredient formatting for better consistency and readability
  - Supports optional parameters: empty brackets `[]` can be used to skip optional fields

[1.4.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.3.0...v1.4.0

## [1.4.0] - 2025-11-26

### Added

- Unicode fraction characters support for ingredients and instructions

[1.3.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.2.0...v1.3.0

## [1.3.0] - 2025-11-23

### Added

- Recipe `fullpage` option to control whether recipes take a full page or can flow naturally
  - When `fullpage=true` (default): Recipes display images and clear the page after completion
  - When `fullpage=false`: Recipes do not display images and do not force a page break, allowing compact recipes to appear on the same page or flow naturally
- Recipe `clearpageafter` option to control page breaks after recipes
  - When `clearpageafter=true` (default): Forces a page break after the recipe
  - When `clearpageafter=false`: No page break after the recipe, allowing content to flow naturally
  - Only effective when `fullpage=true`; automatically set to `false` when `fullpage=false`
  - Useful for adding compact recipes after long full-page recipes that span multiple pages

### Fixed

- Fixed recipenote counter not persisting between ingredients and instructions sections

[1.2.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.1.1...v1.2.0

## [1.2.0] - 2025-11-19

### Added

- Recipe notes system with `\note{...}` command for adding contextual notes to ingredients and instructions
- Automatic note numbering and collection at the bottom of recipes
- Customizable "Notes" label via `\setTextNotes{<text>}` command

### Fixed

- Fixed tag duplicate checking to prevent duplicate tags when explicitly added tags match auto-generated tags (e.g., `spicy={yes}` and `tags={Spicy}`)

[1.1.1]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.1.0...v1.1.1

## [1.1.1] - 2025-11-19

### Fixed

- Fixed image display issue in `makechapterpage` on left pages

[1.1.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.0.0...v1.1.0

## [1.1.0] - 2025-11-19

### Added

- Bleed margin support for professional printing with `bleed` class option (default: 0.125in/3.175mm)
- Debug mode (`bleed=debug`) to visualize trim and bleed boundaries with colored lines
- Margin customization commands: `\setmargintop`, `\setmarginbottom`, `\setmarginleft`, `\setmarginright`
- Bleed value customization via `\setbleedvalue{<length>}`
- Gutter margin support via `\setguttermargin{<length>}` for binding offset in two-sided printing
- Programmatic bleed control via `\enablebleed[<length>]` command

### Changed

- All page types (cover, preface, chapter, image, recipe, back cover) now extend content into bleed area when enabled
- Page number boxes automatically adjust position based on bleed settings
- Geometry package configuration now properly distinguishes between two-sided (inner/outer) and one-sided (left/right) margins
- Image positioning calculations updated to account for bleed extensions

### Notes

- **Backward compatible**: Existing documents compile without modifications
- See documentation for print production workflow and bleed setup examples

[1.0.0]: https://github.com/AshDevFr/latex-cookbook-template/releases/tag/v1.0.0

## [1.0.0] - 2025-11-18

### Added

- Initial release of LaTeX Cookbook Template
- Complete book structure support:
  - Cover page with customizable title, subtitle, author, and background image
  - Preface pages with single and double-page layouts
  - Chapter divider pages with vertical text and images
  - Table of contents with custom formatting
  - Index generation with automatic sorting and formatting
  - Back cover with ISBN barcode support
- Recipe system:
  - Two layout options: columns (ingredients/instructions side-by-side) and simple (stacked)
  - Configurable recipe metadata (serves, prep time, cooking time, difficulty, origin)
  - Recipe indexing with hierarchical entries
  - Tag system with customizable display
  - Automatic emoji icons for dietary indicators (spicy, vegetarian)
  - Image support with top/bottom positioning
- Multi-language support (English and French) via babel package with overridable translations
- Full-page image pages with optional captions
- Conversion tables page with US/Imperial and metric measurements
- Page layout options:
  - Configurable left page (even/odd)
  - Customizable start page number
  - Two-sided and one-sided printing support
- Extensive customization:
  - Custom color scheme (dark grey, light grey, pale orange)
  - Typography using TeX Gyre Pagella with Source Sans Pro accents
  - Adjustable spacing for lists, columns, and recipe elements
  - Emoji customization for recipe indicators
- Build automation with included shell script
- Comprehensive documentation with usage examples
