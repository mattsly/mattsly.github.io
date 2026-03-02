This is a super simple static site blog based on:

https://docs.github.com/en/pages/quickstart

https://jekyllrb.com

## Development Setup

This site uses Jekyll and GitHub Pages.

### Prerequisites

- Ruby 3.3.4 (install via your preferred version manager)
- Bundler

### running locally:

cd to directroy root: `cd /Users/mattsly/Sites/GitHub/mattsly.github.io`

`bundle`

`bundle exec jekyll serve`

it will starting running at http://127.0.0.1:4000

On deploy, it will automatically publish to https://mattsly.github.io/mattsly.com/

Domain configuration is in the repo settings on GitHub

### deploying

For now, I'm just committing everything to main. Once it's pushed to GitHub it will automatically deploy. namecheap.com is where the domain is registered and the DNS is set up (previously mattsly.com was hosted on S3)

### overriding Jekyll theme defaults

To override a Jekyll theme default, copy the related file from the gem to the corresponding directory (this is what I've done for layouts/home and includes/footer)

To find the defaults run `bundle info --path minima`

...and then open in Finder and copy to the same path in this repo

### notes on GitHub Pages set up

1. Verify domain here: https://github.com/settings/pages
2. Need to use https://github.com/mattsly/mattsly.github.io - which is set up at the root of mattsly.github.io (originally I created a new project for mattsly.com which was serving at mattsly.github.io/mattsly.com - i.e. repo name...)

### Site Features

- All external links automatically open in a new tab thanks to the `jekyll-target-blank` plugin
- To add new posts, create markdown files in the `_posts` directory following the naming convention `YYYY-MM-DD-title.md`
- Drafts live in `_drafts` (no date prefix) and can be previewed locally with `bundle exec jekyll serve --drafts`
- Images should be placed in the `/assets/` directory

### Image Paste Workflow (macOS)

1. Copy an image to your clipboard.
2. Run `scripts/paste-image.sh` from the repo root.
3. The image is saved to `assets/` with a timestamped filename, and the markdown is pasted into the frontmost app.

Notes:
- Use `scripts/paste-image.sh --no-paste` to only copy markdown to the clipboard.
- The first run may prompt for Accessibility permissions for "System Events".
- For best results, install `pngpaste` (`brew install pngpaste`). The script falls back to AppleScript if it's not available.

### markdown cheatsheet
https://www.markdownguide.org/cheat-sheet/

# H1
## H2
### H3

**bold text**

*italicized text*

> blockquote

![alt text](image.jpg)

[title](https://www.example.com)

- First item
- Second item
- Third item

1. First item
2. Second item
3. Third item

`code`
