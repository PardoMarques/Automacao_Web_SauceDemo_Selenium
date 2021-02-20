Dir["path/to/pages/* .rb"].each {|file| require file}

class LoginPage < BasePage

    attr_accessor :driver
    def initialize(webDriver)
        @driver = webDriver
    end

    # mapeamento

        def input_login, 
            @driver.find_element(:css, '#user-name')
        end
        
        def input_senha, 
            @driver.find_element(:css, '#password')
        end
        
        def btn_logar, 
            @driver.find_element(:css, '#login-button')
        end
        
        def text_alerta, 
            @driver.find_element(:css, 'h3[data-test="error"]')
        end

        
        def info_login, 
            @driver.find_element(:css, '#login_credentials')
        end
        
        def info_senha, 
            @driver.find_element(:css, 'div.login_password')
        end

    # end

    # metodos

        def fazerLogin(login, senha)
            input_login.send_keys(login)
            input_senha.send_keys(senha)
            btn_logar.click
        end
    
        def irPara
            @driver.navigate.to("https://www.saucedemo.com/")
        end

    # end
    
end