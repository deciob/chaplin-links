fs     = require 'fs'
{exec} = require 'child_process'
util   = require 'util'
wrench = require 'wrench'

coffeedir = 'coffee'
jsdir = 'js'

lessdir = 'less'
cssdir = 'css'

#coffeeOptions = "--bare --output #{jsdir} "
lesscOptions = ""


task 'watch', 'Watch for coffeescript changes', ->
  util.log "Watching for code changes to:"

  cFiles = wrench.readdirRecursive("#{coffeedir}", (err, files)->
    if files
      for file in files
        fn = (file) ->
          parts = file.split('.', 1)
          if(/(.*)\.(coffee)/i.test(file))

            start_index_file = parts[0].lastIndexOf("/", start_index_file) + 1
            end_index_file = parts[0].length
            true_file = parts[0].substring(start_index_file, end_index_file)
            true_folder = parts[0].substring(0, start_index_file)
            compileCoffee(true_file, true_folder)
            
            fileRef = file
            util.log " -> #{coffeedir}/#{file}"
            fs.watchFile "#{coffeedir}/#{file}", (curr, prev) ->
                if +curr.mtime isnt +prev.mtime
                    util.log "Saw change in #{coffeedir}/#{fileRef}"
                    compileCoffee(true_file, true_folder)
        fn(file)
  )
  
  util.log "-----------------------------------"
  
  util.log "Performed initial compile. Ready and waiting for changes"

# if you wanted to run these alone then you might as well do it from the command line
compileCoffee = (file, dir) ->
  exec "coffee --bare --output #{jsdir}/#{dir} #{coffeedir}/#{dir}/#{file}.coffee", (error, stdout, stderr) ->
    util.log(stdout) if stdout
    util.log(stderr) if stderr
