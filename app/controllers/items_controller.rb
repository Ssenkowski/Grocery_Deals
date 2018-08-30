class ItemsController < ApplicationController
  def index
    @items = Item.all

    respond_to do |f|
      f.html
      f.json {render json: @items}
    end
  end

  def new
      @item = Item.new

    respond_to do |f|
      f.html
      f.json {render json: @item}
    end
  end

  def create
    @item = Item.new(item_params)
    # if @item.save
    #
    #   render json: @item.to_json(only: [:name, :store, :item_id, :price, :id])
    # else
      render "new"
    # end

  end

  def update
    # @user.save
    #
    # redirect_to "/publishers/#{@publisher.id}"
  end

  def edit
  end

  def show
    @item = Item.find_by_id(params[:id])
  end

  private

      def item_params
        params.require(:item).permit(:name, :store, :item_id, :price, :id, :category_id)
      end




      #----------------------------------------------------------------
      # Methods specific to selecting and buying items below
      #----------------------------------------------------------------


end
