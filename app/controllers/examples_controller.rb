class ExamplesController < ApplicationController
    def index
        render json: {msg: "Success"}
    end

    def show   
        render json: {msg: "Success"} 
    end

    def limited
        render json: {msg: "Success"}
    end
    
    def unlimited
        render json: {msg: "Success"}
    end
end