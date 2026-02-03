---
layout: page
title: Monthly Notes
permalink: /monthly
---

<ul class="writing-log" id="monthlyLog">
  {%- assign posts = site.posts | where_exp: "p", "p.path contains '_posts/monthly/'" | sort: "date" | reverse -%}
  {%- for post in posts -%}
    {%- if post.minutes -%}
      {%- assign minutes = post.minutes -%}
    {%- else -%}
      {%- assign minutes = post.content | number_of_words | divided_by: 200 | plus: 1 -%}
    {%- endif -%}
    <li class="writing-item">
      <div class="writing-row">
        <div class="writing-meta">
          <span class="writing-date">{{ post.date | date: "%Y-%m-%d" }}</span>
          <span class="writing-dot">•</span>
          <span class="writing-time">~{{ minutes }} min</span>
        </div>

        <a class="writing-title" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>

        {%- if post.description -%}
          <div class="writing-desc">{{ post.description }}</div>
        {%- endif -%}
      </div>

      {%- if post.image -%}
        <a class="writing-thumb" href="{{ post.url | relative_url }}" aria-label="Thumbnail for {{ post.title | escape }}">
          <img src="{{ post.image | relative_url }}" alt="" loading="lazy">
        </a>
      {%- endif -%}
    </li>
  {%- endfor -%}
</ul>
