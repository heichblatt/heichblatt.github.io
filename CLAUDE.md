# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal blog website built with **Hugo** (v0.154.5), a static site generator. The site is published at https://hanneseichblatt.de and deployed automatically to GitHub Pages when changes are pushed to the `master` branch.

## Project Structure

```
content/
  posts/           # Blog posts go here
  about.md         # Static about page
archetypes/        # Content templates for new posts
  default.md       # Standard post template
  selected-readings.md  # Template for "selected readings" posts
themes/
  hugo-paper/      # Git submodule: the site theme
static/            # Static assets (CSS, fonts, etc.)
hugo.toml          # Hugo configuration
Makefile           # Development commands
```

## Development Workflow

### Starting a Local Server

```bash
make serve
```

This runs Hugo in a Docker container at `localhost:1313` with live reload and future-dated content enabled (`--buildFuture`). The container is named `www-hanneseichblatt-de` and mounts the current directory.

To clean up the container:
```bash
make clean
```

### Creating New Posts

Use Hugo's archetype system to create new posts with the correct template:

**Standard blog post:**
```bash
hugo new posts/YYYY-MM-DD-post-title.md
```

**Selected Readings post** (weekly/monthly reading roundup):
```bash
hugo new -k selected-readings posts/202X-WXX-selected-readings.md
```

Both create a new markdown file in `content/posts/` with the appropriate front matter. Remove `draft: true` and add a publication date to publish the post.

### Post Front Matter

Posts use YAML front matter:
```yaml
---
title: "Post Title"
date: YYYY-MM-DD
draft: true/false
tags:
    - tag1
    - tag2
---
```

- `draft: true` hides unpublished posts (except with `--buildFuture`)
- `date` controls publication date and sorting
- `tags` are used for categorization (e.g., "tech", "comment")

## Theme: hugo-paper

The site uses the lightweight **hugo-paper** theme (git submodule at `themes/hugo-paper/`). Configuration is in `hugo.toml`:
- Color scheme: `gray` (options: linen, wheat, gray, light)
- Social links: Twitter, GitHub, LinkedIn, Mastodon
- Taxonomies: tags, categories, series

The theme supports shortcodes like `{{< youtube VIDEO_ID >}}` for embedding YouTube videos.

## Building and Deployment

The site is automatically built and deployed via GitHub Actions (`.github/workflows/hugo.yml`). The workflow:
1. Installs Hugo, Dart Sass, and dependencies
2. Builds the site with `hugo --minify`
3. Deploys to GitHub Pages

**Manual build** (if needed):
```bash
hugo --minify
```

Output is generated in the `public/` directory.

## Configuration Notes

- **baseURL**: https://hanneseichblatt.de/ (used for canonical links and absolute paths)
- **Unsafe HTML**: Markdown rendering allows raw HTML (`<sub>`, `<sup>`, `kbd`, `mark` tags)
- **Instagram API errors ignored**: The Hugo Instagram shortcode is deprecated; build errors are suppressed
- **Privacy**: Privacy-enhanced YouTube embeds enabled; simple Instagram/X/Vimeo rendering

## Content Organization

- Posts are ordered chronologically by front matter `date`
- Use descriptive filenames: `content/posts/YYYY-MM-DD-kebab-case-title.md`
- The `about.md` page is a static page (not a post)
- Images and assets go in `static/`

## Common Tasks

**Add a new blog post:**
1. Run `hugo new posts/YYYY-MM-DD-title.md`
2. Edit `content/posts/YYYY-MM-DD-title.md`
3. Set `draft: false` and verify the date
4. Run `make serve` to preview
5. Commit and push to `master`

**Update the theme:**
Since hugo-paper is a git submodule, to update it:
```bash
git submodule update --remote themes/hugo-paper
```

**Rebuild theme cache:**
If you modify theme files, you may need to rebuild:
```bash
make clean && make serve
```
