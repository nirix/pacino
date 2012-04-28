Pacino
======

Pacino is a simple "blog" powered by Sinatra.

Installation
------------

Simply run `gem install pacino`

Setup
------

Setting up Pacino is easy.

Create a directory you want to run Pacino from with,
inside it create the following files and directories:

- posts/
- config.yml
- config.ru
- app.rb

Inside the `posts/` directory, create a file named `1.yml`
and place the following inside it:

    title: My first post
    slug: my-first-post
    body: |
      This is my _first_ post!
      
      Totally **AWESOME**.

Inside `app.rb` put:

    require 'pacino'
    Pacino.run

Inside `config.ru` put:

    require './app.rb'
    run Sinatra::Application

And inside `config.yml` put:

    title: My Blog Name

And you're good to go.