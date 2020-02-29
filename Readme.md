# chaos.jetzt automated website generator with Pelican
## use
### Setup
```
pip install pelican[Markdown]

pelican-themes --install Flex_angepasst/
pelican-quickstart
```
go through questions


### Generate html
```
pelican content -t Flex_angepasst -s pelicanconf.py
```


To check the website:
```
pelican --listen
```
then visit http://localhost:8000/

### Publish

Automated publishing possible, check Pelican documentation


[Documentation Pelican](https://docs.getpelican.com/en/stable/index.html)
[Theme used](https://github.com/alexandrevicenzi/Flex) (little changes)




## to do
- more articles
- add tags to articles
- create paeges
  - about
  - faq
- switch language to German (needs an [additional plugin](https://github.com/getpelican/pelican-plugins/))
