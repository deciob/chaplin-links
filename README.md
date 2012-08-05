# chaplin-links
### An application built for learning how to use [Chaplinjs] (https://github.com/chaplinjs)

* [Key Features](#key-features)
* [Requirements](#requirements)
* [How to run](#how-to-run)
* [Motivation](#motivation)
* [About Controllers](#about-controllers)
* [Rendering Collection lists](#rendering-collection-lists)
* [About Publish Subscribe](#about-publish-subscribe)

## Key Features
This is a very simple bookmark application (mostly coded over 2 weekends). With it, one can bookmark links and filter them by tags. Links and Tags are 2 independent models-collections within the application, the only connection being the Link model having a Tags attribute. It relies on a node-express server and a mongodb database on the back-end. The initial file structure and code is copied from [chaplin-boilerplate] (https://github.com/chaplinjs/chaplin-boilerplate)
Condensed in one statement one would rightly say... far too simple for a Chaplin architecture, but usefull for learning!

## Requirements
* Node (see: [nvm] (https://github.com/creationix/nvm))
* [mongoDB] (http://www.mongodb.org/display/DOCS/Quickstart) (I have by-passed this step by setting up a free account on [mongolab] (https://mongolab.com))

## How to run
```
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

## Motivation
My goal is to learn Chaplin. I am not totally new to the JavaScript MV* hype and have built a couple of fairly complex one page JavaScript applications using spinejs. I have been flirting with backbone for some time now, curious about its popularity, but never got to try it out until... Chaplin came along...

Started from backbone. My first weekend though, full of source code, blog posts and tutorials, was one of frustration... so many ways of doing the same thing! Beautiful, but also so frustrating. I needed some good pragmatic guidance! After 2 days, I had very little working code and no real understanding about what was good. So, the weekend after, with not much enthusiasm left, I dropped backbone for Chaplin and...

... beautiful surprise! After reading the presentation once more and some good poking into the source code and example applications, I had this learning application up and running and, most important, I was having fun building it!

## About Controllers
In my opinion Controllers are fundamental to understanding the Chaplin architecture and a good way to think about them is visually:

![overview](https://raw.github.com/deciob/chaplin-links/master/img/controllers_layout_b.png)

The application has two "special controllers" that do not respond to route changes and that get instanciated in coffee/chaplin_links_application.coffee:

* `coffee/controllers/head_nav_controller.coffee`
* `coffee/controllers/tags_sidebar_controller.coffee`

And one main controller, responsible for the edit-links and read-links pages:
* `coffee/controllers/links_controller.coffee`

## Rendering Collection lists
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


## About Publish Subscribe
An example is the click event on the Tags list. The tag list does not repondo to routing, but clicking on the links publishes an event on witch the 2 main views are both subscribed (see: publish/subscribe section). In this way, the result will be different depending on which is the active view.
```
# in /coffee/views/tags_sidebar_view.coffee
mediator.publish 'TagsSidebarView:tagClicked', tag_name

#in /coffee/views/save_links_view.coffee
@subscribeEvent 'TagsSidebarView:tagClicked', @addTag

#in /coffee/views/links_view.coffee
@subscribeEvent 'TagsSidebarView:tagClicked', @setCurrentTag
```
