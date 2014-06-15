-module(sass_collect_task_app).
-behaviour(application).

-define(APPS, [kernel,
              stdlib,
              inets,
              lager,
              ranch,
              cowlib,
              cowboy,
              jsx,
              msgpack,
              sqor_logger,
              resterl, 
              resource_discovery]).

%% Application callbacks
-export([start/0, start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start() ->
   [begin start_app(A) end || A <- ?APPS].


start(_StartType, _StartArgs) ->
    
    sass_collect_task_sup:start_link().

stop(_State) ->
    ok.

start_app(A)->
    application:start(A),
    io:format("~p started~n ",[A]).
