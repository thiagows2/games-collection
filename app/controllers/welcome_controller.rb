class WelcomeController < ApplicationController
  def index
    @meu_nome = params[:meu_nome]
  end
end
