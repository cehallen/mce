require 'spec_helper'

module CapybaraHelpers
  def wait_for_words
    start = Time.now
    while true
      break if page.has_content?('astrophysicists')  # [check for whizboo here, e.g. with page.evaluate_script]
      if Time.now > start + 10.seconds
        fail "It didn't happen."
      end
      sleep 0.1
    end
  end
end
