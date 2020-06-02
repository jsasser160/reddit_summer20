class SubsController < ApplicationController
  # skinny controllers, fat models. 
  # actions belong in controllers
  # logic belongs in models
  #                     http verb
  # C create              POST
  # R read                GET
  # U update              PUT / PATCH
  # D destroy             DELETE

  # by default the controller actions return html, XML, JSON
  # if none are specified then go to an action that does

  # index - show all of records
  # # READ / GET
  # def index
  #   @model_names = Model_name.all
  # end

  # show - show a single record, id
  #  # READ / GET
  # def show
  #   @model_name = Model_name.find(params[:id])
  # end

  # new - new form for a new record, create record in memory
  # READ / GET
  # def new
  #   @model_name = Model_name.new
  # end

  # edit - edit form for a record, id, update record in memory
  # # READ / GET
  # def edit
  #   @model_name = Model_name.find(params[:id])
  # end

  # create - creates the record in the database
  # # CREATE / POST
  # def create
  #   @model_name = Model_name.new(model_name_params)
  #   if @model_name.save
  #     do something or go somewhere
  #   else
  #     render :new
  #   end
  # end
  # .
  # .
  # .
  # private
  #   def model_name_params
  #     params.require(:model_name).permit(:attr, :everythingtable has)
  #   end

  # update - update the record in your database
  # # UPDATE / PUT
  # def update
  #   @model_name = Model_name.find(params[:id])
  #   if @model_name.update(model_name_params)
  #     do something or go somewhere
  #   else
  #     render :edit
  #   end
  # end

  # destroy - delete the record from the database, id
  # # DESTROY / DELETE
  # def destroy
  #   @model_name = Model_name.find(params[:id])
  #   @model_name.destroy
  #   send somewhere

  #   or

  #   Model_name.find(params[:id]).destroy
  #   send somewhere
  # end

  # callback logic at a certain time
  # before_action
    # before_action :method_name
    # before_action :method_name, only: [:show, :update, :edit, :destroy]
    # before_action :method_name, except: [:index, :new, :create]

  # after_action
  # skip_before_action


  # GET 
  def index
    @subs = Sub.all
    # render index.html.erb
  end

  def show
    @sub = Sub.find(params[:id])
    # render show.html.erb
  end

  def new
    @sub = Sub.new
    render partial: 'form'
    # render new.html.erb
  end
  
  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'
    # render edit.html.erb edit form
  end

  def update
    # look up a record and return the record
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end

  def destroy
    # @sub = Sub.find(params[:id])
    # @sub.destroy
    # redirect_to_subs_path
    # or
    Sub.find(params[:id]).destroy
    redirect_to subs_path
  end

  private
    def sub_params
      # { sub: {name: 'puppies', age: 12, pass: select + password from user } }
      params.require(:sub).permit(:name)
    end
end
