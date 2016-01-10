#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Thomas Graf'
SITENAME = u'Thomas Graf'
SITESUBTITLE = u'Computational Linguist at Stony Brook University'
SITEURL = 'http://localhost:8000/'
GITHUB_URL = 'https://github.com/thomas--graf/thomas--graf.github.io-src'

PATH = 'content'

TIMEZONE = 'America/New_York'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
# FEED_ALL_ATOM = None
FEED_ALL_RSS = None
CATEGORY_FEED_ATOM = None
CATEGORY_FEED_RSS = None
TRANSLATION_FEED_ATOM = None
TRANSLATION_FEED_RSS = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None
TAG_FEED_ATOM = None
TAG_FEED_RSS = None
FEED_MAX_ITEMS = 8

DEFAULT_PAGINATION = False

PLUGIN_PATHS = ['plugins']
PLUGINS = ['tag_cloud']

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

# Theme
THEME = 'themes/blueidea_v2'
DISPLAY_CATEGORIES_ON_MENU = False
DISPLAY_CATEGORIES_ON_SUBMENU = True
DISPLAY_CATEGORIES_ON_POSTINFO = True
DISPLAY_SEARCH_FORM = False
GITHUB_POSITION = 'left'
MENUITEMS = [('News', SITEURL + '/news.html')]
DISPLAY_SEARCH_FORM = True
SUMMARY_MAX_LENGTH = 45
HOME_NEWS_COUNT = 8

# Blogroll
LINKS = [('SBU Linguistics', 'http://linguistics.stonybrook.edu'), 
         ('SBU CompLab', ''),
         ('SBU IACS', 'http://www.iacs.stonybrook.edu/'),
         ('MathLing Reading Group', ''),
         ('NLP Reading Group', 'https://sites.google.com/site/nlpsbureadinggroup/home'),
         ('Faculty of Language', 'http://facultyoflanguage.blogspot.com')]

# Social widget
SOCIAL = [('email', 'mailto://mail_@_thomasgraf_._net'),
          ('github', 'https://github.com/thomas--graf')]


LOAD_CONTENT_CACHE = False

SLUGIFY_SOURCE = 'basename'
ARTICLE_SAVE_AS = '{slug}.html'
STATIC_PATHS = ['images', 'doc', 'extra/CNAME', 'extra/README.md', 'extra/robots.txt', 'home/home.mdown']
STATIC_EXCLUDE_SOURCES = False
EXTRA_PATH_METADATA = {
    'extra/robots.txt': {'path': 'robots.txt'},
    'extra/README.md': {'path': 'README.md'},
    'extra/CNAME': {'path': 'CNAME'},
    'extra/home.mdown': {'path': 'index.html'}
}

TYPOGRIFY = True

# Tagcloud
TAGCLOUD_HEADER = 'Browse by Topic'
TAG_CLOUD_SORTING = 'alphabetically'
TAG_CLOUD_BADGE = True

INDEX_SAVE_AS = 'news.html'
DELETE_OUTPUT_DIRECTORY = True
OUTPUT_RETENTION = ['README.md', '.git', '.gitignore']
DIRECT_TEMPLATES = ['index', 'categories', 'archives']

# this is needed to get an index.html
DEFAULT_DATE = 'fs'
