#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'janepie'
SITENAME = 'chaos.jetzt'
SITEURL = 'https://chaos.jetzt'
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


HEADER_COVER = '/images/chaos.png'



# Default theme language.
I18N_TEMPLATES_LANG = 'en'
# Your language.
DEFAULT_LANG = 'de'
OG_LOCALE = 'de_DE'
LOCALE = 'de_DE'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = "feeds/all.atom.xml"
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None


MENUITEMS = (('FAQ', '/pages/faq.html'),
             ('wiki', 'https://wiki.chaos.jetzt" target="_blank'),
             ('Code of Conduct', 'https://wiki.chaos.jetzt/code-of-conduct" target="_blank'),
             ('mastodon', 'https://chaos.social/@jetzt" target="_blank" rel="me'),
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

# see https://docs.getpelican.com/en/stable/settings.html#url-settings
PATH_METADATA = '(?P<path_no_ext>.*)\..*'
ARTICLE_URL = ARTICLE_SAVE_AS = PAGE_URL = PAGE_SAVE_AS = '{path_no_ext}.html'
