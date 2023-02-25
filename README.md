
This is a super simple static site blog based on:

https://docs.github.com/en/pages/quickstart

https://jekyllrb.com


### Running locally:

`bundle install`

`bundle exec jekyll serve`

On deploy, it will automatically publish to https://mattsly.github.io/mattsly.com/

Domain configuration is in the repo settings on GitHub

### overriding theme defaults

To override the theme defaults, copy the related file from the gem to the corresponding directory (this is what I've done for layouts/home and includes/footer)

To find the defaults run `bundle info --path minima`

...and then open in Finder and copy to the same path in this repo

### notes on GH set up

1. Verify domain here: https://github.com/settings/pages
2. Need to use https://github.com/mattsly/mattsly.github.io - which is set up at the root of mattsly.github.io (oringally I created a new project for mattsly.com which was serving at mattsly.github.io/mattsly.com - i.e. repo name...)