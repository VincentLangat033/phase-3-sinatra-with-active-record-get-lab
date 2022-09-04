class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/bakeries' do
    bakeries = Bakery.all
  # send them back as a JSON array
  bakeries.to_json(include: :baked_goods)
  end
  # get all the bakeries from the database
  get '/bakeries/:id' do
    # look up the game in the database using its ID
    bakery = Bakery.find(params[:id])
    # send a JSON-formatted response of the game data
    bakery.to_json(include: :baked_goods)
  
  end
  # get '/baked_goods/by_price' do 
  #   baked_goods = BakedGood.all.order('price DESC')
  #   baked_goods.to_json
  # end

  # get '/baked_goods/most_expensive' do
  #   most_expensive= BakedGood.all.order('price DESC').limit(1)
  #   most_expensive.to_json(only: [:name, :price])
  # end
  get '/baked_goods/by_price' do
    BakedGood.all.order(price: :desc).to_json
  end

  get '/baked_goods/most_expensive' do
    BakedGood.all.order(price: :desc).limit(1).to_json(only: [:name, :price])
  end
  



end
