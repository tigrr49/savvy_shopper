class ItemsController < ApplicationController
  def index
    @items = Item.all

    render("items/index.html.erb")
  end

  def index_sale
    @items = Item.all
    @items_on_sale_by_price_entry = []

    @items.each do |item|
      item_price_entries = item.price_entries
      next if item_price_entries == []

      # only take into account unique prices when determining average
      item_average_price = item.price_entries.pluck(:price).uniq.sum / item.price_entries.pluck(:price).uniq.count

      item_price_entries.each do |price_entry|
        # if the price entry is < 7 days old, price < average, and the price entry is the latest for that store, add the price entry to the sale list
        price_entry_for_compare = PriceEntry.where("item_id = ? AND store_id = ? AND created_at > ? AND price < ?", price_entry.item_id, price_entry.store_id, Time.now - 604800, item_average_price).last

        next if price_entry_for_compare.blank?
        if price_entry.id == price_entry_for_compare.id
          @items_on_sale_by_price_entry.push(price_entry)
        end
      end
    end

    render("items/index_sale.html.erb")
  end

  def search
    @items_to_display = []
    @search_flag = 0
    @category = params[:category_id]
    @name = params[:name]
    @brand = params[:brand]

    # Item.where("category_id = '5' OR name ='xyz' OR brand = 'xyz'")
    if @category.nil? && @name.nil? && @brand.nil?
    elsif @category == "" && @name == "" && @brand == ""
      @items_to_display = Item.all.order(category_id: :asc, name: :asc)
      @search_flag = 1
    elsif @category != "" && @name == "" && @brand == ""
      @items_to_display = Item.where({:category_id => @category}).order(category_id: :asc, name: :asc)
      @search_flag = 1
    elsif @category == "" && @name != "" && @brand == ""
      @items_to_display = Item.where({:name => @name}).order(category_id: :asc, name: :asc)
      @search_flag = 1
    elsif @category == "" && @name == "" && @brand != ""
      @items_to_display = Item.where({:brand => @brand}).order(category_id: :asc, name: :asc)
      @search_flag = 1
    elsif @category != "" && @name != "" && @brand == ""
      @items_to_display = Item.where({:category_id => @category, :name => @name}).order(category_id: :asc, name: :asc)
      @search_flag = 1
    elsif @category == "" && @name != "" && @brand != ""
      @items_to_display = Item.where({:name => @name, :brand => @brand}).order(category_id: :asc, name: :asc)
      @search_flag = 1
    elsif @category != "" && @name == "" && @brand != ""
      @items_to_display = Item.where({:category_id => @category, :brand => @brand}).order(category_id: :asc, name: :asc)
      @search_flag = 1
    elsif @category != "" && @name != "" && @brand != ""
      @items_to_display = Item.where({:category_id => @category, :name => @name, :brand => @brand}).order(category_id: :asc, name: :asc)
      @search_flag = 1
    end


    @items_on_sale_by_price_entry = []
    @items_to_display.each do |item|
      item_price_entries = item.price_entries
      next if item_price_entries == []

      # only take into account unique prices when determining average
      item_average_price = item.price_entries.pluck(:price).uniq.sum / item.price_entries.pluck(:price).uniq.count

      item_price_entries.each do |price_entry|
        # if the price entry is < 7 days old, price < average, and the price entry is the latest for that store, add the price entry to the sale list
        price_entry_for_compare = PriceEntry.where("item_id = ? AND store_id = ? AND created_at > ? AND price < ?", price_entry.item_id, price_entry.store_id, Time.now - 604800, item_average_price).last

        next if price_entry_for_compare.blank?
        if price_entry.id == price_entry_for_compare.id
          @items_on_sale_by_price_entry.push(price_entry.item_id)
        end
      end
    end

  end

  def shoppinglist



  end

  def show
    @item = Item.find(params[:id])

    if @item.price_entries.count == 0
      @average_price = "TBD"
      @average_unit_price = "TBD"
      @lowest_reported_price = "No reported prices yet"
      @lowest_reported_store = "No reported prices yet"
      @lowest_reported_date = "No reported prices yet"
      @highest_reported_price = "No reported prices yet"
      @highest_reported_store = "No reported prices yet"
      @highest_reported_date = "No reported prices yet"
    else
      @average_price = @item.price_entries.pluck(:price).uniq.sum / @item.price_entries.pluck(:price).uniq.count
      @average_unit_price = @average_price / @item.size
      @lowest_reported_price = @item.price_entries.pluck(:price).min
      # in the case of more than one min, show the most recent report
      @lowest_reported_store = @item.price_entries.order(price: :asc, created_at: :desc).first.store.name
      @lowest_reported_date = @item.price_entries.order(price: :asc, created_at: :desc).first.created_at
      @highest_reported_price = @item.price_entries.pluck(:price).max
      # in the case of more than one max, show the most recent report
      @highest_reported_store = @item.price_entries.order(price: :desc, created_at: :desc).first.store.name
      @highest_reported_date = @item.price_entries.order(price: :desc, created_at: :desc).first.created_at
    end

    @where_item_on_sale = []
    if @item.price_entries != []
      # only take into account unique prices when determining average
      item_average_price = @item.price_entries.pluck(:price).uniq.sum / @item.price_entries.pluck(:price).uniq.count

      @item.price_entries.each do |price_entry|
        # if the price entry is < 7 days old, price < average, and the price entry is the latest for that store, add the price entry to the sale list
        price_entry_for_compare = PriceEntry.where("item_id = ? AND store_id = ? AND created_at > ? AND price < ?", price_entry.item_id, price_entry.store_id, Time.now - 604800, item_average_price).last

        next if price_entry_for_compare.blank?
        if price_entry.id == price_entry_for_compare.id
          @where_item_on_sale.push(price_entry)
        end
      end
    end

    render("items/show.html.erb")
  end

  def new
    @item = Item.new

    render("items/new.html.erb")
  end

  def create
    new_entries = Item.new
    existing_entries = Item.new
    @item = Item.new

    @item.category_id = params[:category_id]
    @item.size = params[:size]
    @item.unit_id = params[:unit_id]

    @new_name = params[:new_name]
    @new_brand = params[:new_brand]
    @existing_name = params[:existing_name]
    @existing_brand = params[:existing_brand]

    if @existing_name.blank?
      @item.name = params[:new_name]
    elsif @new_name.blank?
      @item.name = params[:existing_name]
    end

    if @existing_brand.blank?
      @item.brand = params[:new_brand]
    elsif @new_brand.blank?
      @item.brand = params[:existing_brand]
    end

    save_status = @item.save
    # @item.name = params[:new_name]
    # @item.brand = params[:new_brand]

    if save_status == true
      redirect_to("/items/#{@item.id}", :notice => "Item created successfully.")
    else
      # http://api.rubyonrails.org/classes/ActiveModel/Errors.html
      if !@new_name.blank? && !@existing_name.blank?
        @item.errors.delete(:name)
        @item.errors.add(:name, "^Name:  either select an existing item name or enter a new one, but not both")
      end
      if !@new_brand.blank? && !@existing_brand.blank?
        @item.errors.delete(:brand)
        @item.errors.add(:brand, "^Brand:  either select an existing brand or enter a new one, but not both")
      end
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
