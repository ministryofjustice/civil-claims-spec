require 'ruby-jmeter'

class JmeterTestCase
  def initialize(concurrent, testcase)
    @users = concurrent
    @testcase = testcase
  end
end