Dir["path/to/pages/* .rb"].each {|file| require file}
#require_relative "../seleniumTestes_spec.rb"

class BasePage

    attr_accessor :driver
    def initialize(webDriver)
        @driver = webDriver
    end

    # mapeamento

        def btn_menu
            @driver.find_element(:css, 'div.bm-burger-button > button')
        end

        def content_menu
            @driver.find_element(:css, '#menu_button_container > div > div.bm-menu-wrap')
        end

        def icon_carrinho
            @driver.find_element(:css, '#shopping_cart_container')
        end

        def text_titulo
            @driver.find_element(:css, '#inventory_filter_container > div')
        end

    # end
        
    # metodos

        def menuOptions(btnOption)
            case btnOption
                when 0 then content_menu.find_element(:xpath, "//*[contains(text(), 'All Items')]")
                when 1 then content_menu.find_element(:xpath, "//*[contains(text(), 'About')]")
                when 2 then content_menu.find_element(:xpath, "//*[contains(text(), 'Logout')]")
                when 3 then content_menu.find_element(:xpath, "//*[contains(text(), 'Reset App State')]")
                else puts "Nenhuma opção encontrada"
            end
        end

        def irPara
            @driver.navigate.to("https://www.saucedemo.com/")
        end

    # end
    
end