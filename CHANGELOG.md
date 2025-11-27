# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.0] - 2025-11-26

### Changed

- Enhanced `\ingredient` command to support structured syntax with separate quantity, unit, name, and note parameters
  - New syntax: `\ingredient{quantity}[unit][name][note]`
  - Maintains backward compatibility with single-argument format: `\ingredient{200g flour}`
  - Allows structured ingredient formatting for better consistency and readability
  - Supports optional parameters: empty brackets `[]` can be used to skip optional fields

## [1.4.0] - 2025-11-26

### Added

- Unicode fraction characters support for ingredients and instructions

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

## [1.2.0] - 2025-11-19

### Added

- Recipe notes system with `\note{...}` command for adding contextual notes to ingredients and instructions
- Automatic note numbering and collection at the bottom of recipes
- Customizable "Notes" label via `\setTextNotes{<text>}` command

### Fixed

- Fixed tag duplicate checking to prevent duplicate tags when explicitly added tags match auto-generated tags (e.g., `spicy={yes}` and `tags={Spicy}`)

## [1.1.1] - 2025-11-19

### Fixed

- Fixed image display issue in `makechapterpage` on left pages

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

[1.5.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.4.0...v1.5.0
[1.4.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.1.1...v1.2.0
[1.1.1]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/AshDevFr/latex-cookbook-template/releases/tag/v1.0.0
