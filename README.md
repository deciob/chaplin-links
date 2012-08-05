# chaplin-links
### An application built for learning how to use [Chaplinjs] (https://github.com/chaplinjs)

* [Key Features](#key-features)
* [Requirements](#requirements)
* [How to run](#how-to-run)
* [Motivation](#motivation)

## Key Features
This is a very simple bookmark application (mostly coded over 2 weekends). With it, one can bookmark links and filter them by tags. Links and Tags are 2 independent models-collections within the application, the only connection being the Link model having a Tags attribute. It relies on a node-express server and a mongodb database on the back-end and one would rightly say... far too simple for a Chaplin architecture!

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

![overview](https://raw.github.com/deciob/chaplin-links/master/img/controllers_layout_b.png)