require "spec_helper"

describe "TestCase extensions" do
  pending "can create the crawler" do
    Relevance::Tarantula::RailsIntegrationProxy.stubs(:rails_root).returns("STUB_RAILS_ROOT")
    Relevance::Tarantula::Crawler.any_instance.stubs(:rails_root).returns("STUB_RAILS_ROOT")
    tarantula_crawler(stub_everything)
  end

  pending "can crawl" do
    (crawler = mock).expects(:crawl).with("/foo")
    expects(:tarantula_crawler).returns(crawler)
    tarantula_crawl(:integration_test_stub, :url => "/foo")
  end

  it "should get mixed into ActionController::IntegrationTest" do
    klass = defined?(ActionController::IntegrationTest) ?  ActionController::IntegrationTest :  ActionDispatch::IntegrationTest
    klass.ancestors.should include(Relevance::CoreExtensions::TestCaseExtensions)
  end
end
