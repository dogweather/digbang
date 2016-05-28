[![Build Status](https://travis-ci.org/dogweather/digbang.svg?branch=master)](https://travis-ci.org/dogweather/digbang)

# DigBang

Here’s `Hash#dig!` and `Array#dig!`. They're similar to Ruby 2.3’s `Hash#dig` and `Array#dig`, but raise an exception instead of returning nil when a key isn’t found.

**In a hash:**

```ruby
places = {
  world: {
    uk: true,
    usa: true
  }
}

# No difference when the key exists
places.dig  :world, :uk # true
places.dig! :world, :uk # true

# A relevant error when the key is missing
places.dig  :world, :uk, :alaska # nil
places.dig! :world, :uk, :alaska # KeyError: Key not found: :alaska
```

**In an array:**

```ruby
cities = %w(london paris nyc)

# Same result when the index is valid
cities.dig(2)  # 'nyc'
cities.dig!(2) # 'nyc'

# A relevant error when the index is out of bounds
cities.dig(5)  # nil
cities.dig!(5) # IndexError: index 5 outside of array bounds: -3...3
```

## dig is to #[] as #dig! is to #fetch

Ruby 2.3 introduces the new Hash#dig method for safe extraction of a nested value. It’s the equivalent of a safely repeated Hash#[].

 #dig!, on the other hand, is the equivalent of a safely repeated Hash#fetch. It’s “safely unsafe”😉 raising the appropriate KeyError anywhere down the line, or returning the value if it exists.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dig_bang'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dig_bang
