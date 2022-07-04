# Create a new file from template (use `default` for default template)
new TEMPLATE TITLE:
    hugo new posts/{{TITLE}}.md -k {{TEMPLATE}}

# Build non-minified
build:
    hugo

# Build minified (production)
build-min:
    hugo --minify

# Run development server to preview
dev:
    hugo server

# For when I forget deep-cloning the theme submodule
get-theme:
    git submodule update --init
