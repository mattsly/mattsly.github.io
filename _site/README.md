
This is a super simple static site blog based on:

https://docs.github.com/en/pages/quickstart

https://jekyllrb.com


### running locally:

`bundle`

`bundle exec jekyll serve`

it will starting running at http://127.0.0.1:4000 ()


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