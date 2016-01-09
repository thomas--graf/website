#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Thomas Graf'
SITENAME = u'Thomas Graf'
SITESUBTITLE = u'Computational Linguist at Stony Brook University'
SITEURL = 'http://thomasgraf.net'
GITHUB_URL = 'https://github.com/thomas--graf/thomas--graf.github.io-src'

PATH = 'content'

TIMEZONE = 'America/New_York'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

DEFAULT_PAGINATION = False

PLUGIN_PATHS = ['pelican-plugins']
PLUGINS = ['pandoc_reader', 'tag_cloud']

# Pandoc settings
PANDOC_FILES = ['pd']
PANDOC_ARGS = [
    '--mathjax',
    '--smart'
]
MARKUP = ('rst', 'md', 'pd')

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = False

# Theme
THEME = 'pelican-themes/blueidea_v2'
DISPLAY_CATEGORIES_ON_MENU = False
DISPLAY_CATEGORIES_ON_SUBMENU = True
DISPLAY_CATEGORIES_ON_POSTINFO = True
DISPLAY_SEARCH_FORM = False
GITHUB_POSITION = 'left'
MENUITEMS = [('News', 'http://localhost:8000/index.html')]
DISPLAY_SEARCH_FORM = True

# Blogroll
LINKS = [('SBU Linguistics', 'http://linguistics.stonybrook.edu'), 
         ('SBU CompLab', ''),
         ('SBU IACS', 'http://www.iacs.stonybrook.edu/'),
         ('MathLing Reading Group', ''),
         ('NLP Reading Group', 'https://sites.google.com/site/nlpsbureadinggroup/home'),
         ('Faculty of Language', 'http://facultyoflanguage.blogspot.com')]

# Social widget
SOCIAL = [('email', 'mailto://mail@thomasgraf.net'),
          ('github', 'https://github.com/thomas--graf')]


LOAD_CONTENT_CACHE = False

SUMMARY_MAX_LENGTH = 80

SLUGIFY_SOURCE = 'basename'
ARTICLE_SAVE_AS = '{slug}.html'

TYPOGRIFY = True

# Tagcloud
TAGCLOUD_HEADER = 'Browse by Topic'
TAG_CLOUD_SORTING = 'alphabetically'
TAG_CLOUD_BADGE = True
