Dir["path/to/pages/* .rb"].each {|file| require file}

class LoginPage < BasePage

    attr_accessor :driver
    def initialize(webDriver)
        @driver = webDriver
    end

    def fazerLogin(nomeDoProduto)
        @driver.find_element(:id, "user-name").send_keys("standard_user")
        @driver.find_element(:id, "password").send_keys("secret_sauce")
        @driver.find_element(:id,"login-button").click
    end
  
    def irPara
        @driver.navigate.to("https://www.saucedemo.com/")
    end
    
end