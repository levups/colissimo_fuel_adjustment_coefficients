# frozen_string_literal: true

# The HTTParty documentation advise to create new classes to parameter behavior
class PlainHttpClient
  include HTTParty

  uri_adapter Addressable::URI
end
