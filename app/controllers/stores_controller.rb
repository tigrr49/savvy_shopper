class StoresController < ApplicationController
  def index
    @store = Store.new
    @stores = Store.all

    render("stores/index.html.erb")
  end

  def show
    @store = Store.find(params[:id])

    render("stores/show.html.erb")
  end

  def new
    @store = Store.new

    render("stores/new.html.erb")
  end

  def create
    @stores = Store.all

    @store = Store.new
    @store.name = params[:name]
    save_status = @store.save

    if save_status == true
      redirect_to("/stores/", :notice => "Store created successfully.")
    else
      render("stores/index.html.erb")
    end
  end

  def edit
    @store = Store.find(params[:id])
    @store_to_update = Store.find(params[:id])

    render("stores/edit.html.erb")
  end

  def update
    @store = Store.find(params[:id])
    @store_to_update = Store.find(params[:id])

    @store_to_update.name = params[:name]

    save_status = @store_to_update.save

    if save_status == true
      redirect_to("/stores/", :notice => "Store updated successfully.")
    else
      render("stores/edit.html.erb")
    end
  end

  def destroy
    @store = Store.find(params[:id])

    @store.destroy

    if URI(request.referer).path == "/stores/#{@store.id}"
      redirect_to("/", :notice => "Store deleted.")
    else
      redirect_to(:back, :notice => "Store deleted.")
    end
  end
end
