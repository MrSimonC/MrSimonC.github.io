# Docker For The Win

So I'm in to documentation. Yes, I know, a developer (albeit Junior) into documentation? Yes, it must be 2018. The problem, however, is that I've always taken notes down in simple text files. They're quick to load, fast to save, take up minimal space, but have no formatting. Not great when presenting to other people.

Having written markdown for github (documenting my projects, helping me to get my position as a junior developer), colleagues recommended I write notes in [commonmark](http://commonmark.org) markdown. I do now, and I've grown love it. The problem is that Sharepoint doesn't - well our 2015 version doesn't at least.

Since we're upgrading to Microsoft 365, there is a glimmer of hope that at least Microsoft Teams at least will support markdown - maybe start a wiki there? We'll see.

## Markdown to clipboard, to html, to sharepoint

Currently, to put markdown on our current sharepoint 2015 wiki, I have a Visual Studio Code build `tasks.json` which looks like this (utilising `node markdown-it`):

```json
{
    "tasks": [
        {
            "label": "Compile Markdown to Clipboard",
            "type": "shell",
            "command": "node ${env:APPDATA}\\npm\\node_modules\\markdown-it\\bin\\markdown-it.js '${file}' | clip",
            "group": "build",
            "problemMatcher": []
        }
    ]
}
```

This enables me to type in markdown, then `Ctrl+Shift+B`, choose the custom build task which copies html output to my clipboard, then goto sharepoint, "Edit" the page, "Edit Source", paste in the html, remove the header, then "OK", and "Save".  
Even with the custom build task, this is laborious.

## A better way

Sick of being driven mad by the process, in comparison to say [git hub pages](https://pages.github.com/), I thought I'd follow the process if [installing github pages locally](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/) - or something equivalent.

Needless to say this didn't go well. I missed the step out (my fault) of `gem install bundler`, but found this out soon enough. However, running `bundle install` resulted in _"MSYS2 could not be found. Please run 'ridk install'."_. Then, `$ ridk install` was met with _"bash: ridk: command not found"_. More problems. After reading, I tried to install msys2 from [here](http://repo.msys2.org/distrib/x86_64/) but this would be a separate instance to git bash. Re googling `ridk install` this suggested I install ruby for windows - which I did but decided this was getting a bit crazy.

### Why not use docker?

I soon came across [jekyll official docker image](https://hub.docker.com/r/jekyll/jekyll/). You can start by pulling the latest docker image with `docker pull jekyll/jekyll` although this is optional. After lots of trial and error, I recommend `Windows Powershell` command line - that way commands like `${PWD}` work out the box.

### Create Jekyll site

Optionally, we can firstly create a jekyll site we can put our markdown files into:

* Open powershell as normal. _(Non-administrator privileges is fine)_
* cd into a new folder e.g. `c:\site`.
* Optionally start a new jekyll site with:

```powershell
docker run --rm --volume="${PWD}:/srv/jekyll" -it jekyll/jekyll jekyll new <mySiteName>
```

* site gets created in `c:\site\<mySiteName>`

### Start our jekyll server

We can start our jeykll server which will watch for changes and install all necessary programs all in docker, using the official image.

* cd into your existing jekyll site folder (e.g. `c:\site\<mySiteName>`)
* Run a jekyll server with

```powershell
docker run --rm --volume="${PWD}:/srv/jekyll" -p 4000:4000 -it jekyll/jekyll jekyll serve --incremental --force_polling
```

* `--rm` clean up the docker filesystem after the container stops
* `--volume="${PWD}:/srv/jekyll"` maps the local working directory to the container
* `-p 4000:4000` exposes Jekyll's default port from the container to our local machine. This can be changed to `-p <localPort>:4000` to point to any port you want.
* `-it` - Allocate a pseudo-tty
* `--force_polling` is a crucial step needed to watch the folder for changes when using docker.
* Open our browser to site `http://127.0.0.1:4000`
  * _(or `http://127.0.0.1:<localPort>` if you changed it in the last step)_

We can now update out markdown files locally in our site folder and see changes straight away in our browser.