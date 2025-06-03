# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Use Ruby 3.3.0 locally (works fine with GitHub Pages)
# GitHub Pages uses 3.3.4 in production but local dev doesn't need exact match
ruby "3.3.0"

gem "minima"
gem "github-pages", "~> 228", group: :jekyll_plugins
# note that version comes from here: https://pages.github.com/versions/
gem "webrick", "~> 1.8"
gem 'jekyll-target-blank', group: :jekyll_plugins
