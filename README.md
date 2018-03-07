lasso-coffee2
=============

This plugin for Lasso.js provides support for compilation of [CoffeeScript 2](http://coffeescript.org/) dependencies.

# Installation

First install the plugin:

```sh
yarn add lasso-coffee2
```

Then, enable the plugin when configuring Lasso.js:

```javascript
require('lasso').configure({
  ...
  plugins: [
    'lasso-coffee2',
    ...
  ]
});
```

# Usage

__browser.json:__

```json
{
  "dependencies": [
    "./client.coffee"
  ]
}
```