# README

This README would normally document whatever steps are necessary to get the
application up and running.

#Camaleon CMS (It adapts to your needs) 

  *source: https://github.com/owen2345/camaleon-cms

  - Camaleon CMS is a dynamic and advanced content management system based on Ruby on Rails 4+ and Ruby 1.9.3+. This CMS is an alternative to wordpress for Ruby on Rails developers to manage advanced contents easily. Camaleon CMS is a flexible manager where you can build your custom content structure without coding anything by custom fields and custom contents type.

#With Camaleon you can do:

  - Multiples sites in the same installation
  - Multilanguage sites
  - Design and create the architecture of your project without programming by dynamic - contents and fields
  - Extend or customize the functionalities by plugins
  - Manage your content visualization by themes
  - Advanced User roles
  - Integrate into existent rails 4+ projects
  **Other features:
  - Shortcodes
  - Widgets
  - Drag and Drop / Sortable / Multi level menus
  - Templates/Layouts for pages
  - Easy migration from wordpress

#Some features are:

  - Integrate into existent Ruby on Rails Projects
  - Easy administration Camaleon CMS permit you to adapt the CMS to all your needs and not you adapt to the CMS. I.E. you can create your custom architecture with all attributes that you need for each kind of content.
  - Security
  - Remote code execution
  - SQL injections
  - Advanced sessions security
  - Cross Site Scripting
  - Control of abusive requests
  - Cross-Site Request Forgery
  **Site Speed Camaleon CMS include a lot of cache strategies to optimize the site access velocity:
  - Cache contents
  - Cache queries
  - Manifests (compress and join asset files)
  - Customize your content visualization for Desktop, Mobile and Tablet
  - SEO & HTML5
  - Sitemap generations
  - Seo Configuration
  - Seo for social media
  - All generated content is compatible with HTML5 and bootstrap 3

#Noted Project Step
  *Create your rails project
    - rails new sophary-camaleon-cms
  *Add the gem in your Gemfile 
    - gem "camaleon_cms",  '>= 2.4.4.5'
    - gem 'draper', '~> 3'
  *Install required Gem and dependencies
    - bundle install
  *Camaleon CMS Installation
    - rails generate camaleon_cms:install
  *Create database structure
    - rake camaleon_cms:generate_migrations
    - rake db:migrate
  *Start your server
    - rails server # and then go to your browser http://localhost:3000/
  *Install New theme
    - rails g camaleon_cms:theme sophary-cms-default
