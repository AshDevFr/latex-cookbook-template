# LaTeX Cookbook Template

> A professional, customizable LaTeX template for creating beautiful cookbooks and recipe collections.

<div align="center">

![Example](images/samples/cookbook-sample_6-7.png)

[Features](#features) • [Quick Start](#quick-start) • [Documentation](docs/) • [Examples](#examples)

</div>

## ✨ Features

- 📖 **Full Book Structure** - Cover, preface, chapters, table of contents, index, and back cover
- 🌍 **Multi-Language Support** - Built-in English and French translations via babel
- 🎨 **Flexible Layouts** - Multiple recipe layouts (columns, simple) and customizable spacing
- 🖼️ **Rich Media** - Full-page images, recipe photos, and chapter dividers
- 🏷️ **Smart Organization** - Automatic recipe indexing, tagging system with emoji icons
- 📝 **Recipe Notes** - Add contextual notes to ingredients and instructions with automatic numbering
- 📏 **Conversion Tables** - Built-in measurement conversion pages
- 🖨️ **Print Production** - Bleed margins and gutter settings for book printing
- ⚙️ **Highly Customizable** - Control colors, fonts, spacing, margins, and more
- 🔧 **Easy Compilation** - Included build script for hassle-free PDF generation

## 🚀 Quick Start

### Requirements

- LaTeX distribution (TeX Live, MiKTeX, etc.)
- LuaLaTeX engine
- The `babel` package (included in most distributions)

### Installation

1. Clone this repository:

```bash
git clone https://github.com/AshDevFr/latex-cookbook-template.git
cd latex-cookbook-template
```

2. Compile your cookbook:

```bash
./build.sh
```

Your PDF will be generated in the `dist/` directory.

### Docker Build (Alternative)

If you prefer to build in a controlled environment using Docker:

1. Build and run with Docker Compose:

```bash
docker compose run --rm build
```

2. For more build options (verbose mode, force clean build):

```bash
docker compose run --rm build ./build.sh -v    # Verbose mode
docker compose run --rm build ./build.sh -f    # Force clean build
docker compose run --rm build ./build.sh -v -f  # Both options
```

The Docker setup uses the same dependencies as the CI environment, ensuring consistent builds across different systems.

### Basic Usage

```latex
\documentclass[letterpaper, 10pt, twoside, english]{CookBook}

\begin{document}

% Cover page
\makecoverpage{
    title={My Cookbook},
    subtitle={Family Recipes},
    author={Your Name},
    image={images/book/cover.jpg}
}

% Table of contents
\maketoc

% Chapter
\makechapterpage{
    title={Breakfast},
    image={images/book/breakfast.jpg}
}

% Recipe
\recipe{
    title={Banana Pancakes},
    serves={4},
    preptime={10 mins},
    cookingtime={15 mins},
    tags={Breakfast, Sweet, Vegetarian},
    vegetarian={yes},
    ingredients={
        \ingredient{2 ripe bananas, mashed}
        \ingredient{2 eggs}
        \ingredient{1/2 cup flour}
    },
    instructions={
        \instruction{Mix all ingredients together.}
        \instruction{Cook on a hot griddle until golden.}
        \instruction{Serve with maple syrup.}
    }
}

\end{document}
```

## 📚 Documentation

Comprehensive documentation is organized by topic in the [`docs/`](docs/) directory.

### Documentation Index

**Getting Started:**
- [Document Class Options](docs/document-class-options.md) - Paper size, fonts, layout, bleed settings
- [Build System](docs/build-system.md) - Compilation and build instructions

**Page Components:**
- [Cover and Preface](docs/cover-and-preface.md) - Front matter pages
- [Chapters and Navigation](docs/chapters-and-navigation.md) - Chapter pages and table of contents
- [Full-Page Images](docs/full-page-images.md) - Dramatic recipe images
- [Conversion Tables](docs/conversion-tables.md) - Measurement conversion pages
- [Back Cover and Index](docs/back-cover-and-index.md) - Back matter pages

**Recipe System:**
- [Recipe Command](docs/recipe-command.md) - Main recipe command and parameters
- [Recipe Layouts](docs/recipe-layouts.md) - Layout options and configurations
- [Recipe Elements](docs/recipe-elements.md) - Ingredients, instructions, notes

**Customization:**
- [Colors](docs/colors.md) - Color definitions and usage
- [Margins and Spacing](docs/margins-and-spacing.md) - Page layout and spacing controls
- [Fonts](docs/fonts.md) - Font configuration
- [Translation and Language Support](docs/translation.md) - Multi-language support and text customization

**Additional Resources:**
- [Complete Examples](docs/examples.md) - Full cookbook examples
- [Troubleshooting](docs/troubleshooting.md) - Common issues and solutions
- [CHANGELOG.md](CHANGELOG.md) - Version history and changes

## 🖼️ Examples

<table>
  <tr>
    <td><img src="images/samples/cookbook-sample_2-3.png" alt="Chapter Page"/></td>
    <td><img src="images/samples/cookbook-sample_6-7.png" alt="Recipe Page"/></td>
  </tr>
  <tr>
    <td><img src="images/samples/cookbook-sample_10-11.png" alt="Recipe with Image"/></td>
    <td><img src="images/samples/cookbook-sample_14-15.png" alt="Simple Layout"/></td>
  </tr>
  <tr>
    <td><img src="images/samples/cookbook-sample_24-25.png" alt="Multi-page Recipe"/></td>
    <td><img src="images/samples/cookbook-sample_30-31.png" alt=Compact Recipe"/></td>
  </tr>
</table>

<details>
<summary>View More Examples</summary>

### Cover and Back Cover

<table>
  <tr>
    <td><img src="images/samples/cookbook-sample_1.png" alt="Front Cover"/></td>
    <td><img src="images/samples/cookbook-sample_36.png" alt="Back Cover"/></td>
  </tr>
</table>

### Conversion Table and Index

The template supports conversion tables and index pages.

<table>
  <tr>
    <td><img src="images/samples/cookbook-sample_32-33.png" alt="Conversion Table"/></td>
    <td><img src="images/samples/cookbook-sample_34.png" alt="Index"/></td>
  </tr>
</table>

### English Examples

<table>
  <tr>
    <td><img src="images/samples/cookbook-sample_8-9.png" alt="Example 1"/></td>
    <td><img src="images/samples/cookbook-sample_12-13.png" alt="Example 2"/></td>
  </tr>
  <tr>
    <td><img src="images/samples/cookbook-sample_26-27.png" alt="Example 3"/></td>
    <td><img src="images/samples/cookbook-sample_28-29.png" alt="Example 4"/></td>
  </tr>
</table>

### French Examples

The template supports French language.

<table>
  <tr>
    <td><img src="images/samples/cookbook-sample-fr_2-3.png" alt="French Example 1"/></td>
    <td><img src="images/samples/cookbook-sample-fr_6-7.png" alt="French Example 2"/></td>
  </tr>
</table>

### Print Version

The template supports print production with bleed margins.

<table>
  <tr>
    <td><img src="images/samples/cookbook-sample-print_2-3.png" alt="Print Example 1"/></td>
    <td><img src="images/samples/cookbook-sample-print_6-7.png" alt="Print Example 2"/></td>
  </tr>
</table>

</details>

## 🗂️ Project Structure

```
latex-cookbook-template/
├── cookbook.cls              # Main LaTeX class file
├── build.sh                  # Build script for compilation
├── Dockerfile                # Docker configuration for controlled builds
├── docker-compose.yml        # Docker Compose configuration
├── README.md                 # This file
├── CHANGELOG.md              # Version history
├── docs/                     # Comprehensive documentation (organized by topic)
│   ├── README.md            # Documentation index
│   ├── document-class-options.md
│   ├── recipe-command.md
│   ├── translation.md
│   └── ... (and more)
├── samples/                  # Example cookbook files
│   ├── cookbook-sample.tex
│   └── cookbook-sample-fr.tex
├── images/
│   ├── book/                # Cover and chapter images
│   └── recipes/             # Recipe photos
├── dist/                    # Generated PDFs (created by build script)
└── tmp/                     # Temporary build files
```

## 🤝 Contributing

Contributions are welcome! Whether it's bug reports, feature requests, or code contributions:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This template is licensed under CC BY-NC-SA 4.0 - see the [Creative Commons website](https://creativecommons.org/licenses/by-nc-sa/4.0/) for details.

**Attribution:** You are free to use this template for non-commercial purposes. If you share or adapt this template, you must give appropriate credit and license your work under the same terms.

## 🙏 Acknowledgments

This template was conceptually inspired by:

- **[Jacopo Recipe](https://www.latextemplates.com/template/jacopo-recipe)** by Vel - two-column recipe layout concept
- **[Cookbook Layout with Orange Accents](https://stock.adobe.com/templates/cookbook-layout-with-orange-accents/325823688)** (Adobe Stock) - page numbering and chapter layout design

This is an independent implementation with significant extensions including multi-language support, full book structure, recipe indexing, conversion tables, and extensive customization options.

## 👤 Author

**AshDevFr**

- GitHub: [@AshDevFr](https://github.com/AshDevFr)

## ⭐ Support

If you find this template useful, please consider giving it a star on GitHub! It helps others discover the project.

---

<div align="center">
Made with ❤️ for home cooks and cookbook creators
</div>
