#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'Thomas Graf'
SITENAME = u'Thomas Graf'
SITESUBTITLE = u'Computational Linguist at Stony Brook University'
SITEURL = 'http://localhost:8000'
GITHUB_URL = 'https://github.com/thomas--graf/website'

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
# MD_EXTENSIONS = ['fenced_code', 'codehilite(css_class=highlight, guess_lang=off)']

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

# Theme
THEME = 'themes/blueidea_v2'
DISPLAY_PAGES_ON_MENU = True
DISPLAY_CATEGORIES_ON_MENU = False
DISPLAY_CATEGORIES_ON_SUBMENU = True
DISPLAY_CATEGORIES_ON_POSTINFO = True
DISPLAY_SEARCH_FORM = False
GITHUB_POSITION = 'left'
MENUITEMS = [('Home', SITEURL),
             ('News', SITEURL + '/news.html')]
DISPLAY_SEARCH_FORM = True
SUMMARY_MAX_LENGTH = 45
HOME_NEWS_COUNT = 8

# Blogroll
LINKS = [('SBU Linguistics', 'http://linguistics.stonybrook.edu'), 
         ('SBU CompLab', 'http://compling.stonybrook.edu'),
         ('SBU IACS', 'http://www.iacs.stonybrook.edu/'),
         ('MathLing Reading Group', 'http://mlrg.thomasgraf.net'),
         ('NLP Reading Group', 'https://sites.google.com/site/nlpsbureadinggroup/home'),
         ('Faculty of Language', 'http://facultyoflanguage.blogspot.com')]

# Social widget
SOCIAL = [('email', 'mailto://mail_@_thomasgraf_._net'),
          ('github', 'https://github.com/thomas--graf')]


LOAD_CONTENT_CACHE = False

SLUGIFY_SOURCE = 'basename'
ARTICLE_SAVE_AS = '{slug}.html'

# Tricks to deal with special files
STATIC_PATHS = ['images', 'doc', 'extra/CNAME', 'extra/README.md', 'extra/robots.txt','timeline']
STATIC_EXCLUDE_SOURCES = False
IGNORE_FILES = ['timeline', 'extra']
EXTRA_PATH_METADATA = {
    'extra/robots.txt': {'path': 'robots.txt'},
    'extra/README.md': {'path': 'README.md'},
    'extra/CNAME': {'path': 'CNAME'}
}

TYPOGRIFY = True

# Tagcloud
TAGCLOUD_HEADER = 'Browse by Topic'
TAG_CLOUD_SORTING = 'size'
TAG_CLOUD_BADGE = True

# We have our start page, so the index needs a different name
INDEX_SAVE_AS = 'news.html'

DELETE_OUTPUT_DIRECTORY = True
OUTPUT_RETENTION = ['README.md', '.git', '.gitignore']
DIRECT_TEMPLATES = ['index', 'categories', 'archives']

# this is needed to get an index.html
DEFAULT_DATE = 'fs'

# no author page
AUTHOR_SAVE_AS = ''
