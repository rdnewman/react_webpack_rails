# ReactWebpackRails
#### Rails - Webpack setup with React integration.
Inspired and partially based on https://github.com/reactjs/react-rails/ this gem provides generators and helpers that makes react-webpack-rails integration easy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'react_webpack_rails'
```

Execute:

    $ bundle

Or install it yourself as:

    $ gem install react_webpack_rails

Then run installation:

    $ rails g react_webpack_rails:install

This will create following files:

```
├── app
│   └── react
│       ├── components
│       │   ├── hello-world.jsx
│       │   └── hello-world-test.jsx
│       └── index.js
├── webpack
│   ├── dev.config.js
│   ├── production.config.js
│   └── tests.config.js
├── karma.conf.js
├── package.json
└── webpack.config.js
```

Establish the node packages (may take a few moments)

    $ npm install    # you may see warnings to consider updating the provided package.json file with license and repository

Generate `react_bundle` for first time:

    $ webpack

And require integration and bundle files in `application.js`

```js
//= require react_integration
//= require react_bundle
```

## Usage
##### Check [docs](https://github.com/netguru/react_webpack_rails/tree/master/docs) for detailed api description.
#### Register component in index.js

```js
import Component from './components/some-component';
registerComponent('customComponentName', Component);
```

#### Use it in rails view

```erb
<%= react_component('customComponentName', { user: User.last }) %>
```

#### Use it in javascript file

```js
const element = $('#my-element');
renderComponent('customComponentName', {user_id: 1}, element);
```

### Development
Run webpack in watch mode using script:

    $ npm start

Or manually:

    $ webpack -w --config YOUR_CONFIG


### Production
Run webpack in production mode before compiling assets using script:

    $ npm run build

or manually:

    $ webpack -p --config YOUR_CONFIG

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/netguru/react_webpack_rails.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
