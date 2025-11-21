# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

[1.2.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.1.1...v1.2.0
[1.1.1]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/AshDevFr/latex-cookbook-template/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/AshDevFr/latex-cookbook-template/releases/tag/v1.0.0
