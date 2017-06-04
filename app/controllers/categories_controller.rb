class CategoriesController < ApplicationController
  def index
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
    @category = Category.new

    @category.name = params[:name]

    save_status = @category.save

    if save_status == true
      redirect_to("/categories/#{@category.id}", :notice => "Category created successfully.")
    else
      render("categories/new.html.erb")
    end
  end

  def edit
    @category = Category.find(params[:id])

    render("categories/edit.html.erb")
  end

  def update
    @category = Category.find(params[:id])

    @category.name = params[:name]

    save_status = @category.save

    if save_status == true
      redirect_to("/categories/#{@category.id}", :notice => "Category updated successfully.")
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
