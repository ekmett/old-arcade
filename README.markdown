arcade
======

[![Build Status](https://secure.travis-ci.org/ekmett/arcade.png?branch=master)](http://travis-ci.org/ekmett/arcade)

The goal of the Haskell arcade is a simple client that can be used to connect to a variety of networked games.

There are four major components:

1.) The Client runs locally on the end user's machine
2.) Game Servers are run by anyone who wants to serve games.
3.) Login Servers are used to provide authenticationm, hashed email addresses for gravatars, and a game server registry.
4.) The Browser

The Client
----------

The arcade client contains an embedded snap web server for use in configuration. This enables us to punt all the UI design to the
web, rather than wrestle with getting it right in OpenGL/SDL out of the gate.

The client registers with login servers and obtains a unique ID for each login server it encounters.

The goal is to provide a unified game client, that pulls assets from the game server to know what game its playing, and how to do
predictive physics for it. The initial launch target are simple side-scroller/shoot'em up games, with an eye towards eventually doing
more interesting game physics and other game formats.

Game Server
-----------

Game servers can fulfill a lot of roles, from a persistent world that has inventory/experience/etc. to an ephemeral arena for a capture
the flag match or cooperative multiplayer game. Some of these will live on well known stable addresses, and others will only be used
temporarily. The design goal is that a unique game design should be able to be implemented as a snaplet without further support beyond
potentialy expanding the capabilities of the client with new features as we go. The server doesn't get to know much about the user beyond
a hash of his email address and some authentication information provided by the login server to provide enough information to avoid 
impersonation while not allowing a game server to actually impersonate one of its users to another server.

Clients will communicate with the game server over a web socket for the session.

Login Server
------------

The login server is responsible for providing a simple RESTful API for registering servers, performing authorization of user credentials,
and providing access to an image/identicon/name for uniquely identifying the user to avoid impersonation. This may eventually also provide
services for NAT hole punching.

Browser
-------

Since all three of the other components actually contain web servers, it isn't surprising that the browser plays a major role in the design
of the arcade. It is used initially to log in, configure resolution and various options in the client, probably via oauth to the login server,
then find games, and for other services such as chat windows that may be provided. (Should there just be a separate notion of a chat snaplet
that can happen to run on the login server, game servers or standalone? They could offer authenticated chat rooms with decentralized
authorization that way.)

Contact Information
===================

Contributions and bug reports are welcome!

Please feel free to contact us through github or on the #haskell or #haskell-arcade IRC channels on irc.freenode.net.

-Edward Kmett
