module Grape
  module Formatter
    module Json
      class << self

        def call(object, env)
          # Revert dblock's 3/4/13 change 6fa8f59 so that Rabl-translated JSON Strings come back as valid JSON
          return object if object.is_a?(String)
          return object.to_json if object.respond_to?(:to_json)
          MultiJson.dump(object)
        end

      end
    end
  end
end
