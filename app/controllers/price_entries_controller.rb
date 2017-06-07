class PriceEntriesController < ApplicationController
  def index
    @price_entries = PriceEntry.all

    render("price_entries/index.html.erb")
  end

  def show
    @price_entry = PriceEntry.find(params[:id])

    render("price_entries/show.html.erb")
  end

  def new
    @price_entry = PriceEntry.new

    @item = Item.find(params[:item_id])

    render("price_entries/new.html.erb")
  end

  def create
    @price_entry = PriceEntry.new

    @price_entry.item_id = params[:item_id]
    @price_entry.store_id = params[:store_id]
    @price_entry.price = params[:price]

    save_status = @price_entry.save

    if save_status == true
      redirect_to("/items/#{@price_entry.item.id}", :notice => "Price entry created successfully.")
    else
      @item = Item.find(@price_entry.item_id)
      render("price_entries/new.html.erb")
    end
  end

  def edit
    @price_entry = PriceEntry.find(params[:id])

    render("price_entries/edit.html.erb")
  end

  def update
    @price_entry = PriceEntry.find(params[:id])

    @price_entry.item_id = params[:item_id]
    @price_entry.store_id = params[:store_id]
    @price_entry.price = params[:price]

    save_status = @price_entry.save

    if save_status == true
      redirect_to("/price_entries/#{@price_entry.id}", :notice => "Price entry updated successfully.")
    else
      render("price_entries/edit.html.erb")
    end
  end

  def update_all

  end

  def destroy
    @price_entry = PriceEntry.find(params[:id])

    @price_entry.destroy

    if URI(request.referer).path == "/price_entries/#{@price_entry.id}"
      redirect_to("/", :notice => "Price entry deleted.")
    else
      redirect_to(:back, :notice => "Price entry deleted.")
    end
  end
end
