# chaplin-links
### A bookmarks application built for learning how to use [Chaplinjs] (https://github.com/chaplinjs)

* [Key Features](#key-features)
* [Requirements](#requirements)
* [How to run](#how-to-run)
* [Background and motivations](#background-and-motivations)
* [About Controllers](#about-controllers)
* [About rendering Collection lists](#rendering-collection-lists)
* [About the Publish/Subscribe pattern](#about-the-publishsubscribe-pattern)
* [About rendering filtered collections](#about-rendering-filtered-collections)
* [Conclusions](#conclusions)

## Key Features
This is a very simple bookmark application (mostly coded over 2 weekends). With it, one can bookmark links and filter them by tags. Links and Tags are 2 independent models-collections within the application, the only connection between the two being the Link model having a Tags attribute. It relies on a node-express server and a mongodb database on the back-end. The initial file structure and code is copied from [chaplin-boilerplate] (https://github.com/chaplinjs/chaplin-boilerplate).
Condensed in one statement one would say... far too simple for a Chaplin architecture, but useful for learning!

## Requirements
* Node (see: [nvm] (https://github.com/creationix/nvm))
* [mongoDB] (http://www.mongodb.org/display/DOCS/Quickstart) (I have by-passed this step by setting up a free account on [mongolab] (https://mongolab.com))

## How to run
```
# Assuming you have a node environment and a mongodb database correctly set-up:

# Clone the repo into your home directory (or wherever you want...)
cd
git@github.com:deciob/chaplin-links.git
cd ~/chaplin-links

# If no coffeescript
sudo npm install -g coffee

# Install server dependencies
npm install .

# Edit connection_string_template.js to point to your mongodb database
# and save the file as connection_string.js

# Runserver and go to localhost:3000
node app.js

# To compile coffee changes to js
coffee --bare --output js/ coffee/ 

```

## Background and motivations
My goal was to learn Chaplin. I am not totally new to the JavaScript MV* hype and have built a couple of complex one page JavaScript applications using spinejs, but nothing more.

To introduce myself to Chaplin I started from backbone. A weekend full of source code, blog posts and tutorials, and some frustration... so many ways of doing the same thing! I needed some good pragmatic guidance! So, the weekend after, with not much enthusiasm, I dropped backbone for Chaplin and...

... beautiful surprise! After reading the presentation once more and some good poking into the source code and example applications, I had this learning application up and running and  having fun with it! Chaplin is definitely worth a try!

My advice for anyone wanting to learn:
* Try backbone, understand models and collections, and do not despair if things look confused (Chaplin is here to help).
* Read [Chaplin](https://github.com/chaplinjs/chaplin/blob/master/README.md)'s excellent introduction.
* Use [chaplin-boilerplate] (https://github.com/chaplinjs/chaplin-boilerplate) and [facebook-example] (https://github.com/chaplinjs/facebook-example) as starting points.
* Look back to the source code (both chaplin and backbone) if things still look unclear.

## About Controllers
[Chaplin-docs](https://github.com/chaplinjs/chaplin/blob/master/README.md#controllers).

Controllers are key to understanding the Chaplin architecture and a good way to think about them is visually:

![overview](https://raw.github.com/deciob/chaplin-links/master/img/controllers_layout_b.png)

The application has two "special controllers" that do not respond to route changes and that get instanciated in coffee/chaplin_links_application.coffee:

* `coffee/controllers/head_nav_controller.coffee`
* `coffee/controllers/tags_sidebar_controller.coffee`

And one main controller, responsible for the edit-links and read-links pages:
* `coffee/controllers/links_controller.coffee`

## About rendering Collection lists
This is something easily achieved with Chaplin. As an example lets look at the tags list rendering.

From `tags_sidebar_view.coffee`:
```
listSelector: 'ul'
.
.
.
# The most important method a class derived from CollectionView
  # must overwrite.
  getView: (item) ->
    # Instantiate an item view
    new TagView model: item
```
This is all one needs to render the list. The `TagsSidebarView` template (`tags_sidebar.hbs`) will have a `<ul></ul>` placeholder that will be filled by the `TagView` template (`tag.hbs`).
Whilst the `TagsSidebarView` is being instanciated within the `TagsSidebarController` with a `Tags` collection, the `TagView` is instanciated once per every model instance.


## About the Publish/Subscribe pattern
[Chaplin-docs](https://github.com/chaplinjs/chaplin/blob/master/README.md#mediator-and-publishsubscribe).

An example is the click event on the Tags list. The tag list does not repondo to routing, but clicking on the links publishes an event on witch the 2 main views are both subscribed (see: publish/subscribe section). In this way, the result will be different depending on which is the active view.
```
# in /coffee/views/tags_sidebar_view.coffee
mediator.publish 'TagsSidebarView:tagClicked', tag_name

#in /coffee/views/save_links_view.coffee
@subscribeEvent 'TagsSidebarView:tagClicked', @addTag

#in /coffee/views/links_view.coffee
@subscribeEvent 'TagsSidebarView:tagClicked', @setCurrentTag
```

## About rendering filtered collections
From `/coffee/views/links_view.coffee`:
```
@subscribeEvent 'TagsSidebarView:tagClicked', @setCurrentTag
.
.
.
setCurrentTag: (tag) =>
  @current_tag = tag
  @filter(@filterByCurrentTag)

filterByCurrentTag: (link, idx) =>
  if @current_tag
    link_tags = link.get('tags').split ","
    current_tag = [@current_tag]
    intersection = _.intersection(current_tag, link_tags)
    if intersection.length > 0 then link else no
```
All is needed is to call the `CollectionView` method `@filter` with a filter function and Chaplin does everything for you!


## Conclusions
This application is the result of two weekends passed learning Chaplin, and it is nothing more than this: a useful play to get started. Some parts might as well have been implemented in the wrong way and others have consciously been avoided (for example possible caching strategies). Nevertheless, I think that as a starting point it has been useful. 