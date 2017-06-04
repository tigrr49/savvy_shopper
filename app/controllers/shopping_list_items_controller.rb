class ShoppingListItemsController < ApplicationController
  def index
    @shopping_list_items = ShoppingListItem.all

    render("shopping_list_items/index.html.erb")
  end

  def show
    @shopping_list_item = ShoppingListItem.find(params[:id])

    render("shopping_list_items/show.html.erb")
  end

  def new
    @shopping_list_item = ShoppingListItem.new

    render("shopping_list_items/new.html.erb")
  end

  def create
    @shopping_list_item = ShoppingListItem.new

    @shopping_list_item.user_id = params[:user_id]
    @shopping_list_item.item_id = params[:item_id]
    @shopping_list_item.quantity = params[:quantity]

    save_status = @shopping_list_item.save

    if save_status == true
      redirect_to("/shopping_list_items/#{@shopping_list_item.id}", :notice => "Shopping list item created successfully.")
    else
      render("shopping_list_items/new.html.erb")
    end
  end

  def edit
    @shopping_list_item = ShoppingListItem.find(params[:id])

    render("shopping_list_items/edit.html.erb")
  end

  def update
    @shopping_list_item = ShoppingListItem.find(params[:id])

    @shopping_list_item.user_id = params[:user_id]
    @shopping_list_item.item_id = params[:item_id]
    @shopping_list_item.quantity = params[:quantity]

    save_status = @shopping_list_item.save

    if save_status == true
      redirect_to("/shopping_list_items/#{@shopping_list_item.id}", :notice => "Shopping list item updated successfully.")
    else
      render("shopping_list_items/edit.html.erb")
    end
  end

  def destroy
    @shopping_list_item = ShoppingListItem.find(params[:id])

    @shopping_list_item.destroy

    if URI(request.referer).path == "/shopping_list_items/#{@shopping_list_item.id}"
      redirect_to("/", :notice => "Shopping list item deleted.")
    else
      redirect_to(:back, :notice => "Shopping list item deleted.")
    end
  end
end
