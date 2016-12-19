# About Me
Hi, I'm Simon Crouch and welcome to my programming blog.
I love open source, free software and I am completely self-taught in VBA, SQL, AutoHotKey and my favourite: Python.

I work in the NHS, have done for years and will share some tips and software hacks here for all to benefit from.

## Making Software Documentation _(The free way)_
Need to make lots of screenshots by just clicking the mouse?  

It's amazed me how there's almost no completely free software to help you make IT training documents or even screenshots. 
* See my [IT Training Materials solution](https://mrsimonc.github.io/Making-Software-Documentation/) for my free, easy, open source way to make software documentation using _Greenshot_ and _AutoHotKey_.

<ul class="nav-list">
  {% for link in site.navigation %}
    {% assign current = nil %}
    {% if page.url == link.url %}
      {% assign current = 'current' %}
    {% endif %}

    <li class="nav-list-item{% if forloop.first %}first{% endif %} {{ current }} {% if forloop.last %}nav-list-item-last{% endif %}">
      <a class="{{ current }}" href="{{ link.url }}">{{ link.text }}</a>
    </li>
  {% endfor %}
</ul>