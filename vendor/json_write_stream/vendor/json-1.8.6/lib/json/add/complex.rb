# frozen_string_literal: true

require "json" unless defined?(::JSON::JSON_LOADED) && ::JSON::JSON_LOADED
defined?(::Complex) or class Complex
                         # Deserializes JSON string by converting Real value <tt>r</tt>, imaginary
                         # value <tt>i</tt>, to a Complex object.
                         def self.json_create(object)
                           Complex(object["r"], object["i"])
                         end

                         # Returns a hash, that will be turned into a JSON object and represent this
                         # object.
                         def as_json(*)
                           {
                             JSON.create_id => self.class.name,
                             "r" => real,
                             "i" => imag
                           }
                         end

                         # Stores class name (Complex) along with real value <tt>r</tt> and imaginary value <tt>i</tt> as JSON string
                         def to_json(*)
                           as_json.to_json
                         end
end
