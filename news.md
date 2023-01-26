---
layout: default
title: News
---
{%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}

<h1>Latest News</h1>
{% for post in site.posts %}
<div class="site-post">
  <h2>{{ post.title }}</h2>
  <p>{{ post.date | date: date_format }}</p>
  <p>{{ post.content }}</p>
</div>
{% endfor %}
