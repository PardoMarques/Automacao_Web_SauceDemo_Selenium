Dir["path/to/pages/* .rb"].each {|file| require file}
require 'pry'

class InventoryPage < BasePage
    
    attr_accessor :driver
    def initialize(webDriver)
        @driver = webDriver
    end

    # mapeamento

        def box_filter
            @driver.find_element(:css, '#inventory_filter_container > select.product_sort_container')
        end

        def box_filter_after
            @driver.find_element(:css, "#inventory_filter_container > select > option")
        end

    # end

    # metodos
    
        # @inventory.itemEOpcao('Sauce Labs Onesi', 'preco')
        def itemEOpcao (itemNome, opcao)
            aux = driver.find_element(:xpath, "//*[contains(text(), '#{itemNome}')]")
            auxPais = aux.find_element(:xpath, "../../..")

            case opcao
                when "item"
                    auxPais.find_element(:xpath, "//*[contains(text(), '#{itemNome}')]").click

                when "descricao"
                    return auxPais.find_element(:css, ".inventory_item_desc").text

                when "preco"
                    return auxPais.find_element(:css, ".inventory_item_price").text

                when "adicionar"
                    auxPais.find_element(:xpath, "//*[contains(text(), 'ADD TO CART')]").click

                else 
                    puts "Nenhuma opção encontrada"
            end
        end

        def filtrarPor(opcao)
            box_filter.click
            sleep 1
            
            case opcao
                when "A a Z"
                    box_filter_after.find_element(:xpath, "//*[contains(text(), 'Name (A to Z)')]").click

                when "Z a A"
                    box_filter_after.find_element(:xpath, "//*[contains(text(), 'Name (Z to A)')]").click
                        
                when "Menor preco"
                    box_filter_after.find_element(:xpath, "//*[contains(text(), 'Price (low to high)')]").click

                when "Maior preco"
                    box_filter_after.find_element(:xpath, "//*[contains(text(), 'Price (high to low)')]").click

                else 
                    puts "Nenhuma opção encontrada"

            end
            sleep 1
            
            box_filter.click
        end

        def irPara
            @driver.navigate.to("https://www.saucedemo.com/inventory.html")
        end

    # end
    
end