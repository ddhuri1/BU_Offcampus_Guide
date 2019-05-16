class EssentialsController < ApplicationController
    def index
    end
    def new
        @essential = Essential.new
    end
    def show
        @essential = Essential.find(params[:id]) 
    end
    
end  
