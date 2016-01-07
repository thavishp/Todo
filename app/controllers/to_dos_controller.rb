class ToDosController < ApplicationController

	layout "application"

  def index
  	@todos = ToDo.all
  end

  def new
    @todo = ToDo.new
  end

  def create
    @todo = ToDo.new(todo_params)

    if @todo.save
      flash[:notice] = "Todo Created"
      redirect_to(action: 'index')
    else
      render('new')
    end
  end

  def edit
    @todo = ToDo.find(params[:id])
  end

  def update
    @todo = ToDo.find(params[:id])

    if @todo.update_attributes(todo_params)
      flash[:notice] = "'#{@todo.title}' Updated"
      redirect_to to_dos_path
    else
      render('edit')
    end
  end

  def destroy
    todo = ToDo.find(params[:id]).destroy

    flash[:notice] = "'#{todo.title}' Completed"
    redirect_to to_dos_path
  end

  private

  def todo_params
    params.require(:to_do).permit(:title, :content)
  end
end
