---
title: 'Posts'
tags:
  - pages
---
{{ define "main" }}
<main>
  <header>
    <h1>{{ .Title }}</h1>
  </header>
  <div>
    {{ range .Pages }}
      {{ .Render "summary" }}
    {{ end }}
  </div>
</main>
{{ end }}