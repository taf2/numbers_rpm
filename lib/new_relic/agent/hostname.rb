# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/rpm/blob/master/LICENSE for complete details.

module NewRelic
  module Agent
    module Hostname
      def self.get
        'ctm-numbers'
      end

      def self.heroku_dyno_name_prefix(dyno_name)
        get_dyno_prefixes.find do |dyno_prefix|
          dyno_name.start_with?(dyno_prefix + ".")
        end
      end

      def self.get_dyno_prefixes
        ::NewRelic::Agent.config[:'heroku.dyno_name_prefixes_to_shorten']
      end
    end
  end
end
