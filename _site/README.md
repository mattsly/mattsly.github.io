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

### Post visibility

The site has two content sections with different visibility rules:

**`/writing`** — shows all posts *except* those in `_posts/monthly/`. Exclusion is based purely on directory path, no frontmatter needed.

**`/monthly`** — shows only posts from `_posts/monthly/`, excluding any with `status: draft` in their frontmatter. Use `status: draft` for in-progress monthly posts you want to preview via direct URL but not yet list publicly (e.g. the current month). All monthly posts are technically public at their permalink — they're just unlinked until ready.

### Pasting Images into Markdown

Install the [Paste Image](https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image) extension by mushanshitiancai in VS Code.

**Usage:** With the cursor placed where you want the image in your markdown file, press `Cmd+Option+V`. The extension will:

1. Save the clipboard image to `assets/` named after the current file (e.g., editing `2024-01-01-cancer-essay.md` produces `assets/2024-01-01-cancer-essay-2024-01-01-10-30-00.png`)
2. Insert the correct markdown reference at the cursor: `![](/assets/filename.png)`

The `.vscode/settings.json` in this repo is already configured — no extra setup needed beyond installing the extension.

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
