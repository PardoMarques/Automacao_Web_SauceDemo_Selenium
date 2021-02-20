Dir["path/to/pages/* .rb"].each {|file| require file}

class ItemPage < BasePage
    
    attr_accessor :driver
    def initialize(webDriver)
        @driver = webDriver
    end

    def inserirProduto(nomeDoProduto)
        #abc
    end
  
    def go
        visit 'users/new'
    end
    
end