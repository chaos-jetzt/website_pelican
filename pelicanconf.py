#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'janepie'
SITENAME = 'chaos.jetzt'
SITEURL = ''
SITENAME = 'chaos.jetzt'
SITETITLE = 'chaos.jetzt'
SITESUBTITLE = 'Wir sind junge Menschen im Chaos-Umfeld - komm und mach mit!'
SITEDESCRIPTION = 'chaos.jetzt'
# SITELOGO = ''
# FAVICON = '/images/favicon.ico'
BROWSER_COLOR = '#333333'
PYGMENTS_STYLE = 'monokai'

ROBOTS = 'index, follow'

THEME = 'clean-blog'
PATH = 'content'

TIMEZONE = 'Europe/Paris'


HEADER_COVER = '/images/Header.jpg'



# Default theme language.
I18N_TEMPLATES_LANG = 'en'
# Your language.
DEFAULT_LANG = 'de'
OG_LOCALE = 'de_DE'
LOCALE = 'de_DE'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None


MENUITEMS = (('FAQ', '/pages/chaosjetzt-faq.html'),
             ('Code of Conduct', 'https://md.ctfl.space/s/chaos.jetzt-coc'),
             ('twitter', 'https://twitter.com/chaos_jetzt'),
             ('mastodon', 'https://chaos.social')
)

LINKS = (
    ('twitter', 'https://twitter.com/chaos_jetzt'),
    ('mastodon', 'https://chaos.social/@jetzt'),
    ('Code of Conduct', 'https://md.ctfl.space/s/chaos.jetzt-coc')
)


CC_LICENSE = {
    'name': 'Creative Commons Attribution-ShareAlike',
    'version': '4.0',
    'slug': 'by-sa'
}

DEFAULT_PAGINATION = 10

STATIC_PATHS = ['images', 'extra']

CUSTOM_CSS = 'static/custom.css'

USE_LESS = True

MAIN_MENU = True

