Thesis writing in LaTeX
=======================

* [LaTeX general](#latex-general)
* [Thesis writing](#thesis-writing)
* [Example document](#example-document)
* [And finally](#and-finally)

## LaTeX general

* Install [TeXLive][]. It’s the One True™ TeX distribution system.

* Need help? `texdoc <packagename>` on the command line.
    * At the very least *skim* the documentation of every package you’re using,
      to look for gotchas and interesting options

* Still need help? Google, <http://tex.stackexchange.com>

* If you are Jon Snow (you know nothing): `texdoc lshort`
  – “The not so short introduction to LaTeX”

* Learn the basics of typography: LaTeX supports you but it won’t coddle you
    * Use typographically correct punctuation *and spacing*
    * English quotes: `“…”` (or <code>\`\`…''</code>)
    * Need a minus sign: math mode!
    * Use wide margins, narrow text
        * But do use the margins when it makes sense
    *  [By all that’s holy][faq-spacing]: **USE SINGLE LINE SPACING**.
    * Correctly typeset gene names, protein names, species names (italic,
      straight, italic) …

* Don’t use outdated packages
    * Use [`polyglossia`][polyglossia] instead of `babel`
    * Use [`biblatex`][biblatex], not `bibtex`
    * Don’t use `inputenc`, `utf8` …

* The golden rule of TeX: **Use semantic markup**: write macros to encapsulate
  style into semantically meaningful units

* LaTeX is unforgiving, but not forthcoming with error messages. Use
  [`nag`][nag] to get better warnings (see example template for usage).

* Use the [`fixltx2e`][fixltx2e] package to fix some bugs in LaTeX.

* `\figure` and `\table` are *floating* environments. They float. That is their
  purpose. If you really want figures with a fixed position (but consider this
  carefully), don’t use `\figure`, and use `\captionof` to create a non-floating
  caption.

* Use `latexmk` to build your document
    * It automatically runs the required auxiliary programs (`bibtex`,
      `biber` …), and the necessary number of times
    * Want live preview? `latexmk -pvc`
    * Highly configurable, but works well out of the box

* On OS X? Use [Skim][] as the document viewer instead of Preview.app.

* Use XeLaTeX/LuaTeX. Do *not* use `pdfLaTeX`
    * `pdfLaTeX` is old and revered – let it rest in peace
    * In particular, no support for UTF-8 (yes: not even with auxiliary
      packages)
    * No great support for non-8-bit fonts
    * `latexmk -xetex`

* Want to change margins/metrics? Do not muck around with lengths, use
  [`geometry`][geometry]

* Don’t use the standard document classes, use the replacements from
  [KOMA-Script][KOMA]
  * Don’t be put off by the fact that KOMA’s `\maketitle` creates lots of pages.
    This is intentional – read the relevant section in the documentation.

* Some bibliography managers allow exporting BibTeX references with custom cite
  keys (usually of the format `Author:Year`) – this makes usage with LaTeX
  vastly easier

* For numbers and units in text, use [`siunitx`][siunitx]. I recomment not using
  naked numbers in text at all (always use `\num{x}` instead).

* [`todonotes`][todonotes] for “TO DO”s. However, this interacts badly with
  `classicthesis`.

* Avoid writing non-simple macros: programming in LaTeX is a nightmare. Use
  existing packages instead.

## Thesis writing

* Use Git from the start, commit changes religiously

* Organisation
    * One file per chapter
        * Use logical names, not `chapter1.tex` etc so the otder can be changed
          effortlessly
    * Have an outline handy (separate document)
    * Configuration separate from main document

* Use [`classicthesis`][classicthesis] in combination with KOMA’s `scrbook`.
    * Based on best practices of print design and typography
    * *No*, its margins are not too wide

* University of Cambridge templates exist. However, they are a typographer’s
  nightmare (cf. line spacing, text width) and extremely convoluted, thus hard
  to customise
  * [Template from Engineering department][template-engineering]
    * Used by Nenad, had some bugs and we took days to fix some margin problems
    * However, updated since, maybe better now
  * [Template from Computer Science department][template-cs]
    * [Used by Samuel][sam-thesis], successfully

## Example document

The example file `thesis.tex` contains the outline for a thesis source document.
Each chapter has its own file and is included via `\input`. Configuration and
custom macros reside in `config.tex`. This is also where packages should be
loaded.

`.latexmkrc` is the configuration for `latexmk`. At the moment it is empty
except for a commented-out line which would cause it to pass the `-shell-escape`
option to `xelatex`. This option is required by certain packages, such as
`minted`.

Finally, the `Makefile` enables compilation via simple `make` verbs. To
recompile the document, use

```bash
make
# or
make thesis
```

To trigger continuous background compilation for interactive preview, use

```bash
make preview
```

### Requirements

The example file requires the following fonts to be available for successful
compilation:

* [TeX Gyre Pagella][tex-gyre]
* [Droid Sans][droid]
* Droid Sans Mono

Download the fonts (for the last two, go on the website and click the
“download”/arrow button) and install them on your system.

## And finally

Need inspiration? Take a look here:

* `texdoc tikz`
* `texdoc pgfplots`
* [Showcase of beautiful typography done in TeX][showcase]

[TeXLive]: https://www.tug.org/texlive/
[faq-spacing]: http://www.tex.ac.uk/cgi-bin/texfaq2html?label=linespace
[Skim]: http://skim-app.sourceforge.net/
[fixltx2e]: http://www.ctan.org/pkg/fixltx2e
[nag]: http://www.ctan.org/pkg/nag
[polyglossia]: http://www.ctan.org/pkg/polyglossia
[biblatex]: http://www.ctan.org/pkg/biblatex
[geometry]: http://www.ctan.org/pkg/geometry
[KOMA]: http://www.ctan.org/pkg/koma-script
[classicthesis]: http://www.ctan.org/pkg/classicthesis
[siunitx]: http://www.ctan.org/pkg/siunitx
[todonotes]: http://www.ctan.org/pkg/todonotes
[template-engineering]: https://github.com/kks32/phd-thesis-template
[template-cs]: https://github.com/cambridge/thesis
[sam-thesis]: https://github.com/loopasam/thesis
[showcase]: http://tex.stackexchange.com/q/1319/42
[tex-gyre]: http://www.gust.org.pl/projects/e-foundry/tex-gyre/pagella/qpl2.004otf.zip
[droid]: http://www.google.com/fonts#UsePlace:use/Collection:Droid+Sans|Droid+Sans+Mono
