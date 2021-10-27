# chaos.jetzt automated website generator with Pelican
## use
### Setup
```
pip install -r requirements.txt
git submodule update --recursive --init
```

### Generate html
```
make html
```

To check the website:
```
make serve
```
then visit http://localhost:8000/

To automatically rebuild when something changes:
```
make devserver
```

### Publish

Automated publishing possible, check Pelican documentation


[Documentation Pelican](https://docs.getpelican.com/en/stable/index.html)
[Theme used](https://github.com/gilsondev/pelican-clean-blog) (little changes)


## write more content

- blogposts in folder 'articles', will automatically appear as newest blogpost
- general pages in folder 'pages', have to be added in MENUITEMS in pelicanconf.py for a link

## to do
- more articles
- add tags to articles
- create pages
  - about
