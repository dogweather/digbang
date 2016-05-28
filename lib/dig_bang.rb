# frozen_string_literal: true
module DigBang
  def self.fetch_all(fetchable, keys)
    keys.reduce(fetchable) { |a, e| a.fetch(e) }
  end
end

class Hash
  def dig!(*keys)
    DigBang.fetch_all(self, keys)
  end
end

class Array
  def dig!(*keys)
    DigBang.fetch_all(self, keys)
  end
end
