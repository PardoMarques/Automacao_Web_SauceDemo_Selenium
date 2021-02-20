require_relative 'pages/_base_page.rb'
require_relative 'pages/cart_page.rb'
require_relative 'pages/inventory_page.rb'
require_relative 'pages/item_page.rb'
require_relative 'pages/login_page.rb'

require "pry"
require "rspec"
require "selenium-webdriver"

describe "Testes da pagina SauceDemo" do

    # Antes de cada"each" teste, executar
    before(:each) do

        options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument('start-maximized')
        options.add_argument('headless')
        driver = Selenium::WebDriver.for :chrome, options: options
        @wait = Selenium::WebDriver::Wait.new(:timout => 10)

        @base =         BasePage.new(driver)
        @cart =         CartPage.new(driver)
        @inventory =    InventoryPage.new(driver)
        @item =         ItemPage.new(driver)
        @login =        LoginPage.new(driver)

        @base.irPara

    end

    # Depois de cada teste, executar
    after(:each) do
        @base.driver.quit
    end

    describe "LoginPage" do

        it "-> Login executado com sucesso" do
            @login.fazerLogin('standard_user','secret_sauce')

            expect(@login.driver.page_source).to include("Products")
        end

        it "-> Login executado com erro" do
            @login.fazerLogin('standard_user','senhaerrada')

            expect(@login.driver.page_source).to include("Epic sadface: Username and password do not match any user in this service")
        end

    end

    describe "InventoryPage" do

        before(:each) do
            @login.fazerLogin('standard_user','secret_sauce')
        end

        it "-> Selecionando um produto" do
            @inventory.itemEOpcao('Sauce Labs Onesie', 'preco')

            expect(@inventory.itemEOpcao('Sauce Labs Onesie', 'preco')).to include("$7.99")
        end

    end

end