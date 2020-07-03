# Azure Dev Ops

## Wikis in Azure Dev Ops

So today I discovered some strange things about Azure Dev Ops Wikis.

There are two types of wiki in Azure Dev Ops:

* "Publish code as wiki", and the other
* "Project Wiki"

## Secret Information

Firstly the first thing no-one tells you, is that although you many immediately jump to creating your own code as wiki *(I mean why not? we did - it seems sensible, and you can easily update your wiki through your favourite editor)*, your client *may not be able to see it*. The problem is that no-one tells you that only "project wikis" by default are shown to external stakeholders. 

There's a big discussion about this on the [community forums](https://developercommunity.visualstudio.com/idea/365939/allow-stakeholders-to-view-wikis-published-from-co.html).

## So how do we fix this?

So say you've created your own wiki by now, all in code. However, your client now wants to have a look at some documentation – maybe you've created a specific page or set of pages for them to look at – are you wanted to see the whole thing. Well, it turns out that you need to [create a project wiki](https://docs.microsoft.com/en-us/azure/devops/project/wiki/wiki-create-repo?view=azure-devops&tabs=browser), or give them collaborator access to your code repo.

However, what I found is that you can actually create a project wiki, but what no one tells you is that you can download that as code! The only difference is that you don't house it in your own repo. Azure will create a repo on your behalf. 

Once you've created your project wiki, you can clone the code:

![clone wiki](images/01%20wikiw.png)

then you can copy the ssh path to your `git clone ssh...` command and download and use the repo like any other git repo!

![download](images/02%20wikiw.png)