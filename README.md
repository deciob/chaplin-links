chaplin-links
=============

## An application built for learning how to use [Chaplinjs] (https://github.com/chaplinjs).

### What does it do:
* Bookmark a link with tags.
* Filter bookmarks by tag.

### Requirements:
* Node (see: [nvm] (https://github.com/creationix/nvm))
* [mongoDB] (http://www.mongodb.org/display/DOCS/Quickstart) (I have by-passed this step by setting up a free account on [mongolab] (https://mongolab.com))

### How to run:
```
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