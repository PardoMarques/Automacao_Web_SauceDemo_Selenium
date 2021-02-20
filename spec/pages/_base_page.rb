Dir["path/to/pages/* .rb"].each {|file| require file}
#require_relative "../seleniumTestes_spec.rb"

class BasePage

    attr_accessor :driver
    def initialize(webDriver)
        @driver = webDriver
    end
  
    def irPara
        @driver.navigate.to("https://www.saucedemo.com/")
    end
    
end