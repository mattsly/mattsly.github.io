
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
