describe "Pagina de Login" do

    # Antes de tudo, executar
    before(:all) do
        @driver = Selenium::WebDriver.for(:chrome)
    end

    # Antes de tudo, executar
    before(:each) do
        @driver.navigate.to("https://www.saucedemo.com/")
    end

    # Depois de tudo, executar
    after(:all) do
        @driver.quit
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