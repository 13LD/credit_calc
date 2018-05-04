require 'sinatra'
require_relative 'lib/credit_calc'
require_relative 'lib/standart_calc'
require_relative 'lib/annuity_calc'

get '/' do
  erb :index
end

post '/calc' do
  method = params[:payout] == "standart" ? StandartCalc : AnnuityCalc
  @result = method.new(params[:percent], params[:credit], params[:term])
  @result.calculate
  erb :calc
end