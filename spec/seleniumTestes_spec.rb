require_relative 'pages/_base_page.rb'
require_relative 'pages/cart_page.rb'
require_relative 'pages/inventory_page.rb'
require_relative 'pages/item_page.rb'
require_relative 'pages/login_page.rb'

require "pry"
require "rspec"
require "selenium-webdriver"

describe "Testes da pagina SauceDemo" do

    # Antes de tudo, executar
    before(:all) do

        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument('start-maximized')
        #options.add_argument('headless')
        driver = Selenium::WebDriver.for :chrome, options: options
        wait = Selenium::WebDriver::Wait.new(:timout => 10)

        # @driver = Selenium::WebDriver.for :chrome, options: options
        # @wait = Selenium::WebDriver::Wait.new(:timout => 10)

        binding.pry

        @base = BasePage.new(driver)
        @cart = CartPage.new(driver)
        @inventory = InventoryPage.new(driver)
        @item = ItemPage.new(driver)
        @login = LoginPage.new(driver)
        
        
    end

    # Antes de tudo, executar
    # before(:each) do
    #     @driver.navigate.to("https://www.saucedemo.com/")
    # end

    # # Depois de tudo, executar
    # after(:all) do
    #     @driver.quit
    # end

    describe "LoginPage" do

        it "-> Login executado com erro" do

            binding.pry

            @driver.find_element(:id, "user-name").send_keys("standard_user")
            @driver.find_element(:id, "password").send_keys("senhaerrada")
            @driver.find_element(:id,"login-button").click
            expect(@driver.page_source).to include("Epic sadface: Username and password do not match any user in this service")
        end

    end

    it "-> Login executado com erro" do
        @driver.find_element(:id, "user-name").send_keys("standard_user")
        @driver.find_element(:id, "password").send_keys("senhaerrada")
        @driver.find_element(:id,"login-button").click
        expect(@driver.page_source).to include("Epic sadface: Username and password do not match any user in this service")
    end

    it "-> Login executado com sucesso" do
        @driver.find_element(:id, "user-name").send_keys("standard_user")
        @driver.find_element(:id, "password").send_keys("secret_sauce")
        @driver.find_element(:id,"login-button").click
        expect(@driver.page_source).to include("Products")
    end

end