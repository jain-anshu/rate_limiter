class ExamplesController < ApplicationController
    def index
        render json: {msg: "Success"}
    end
end