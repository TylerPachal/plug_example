# PlugExample

I am trying to figure out why raised `Plug` errors behave differently than other errors which are raised.  

In the [router.ex](lib/plug_example/router.ex) file, if the `Plug` error is raised, nothing is logged.  If the regular error is raised, the stacktrace is logged. 
