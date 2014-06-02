module Relevance
  module CoreExtensions

    module TestCaseExtensions
      def tarantula_crawl(integration_test, options = {})
        url = options[:url] || "/"
        t = tarantula_crawler(integration_test, options)
        t.crawl url
      end

      def tarantula_crawler(integration_test, options = {})
        Relevance::Tarantula::RailsIntegrationProxy.rails_integration_test(integration_test, options)
      end
    end

  end
end

if defined? ActionController::IntegrationTest
  ActionController::IntegrationTest.class_eval { include Relevance::CoreExtensions::TestCaseExtensions }
elsif defined? ActionDispatch::IntegrationTest
  ActionDispatch::IntegrationTest.class_eval { include Relevance::CoreExtensions::TestCaseExtensions }
end