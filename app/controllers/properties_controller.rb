class PropertiesController < ApplicationController
    before_filter :authorise, :except => [:index]
  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @properties }
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @property = Property.find(params[:id])

    if @property.users.size > 1
        @pronoun="them"
    elsif @property.users[0].gender == "Mr"
        @pronoun="him"
    else
        @pronoun="her"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/new
  # GET /properties/new.json
  def new
    @property = Property.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @property }
    end
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(params[:property])

    respond_to do |format|
      if @property.save
          @current_user.property_id = @property.id
          if @current_user.save
              format.html { redirect_to @property, notice: 'Property was successfully created.' }
              format.json { render json: @property, status: :created, location: @property }
          end
          format.html { render action: "new" }
          format.json { render json: @property.errors, status: :unprocessable_entity }
      else
        format.html { render action: "new" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /properties/1
  # PUT /properties/1.json
  def update
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property = Property.find(params[:id])
    @users = User.where("property_id IS ?", params[:id])
    @users.each do |user|
        user.property_id =nil
        user.save
    end
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  def link
      @current_user.property_id = params[:id]
      if @current_user.save
          flash[:notice]="Your property is now well linked to your account!"
          redirect_to @current_user
      else
          flash[:notice]="An error occured, please try again"
          redirect_to @current_user
      end
  end

  def unlink
      @current_user.property_id = nil
      @current_user.save
      @roommates = User.where("property_id IS ?", params[:id])
      if @roommates.empty?
          @property = Property.find(params[:id])
          @property.destroy
      end
      flash[:notice]="Your leaving is well saved!"
      redirect_to @current_user
  end

end
