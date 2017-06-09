class ShoppingListItemsController < ApplicationController
  def index
    @shopping_list_items = ShoppingListItem.where( :user_id => current_user.id)

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

  def inc_qty
    shopping_list_item_to_update = ShoppingListItem.find(params[:shopping_list_item_id])
    shopping_list_item_to_update.quantity = shopping_list_item_to_update.quantity + 1
    save_status = shopping_list_item_to_update.save

    if save_status == true
      redirect_to("/shopping_list_items/", :notice => "Quantity increased successfully.")
    end
  end

  def dec_qty
    shopping_list_item_to_update = ShoppingListItem.find(params[:shopping_list_item_id])
    shopping_list_item_to_update.quantity = shopping_list_item_to_update.quantity - 1
    save_status = shopping_list_item_to_update.save

    if save_status == true
      redirect_to("/shopping_list_items/", :notice => "Quantity decreased successfully.")
    else
      redirect_to("/shopping_list_items/", :alert => "Quantity must be greater than 0.  Click [Remove] instead to remove item from the list.")
    end
  end

  def create
    @shopping_list_item = ShoppingListItem.new

    @shopping_list_item.user_id = current_user.id
    @shopping_list_item.price_entry_id = params[:id]
    @shopping_list_item.quantity = 1
    @shopping_list_item.item_id = PriceEntry.find(params[:id]).item_id

    save_status = @shopping_list_item.save

    if save_status == true
      redirect_to("/shopping_list_items/", :notice => "Item successfully added to your shopping list.")
    else
      redirect_to("/shopping_list_items/", :alert => "This item is already on your shopping list.")
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

    redirect_to("/shopping_list_items/", :notice => "Shopping list item deleted.")
  end
end
