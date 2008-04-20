class <%= controller_class_name %>Controller < ApplicationController
  before_filter :get_<%= parent_singular_name %>

  # GET /<%= table_name %>
  # GET /<%= table_name %>.xml
  def index
    @<%= table_name %> = @<%= parent_singular_name %>.<%= plural_name %>

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @<%= table_name %>.to_xml }
    end
  end

  # GET /<%= table_name %>/1
  # GET /<%= table_name %>/1.xml
  def show
    @<%= file_name %> = @<%= parent_singular_name %>.<%= plural_name %>.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @<%= file_name %>.to_xml }
    end
  end

  # GET /<%= table_name %>/new
  def new
    @<%= file_name %> = @<%= parent_singular_name %>.<%= plural_name %>.new
  end

  # GET /<%= table_name %>/1;edit
  def edit
    @<%= file_name %> = <%= class_name %>.find(params[:id])
  end

  # POST /<%= table_name %>
  # POST /<%= table_name %>.xml
  def create
    @<%= file_name %> = <%= class_name %>.new(params[:<%= file_name %>])

    respond_to do |format|
      if @<%= parent_singular_name %>.<%= plural_name %> << @<%= file_name %>
        flash[:notice] = _('%s was successfully created.', <%= class_name %>.human_name)
        format.html { redirect_to <%= parent_singular_name %>_url(@<%= parent_singular_name %>) }
        format.xml  { head :created, :location => <%= file_name %>_url(@<%= file_name %>) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @<%= file_name %>.errors.to_xml }
      end
    end
  end

  # PUT /<%= table_name %>/1
  # PUT /<%= table_name %>/1.xml
  def update
    @<%= file_name %> = @<%= parent_singular_name %>.<%= plural_name %>.find(params[:id])

    respond_to do |format|
      if @<%= file_name %>.update_attributes(params[:<%= file_name %>])
        flash[:notice] = _('%s was successfully updated.', <%= class_name %>.human_name)
        format.html { redirect_to <%= parent_singular_name %>_url(@<%= parent_singular_name %>) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @<%= file_name %>.errors.to_xml }
      end
    end
  end

  # DELETE /<%= table_name %>/1
  # DELETE /<%= table_name %>/1.xml
  def destroy
    @<%= file_name %> = @<%= parent_singular_name %>.<%= plural_name %>.find(params[:id])
    @<%= parent_singular_name %>.<%= plural_name %>.delete @<%= file_name %>

    respond_to do |format|
      format.html { redirect_to <%= parent_singular_name %>_url(@<%= parent_singular_name %>) }
      format.xml  { head :ok }
    end
  end

  private
  def get_<%= parent_singular_name %>
    <%= parent_singular_name %>_id = params[:<%= parent_singular_name %>_id]
    redirect_to <%= parent_plural_name %>_path unless <%= parent_singular_name %>_id
    @<%= parent_singular_name %> = <%= parent_class_name %>.find(<%= parent_singular_name %>_id)
  end
end
