<span class="copyright-year">
    {% set current = date(Date.now(), "YYYY") %}
        &copy;
    {% if theme.since and theme.since != current %}
        {{ theme.since }} -
    {% endif %}
    {{ current }}
    <span class="footer-author"><a href="https://github.com/cumtflyingstudio">{{ config.author }}</a>.</span>
    <span class="power-by">
        {{ __(' 博客主题 <a class="theme-link" href="https://github.com/frostfan/hexo-theme-polarbear">Polar Bear</a>') }}
    </span>
</span>
