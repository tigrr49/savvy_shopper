class UnitsController < ApplicationController
  def index
    @units = Unit.all

    render("units/index.html.erb")
  end

  def show
    @unit = Unit.find(params[:id])

    render("units/show.html.erb")
  end

  def new
    @unit = Unit.new

    render("units/new.html.erb")
  end

  def create
    @unit = Unit.new

    @unit.name = params[:name]

    save_status = @unit.save

    if save_status == true
      redirect_to("/units/#{@unit.id}", :notice => "Unit created successfully.")
    else
      render("units/new.html.erb")
    end
  end

  def edit
    @unit = Unit.find(params[:id])

    render("units/edit.html.erb")
  end

  def update
    @unit = Unit.find(params[:id])

    @unit.name = params[:name]

    save_status = @unit.save

    if save_status == true
      redirect_to("/units/#{@unit.id}", :notice => "Unit updated successfully.")
    else
      render("units/edit.html.erb")
    end
  end

  def destroy
    @unit = Unit.find(params[:id])

    @unit.destroy

    if URI(request.referer).path == "/units/#{@unit.id}"
      redirect_to("/", :notice => "Unit deleted.")
    else
      redirect_to(:back, :notice => "Unit deleted.")
    end
  end
end
