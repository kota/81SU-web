class Api::KifusController < ApplicationController
  # GET /kifus
  # GET /kifus.xml
  def index
    @kifus = Kifu.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kifus }
    end
  end

  # GET /kifus/1
  # GET /kifus/1.xml
  def show
    @kifu = Kifu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kifu }
    end
  end

  # GET /kifus/new
  # GET /kifus/new.xml
  def new
    @kifu = Kifu.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kifu }
    end
  end

  # GET /kifus/1/edit
  def edit
    @kifu = Kifu.find(params[:id])
  end

  # POST /kifus
  # POST /kifus.xml
  def create
    @kifu = Kifu.new(params[:kifu])

    respond_to do |format|
      if @kifu.save
        flash[:notice] = 'Kifu was successfully created.'
        format.html { redirect_to(@kifu) }
        format.xml  { render :xml => @kifu, :status => :created }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kifu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kifus/1
  # PUT /kifus/1.xml
  def update
    @kifu = Kifu.find(params[:id])

    respond_to do |format|
      if @kifu.update_attributes(params[:kifu])
        flash[:notice] = 'Kifu was successfully updated.'
        format.html { redirect_to(@kifu) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kifu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kifus/1
  # DELETE /kifus/1.xml
  def destroy
    @kifu = Kifu.find(params[:id])
    @kifu.destroy

    respond_to do |format|
      format.html { redirect_to(kifus_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    @kifus = Array.new
    date1 = Date.strptime(params[:begin_date])
    date2 = Date.strptime(params[:end_date])
    Kifu.all.each { |k|
      if (Player.find(k.blackid).login == params[:player_name] || Player.find(k.whiteid).login == params[:player_name]) then
        date3 = Date.strptime(k.updated_at.strftime("%Y-%m-%d"))
        if (date3 >= date1 && date3 <= date2) then
          @kifus.push(k)
        end
      end
      break if @kifus.size > 100
    }
    respond_to do |format|
      format.xml
    end
  end
end
