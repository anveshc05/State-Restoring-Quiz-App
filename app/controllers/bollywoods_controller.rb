class BollywoodsController < ApplicationController
  before_action :set_bollywood, only: [:show, :edit, :update, :destroy]

  # GET /bollywoods
  # GET /bollywoods.json
  def index
    @lbord = Leaderboard.find_by_user_id(current_user.id)
    @leadbord = Leaderboard.find_by_user_id(current_user.id)
    @bolywoods = Leaderboard.order('maxbollyscore DESC')
    if @leadbord.bollywoodques == Bollywood.count
      @leadbord.bollywoodscore = 0
      @leadbord.bollywoodques = 0
      @leadbord.save
    end
  end

  # GET /bollywoods/1
  # GET /bollywoods/1.json
  def show
    @lbord = Leaderboard.find_by_user_id(current_user.id)
    @goto = '/bollywoods/' + (Integer(params[:id])+1).to_s
    @lbord.checkb = true
    if (Integer(params[:id])==1)
      @lbord.bollywoodscore = 0
    end
    if (Integer(params[:id])!=1 && ((Integer(params[:id])!=@lbord.bollywoodques+1) && (Integer(params[:id])!=@lbord.bollywoodques)))
      @got = '/bollywoods/' + (@lbord.bollywoodques).to_s
      print(@got)
      redirect_to @got
    else
      @lbord.bollywoodques=Integer(params[:id])
      @lbord.save
      @str = ''
      if @bollywood
        if @bollywood.multicheck
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
        print(@bollywood.correctans)
        if @str == @bollywood.correctans
          @lbord.bollywoodscore += 20
          if @lbord.bollywoodscore > @lbord.maxbollyscore
            @lbord.maxbollyscore = @lbord.bollywoodscore
          end
          @lbord.save
        end
        if params[:A] || params[:B] || params[:C] || params[:D] || params[:m]
          if Integer(params[:id]) == Bollywood.count
            redirect_to '/bollywoods/'
          else
             redirect_to @goto
          end
        end
      else
        @lbord.bollywoodscore = 0
        @lbord.bollywoodques = 0
        @lbord.save
        redirect_to root_path
      end
    end
  end   

  # GET /bollywoods/new
  def new
    @bollywood = Bollywood.new
  end

  # GET /bollywoods/1/edit
  def edit
  end

  # POST /bollywoods
  # POST /bollywoods.json
  def create
    @bollywood = Bollywood.new(bollywood_params)

    respond_to do |format|
      if @bollywood.save
        format.html { redirect_to @bollywood, notice: 'Bollywood was successfully created.' }
        format.json { render :show, status: :created, location: @bollywood }
      else
        format.html { render :new }
        format.json { render json: @bollywood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bollywoods/1
  # PATCH/PUT /bollywoods/1.json
  def update
    respond_to do |format|
      if @bollywood.update(bollywood_params)
        format.html { redirect_to @bollywood, notice: 'Bollywood was successfully updated.' }
        format.json { render :show, status: :ok, location: @bollywood }
      else
        format.html { render :edit }
        format.json { render json: @bollywood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bollywoods/1
  # DELETE /bollywoods/1.json
  def destroy
    @bollywood.destroy
    respond_to do |format|
      format.html { redirect_to bollywoods_url, notice: 'Bollywood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bollywood
      if(Integer(params[:id]) <= Bollywood.count)
        @bollywood = Bollywood.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bollywood_params
      params.require(:bollywood).permit(:question, :opta, :optb, :optc, :optd, :correctans)
    end
end
