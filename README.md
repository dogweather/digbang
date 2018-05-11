[![Build Status](https://travis-ci.org/dogweather/digbang.svg?branch=master)](https://travis-ci.org/dogweather/digbang)

# DigBang

Here’s `Hash#dig!` and `Array#dig!`. They're similar to Ruby’s `Hash#dig` and `Array#dig`, but they raise an exception instead of returning nil when a key isn’t found. 

**In a hash:**

```ruby
require 'dig_bang'

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
airports = %w(lhr sfo nyc)

# Same result when the index is valid
airports.dig  2 # 'nyc'
airports.dig! 2 # 'nyc'

# A relevant error when the index is out of bounds
airports.dig  5 # nil
airports.dig! 5 # IndexError: index 5 outside of array bounds: -3...3
```

**In a mixed data structure:**
```ruby
places = {
  world: {
    uk:  %w(lhr lgw man stn),
    usa: %w(nyc pdx sfo dca)
  }
}

places.dig  :world, :usa, 2 # 'sfo'
places.dig! :world, :usa, 2 # 'sfo'

places.dig  :world, :usa, 4 # nil
places.dig! :world, :usa, 6 # IndexError: index 6 outside of array bounds: -4...4
```

**In combination with `#dig`:**

```ruby
places.dig!(:world, :usa).dig(6) # nil
```

## dig is to #[] as #dig! is to #fetch

Ruby 2.3 introduces the new Hash#dig method for safe extraction of a nested value. It’s the equivalent of a safely repeated Hash#[].

 #dig!, on the other hand, is the equivalent of a safely repeated Hash#fetch. It’s “safely unsafe”😉 raising the appropriate KeyError anywhere down the line, or returning the value if it exists.

It's also just 18 lines of code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dig_bang'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dig_bang
