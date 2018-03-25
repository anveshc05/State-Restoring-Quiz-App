class CricketsController < ApplicationController
  before_action :set_cricket, only: [:show, :edit, :update, :destroy]

  # GET /crickets
  # GET /crickets.json
  def index
    @lbord = Leaderboard.find_by_user_id(current_user.id)
    @leadbord = Leaderboard.find_by_user_id(current_user.id)
    @crikets = Leaderboard.order('maxcricscore DESC')
    if @leadbord.cricketques == Cricket.count
      @leadbord.cricketscore = 0
      @leadbord.cricketques = 0
      @leadbord.save
    end
  end

  # GET /crickets/1
  # GET /crickets/1.json
  def show
    @lbord = Leaderboard.find_by_user_id(current_user.id)
    @goto = '/crickets/' + (Integer(params[:id])+1).to_s
    @lbord.checkc = true
    if (Integer(params[:id])==1)
      @lbord.cricketscore = 0
    end
    if (Integer(params[:id])!=1 && ((Integer(params[:id])!=@lbord.cricketques+1) && (Integer(params[:id])!=@lbord.cricketques)))
      @got = '/crickets/' + (@lbord.cricketques).to_s
      print(@got)
      redirect_to @got
    else
      @lbord.cricketques=Integer(params[:id])
      @lbord.save
      @str = ''
      if @cricket
        if @cricket.multicheck
          if(params[:A])
            @str += 'A'
          end
          if(params[:B])
            @str += 'B'
          end 
          if(params[:C])
            @str += 'C'
          end
          if(params[:D])
            @str += 'D'
          end
        else
          if(params[:m])
            @str = params[:m]
          end
        end
        print("hi")
        print(@str)
        print("hello")
        print(@cricket.correctans)
        if @str == @cricket.correctans
          @lbord.cricketscore += 20
          if @lbord.cricketscore > @lbord.maxcricscore
            @lbord.maxcricscore = @lbord.cricketscore
          end
          @lbord.save
        end
        if params[:A] || params[:B] || params[:C] || params[:D] || params[:m]
          if Integer(params[:id]) == Cricket.count
            redirect_to '/crickets/'
          else
             redirect_to @goto
          end
        end
      else
        @lbord.cricketscore = 0
        @lbord.cricketques = 0
        @lbord.save
        redirect_to root_path
      end
    end
  end   
  # GET /crickets/new
  def new
    @cricket = Cricket.new
  end

  # GET /crickets/1/edit
  def edit
  end

  # POST /crickets
  # POST /crickets.json
  def create
    @cricket = Cricket.new(cricket_params)

    respond_to do |format|
      if @cricket.save
        format.html { redirect_to @cricket, notice: 'Cricket was successfully created.' }
        format.json { render :show, status: :created, location: @cricket }
      else
        format.html { render :new }
        format.json { render json: @cricket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crickets/1
  # PATCH/PUT /crickets/1.json
  def update
    respond_to do |format|
      if @cricket.update(cricket_params)
        format.html { redirect_to @cricket, notice: 'Cricket was successfully updated.' }
        format.json { render :show, status: :ok, location: @cricket }
      else
        format.html { render :edit }
        format.json { render json: @cricket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crickets/1
  # DELETE /crickets/1.json
  def destroy
    @cricket.destroy
    respond_to do |format|
      format.html { redirect_to crickets_url, notice: 'Cricket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cricket
      if(Integer(params[:id]) <= Cricket.count)
        @cricket = Cricket.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cricket_params
      params.require(:cricket).permit(:question, :opta, :optb, :optc, :optd, :correctans)
    end
end
