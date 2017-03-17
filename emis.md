# EMIS Notes

Since I work in the healthcare sector and specialise in suppoting EMIS, here are some notes I've taken over the many work hours of supporting it.

We're currently using EMIS v6.4 at time of writing.

## Template Work
Templates act in different ways:
* Deactivating a template don't remove it from people's "recently used" lists if they've loaded it before.
  * Fix: Archive the template, don't Deactivate
  * Tip: Cut, paste the file to an archived folder before archiving, as an EMIS bug will archive ALL items in the folder _(trust me, I know)_
* Import new template - note that only the old template is seen by end users until they log off/back on

* Templates - front end output _(i.e. what you see against the patient when you've used a template)_:
  * Clinical Code = code description (+ "prompt for date"[=allows *past* dates only] + user input)
  * Diary Entry = "Diary Entry" + code description + date user input
  * Predefined Text = prompt
  * Code Browser = code description
  * Text Pick List = user selection
  * Value Pick List = code + value (+ "allow text" user input)
  * Enter Free Text = prompt + user input (max: 500 characters)
    * Allow text = user input (max: 255 characters)
    * If prompt is a space = no prompt + user input. When template saves, space is trimmed and prompt becomes null. If prompt is null, rerunning template won't keep user input (and all prompts must be unique)
