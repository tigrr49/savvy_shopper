class ItemsController < ApplicationController
  def index
    @items = Item.all

    render("items/index.html.erb")
  end

  def show
    @item = Item.find(params[:id])

    render("items/show.html.erb")
  end

  def new
    @item = Item.new

    render("items/new.html.erb")
  end

  def create
    @item = Item.new

    @item.category_id = params[:category_id]
    @item.name = params[:name]
    @item.brand = params[:brand]
    @item.size = params[:size]
    @item.unit_id = params[:unit_id]

    save_status = @item.save

    if save_status == true
      redirect_to("/items/#{@item.id}", :notice => "Item created successfully.")
    else
      render("items/new.html.erb")
    end
  end

  def edit
    @item = Item.find(params[:id])

    render("items/edit.html.erb")
  end

  def update
    @item = Item.find(params[:id])

    @item.category_id = params[:category_id]
    @item.name = params[:name]
    @item.brand = params[:brand]
    @item.size = params[:size]
    @item.unit_id = params[:unit_id]

    save_status = @item.save

    if save_status == true
      redirect_to("/items/#{@item.id}", :notice => "Item updated successfully.")
    else
      render("items/edit.html.erb")
    end
  end

  def destroy
    @item = Item.find(params[:id])

    @item.destroy

    if URI(request.referer).path == "/items/#{@item.id}"
      redirect_to("/", :notice => "Item deleted.")
    else
      redirect_to(:back, :notice => "Item deleted.")
    end
  end
end
