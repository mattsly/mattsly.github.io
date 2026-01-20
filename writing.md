---
layout: page
title: Writing
permalink: /writing/
---

<p class="writing-intro">
  Essays, notes, and the occasional link. Some are originals, some are cross-posts.
</p>

<div class="writing-controls">
  <button class="writing-filter is-active" data-filter="all">All</button>
  <button class="writing-filter" data-filter="essay">Essays</button>
  <button class="writing-filter" data-filter="note">Notes</button>
  <button class="writing-filter" data-filter="link">Links</button>
</div>

<ul class="writing-log" id="writingLog">
  {%- assign posts = site.posts -%}
  {%- for post in posts -%}
    {%- assign type = post.type | default: "essay" -%}
    {%- assign minutes = post.content | number_of_words | divided_by: 200 | plus: 1 -%}
    <li class="writing-item" data-type="{{ type | escape }}">
      <div class="writing-row">
        <div class="writing-meta">
          <span class="writing-date">{{ post.date | date: "%Y-%m-%d" }}</span>
          <span class="writing-dot">•</span>
          <span class="writing-type">{{ type }}</span>
          <span class="writing-dot">•</span>
          <span class="writing-time">~{{ minutes }} min</span>
        </div>

        <a class="writing-title" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>

        {%- if post.description -%}
          <div class="writing-desc">{{ post.description }}</div>
        {%- endif -%}

        {%- if post.crosspost -%}
          <div class="writing-xpost">
            Also on
            {%- if post.crosspost.medium -%}
              <a href="{{ post.crosspost.medium }}" target="_blank" rel="noopener">Medium</a>
            {%- endif -%}
            {%- if post.crosspost.linkedin -%}
              {%- if post.crosspost.medium -%} · {%- endif -%}
              <a href="{{ post.crosspost.linkedin }}" target="_blank" rel="noopener">LinkedIn</a>
            {%- endif -%}
          </div>
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

<script>
  (function () {
    const buttons = document.querySelectorAll(".writing-filter");
    const items = document.querySelectorAll(".writing-item");

    function setActive(btn) {
      buttons.forEach(b => b.classList.remove("is-active"));
      btn.classList.add("is-active");
    }

    function filter(type) {
      items.forEach(item => {
        const ok = (type === "all") || (item.dataset.type === type);
        item.style.display = ok ? "" : "none";
      });
    }

    buttons.forEach(btn => {
      btn.addEventListener("click", () => {
        const type = btn.dataset.filter;
        setActive(btn);
        filter(type);
      });
    });
  })();
</script>
