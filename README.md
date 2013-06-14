SpreePromotionRolesRule
=======================

This extension allows you to create promotions that are valid for a specific user-role.

Installation
------------

Add spree_promotion_roles_rule to your Gemfile:

```ruby
gem 'spree_promotion_roles_rule', github: 'traels/spree-promotion-roles-rule'
```

Add rule to config/initializers/spree.rb
```ruby
Rails.application.config.spree.promotions.rules << RolesPromotionRule
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_promotion_roles_rule:install
```

Copyright (c) 2013 Træls, released under the New BSD License
