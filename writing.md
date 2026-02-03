---
layout: page
title: Writing
permalink: /writing/
---

<p class="writing-intro">
</p>

<ul class="writing-log" id="writingLog">
  {%- assign external = site.data.writing_external | default: empty -%}
  {%- assign posts = site.posts | where_exp: "p", "p.private != true" | concat: external | sort: "date" | reverse -%}
  {%- for post in posts -%}
    {%- assign type = post.type | default: "essay" -%}
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

        {%- if post.external_url -%}
          <a class="writing-title" href="{{ post.external_url }}" target="_blank" rel="noopener" aria-label="{{ post.title | escape }} (external link)">
            {{ post.title | escape }}
            <span class="writing-external" aria-hidden="true">
              <svg viewBox="0 0 24 24" role="img" focusable="false" aria-hidden="true">
                <path d="M14 3h7v7h-2V6.41l-9.29 9.3-1.42-1.42 9.3-9.29H14V3z"></path>
                <path d="M5 5h6v2H7v10h10v-4h2v6H5V5z"></path>
              </svg>
            </span>
          </a>
        {%- else -%}
          <a class="writing-title" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
        {%- endif -%}

        {%- if post.description -%}
          <div class="writing-desc">{{ post.description }}</div>
        {%- endif -%}

        {%- if post.crosspost -%}
          <div class="writing-xpost">
            Also on
            {%- if post.crosspost.medium -%}
              <a href="{{ post.crosspost.medium }}" target="_blank" rel="noopener">
                Medium
                <span class="writing-external" aria-hidden="true">
                  <svg viewBox="0 0 24 24" role="img" focusable="false" aria-hidden="true">
                    <path d="M14 3h7v7h-2V6.41l-9.29 9.3-1.42-1.42 9.3-9.29H14V3z"></path>
                    <path d="M5 5h6v2H7v10h10v-4h2v6H5V5z"></path>
                  </svg>
                </span>
              </a>
            {%- endif -%}
            {%- if post.crosspost.linkedin -%}
              {%- if post.crosspost.medium -%} · {%- endif -%}
              <a href="{{ post.crosspost.linkedin }}" target="_blank" rel="noopener">LinkedIn</a>
            {%- endif -%}
          </div>
        {%- endif -%}
      </div>

      {%- if post.image -%}
        {%- if post.external_url -%}
          <a class="writing-thumb" href="{{ post.external_url }}" aria-label="Thumbnail for {{ post.title | escape }}">
            <img src="{{ post.image }}" alt="" loading="lazy">
          </a>
        {%- else -%}
          <a class="writing-thumb" href="{{ post.url | relative_url }}" aria-label="Thumbnail for {{ post.title | escape }}">
            <img src="{{ post.image | relative_url }}" alt="" loading="lazy">
          </a>
        {%- endif -%}
      {%- endif -%}
    </li>
  {%- endfor -%}
</ul>
