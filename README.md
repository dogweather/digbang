# DigBang

Here’s `Hash#dig!` and `Array#dig!`. It’s similar to Ruby 2.3’s `Hash#dig` and `Array#dig`, but raises an exception instead of returning nil when a key isn’t found.


```ruby
places = { world: { uk: true } }
 
places.dig  :world, :uk # true
places.dig! :world, :uk # true
 
places.dig  :world, :uk, :bvi # nil
places.dig! :world, :uk, :bvi # KeyError: Key not found: :bvi
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

