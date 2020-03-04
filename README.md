# PlugExample

I am trying to figure out why raised `Plug` errors behave differently than other errors which are raised.

In the [router.ex](lib/plug_example/router.ex) file, I have two different endpoints.

The first raises a regular error, which results in some error logging, and a 500 is returned to the client:

```
curl localhost:4000/regular_error
```

```
18:54:00.468 [info]  GET /regular_error

18:54:00.499 [error] #PID<0.300.0> running Router (connection #PID<0.299.0>, stream id 1) terminated
Server: localhost:4000 (http)
Request: GET /regular_error
** (exit) an exception was raised:
    ** (RuntimeError) Something went wrong
        (plug_example) lib/plug_example/router.ex:11: anonymous fn/2 in Router.do_match/4
        (plug_example) lib/plug/router.ex:259: Router.dispatch/2
        (plug_example) lib/plug_example/router.ex:1: Router.plug_builder_call/2
        (plug_cowboy) lib/plug/cowboy/handler.ex:12: Plug.Cowboy.Handler.init/2
        (cowboy) /Users/tpachal/Desktop/plug_example/deps/cowboy/src/cowboy_handler.erl:41: :cowboy_handler.execute/2
        (cowboy) /Users/tpachal/Desktop/plug_example/deps/cowboy/src/cowboy_stream_h.erl:320: :cowboy_stream_h.execute/3
        (cowboy) /Users/tpachal/Desktop/plug_example/deps/cowboy/src/cowboy_stream_h.erl:302: :cowboy_stream_h.request_process/3
        (stdlib) proc_lib.erl:249: :proc_lib.init_p_do_apply/3
```

The second endpoint raises a `Plug` error and results in no logging, with a 500 being returned to the client:

```
curl localhost:4000/plug_error
```

```
8:54:57.482 [info]  GET /plug_error

```

I beleive the second case is a bug, and a 415 should be returned.
