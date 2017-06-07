class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all

    render("categories/index.html.erb")
  end

  def show
    @category = Category.find(params[:id])

    render("categories/show.html.erb")
  end

  def new
    @category = Category.new

    render("categories/new.html.erb")
  end

  def create
    @categories = Category.all

    @category = Category.new
    @category.name = params[:name]
    save_status = @category.save

    if save_status == true
      redirect_to("/categories/", :notice => "Category created successfully.")
    else
      render("categories/index.html.erb")
    end
  end

  def edit
    @category = Category.find(params[:id])
    @category_to_update = Category.find(params[:id])

    render("categories/edit.html.erb")
  end

  def update
    @category = Category.find(params[:id])
    @category_to_update = Category.find(params[:id])

    @category_to_update.name = params[:name]

    save_status = @category_to_update.save

    if save_status == true
      redirect_to("/categories/", :notice => "Category updated successfully.")
    else
      render("categories/edit.html.erb")
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.destroy

    if URI(request.referer).path == "/categories/#{@category.id}"
      redirect_to("/", :notice => "Category deleted.")
    else
      redirect_to(:back, :notice => "Category deleted.")
    end
  end
end
