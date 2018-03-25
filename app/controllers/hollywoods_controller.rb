class HollywoodsController < ApplicationController
  before_action :set_hollywood, only: [:show, :edit, :update, :destroy]

  # GET /hollywoods
  # GET /hollywoods.json
  def index
    @lbord = Leaderboard.find_by_user_id(current_user.id)
    @leadbord = Leaderboard.find_by_user_id(current_user.id)
    @holywoods = Leaderboard.order('maxhollyscore DESC')
    if @leadbord.hollywoodques == Hollywood.count
      @leadbord.hollywoodscore = 0
      @leadbord.hollywoodques = 0
      @leadbord.save
    end
  end

  # GET /hollywoods/1
  # GET /hollywoods/1.json
  def show
    @lbord = Leaderboard.find_by_user_id(current_user.id)
    @goto = '/hollywoods/' + (Integer(params[:id])+1).to_s
    @lbord.checkh = true
    if (Integer(params[:id])==1)
      @lbord.hollywoodscore = 0
    end
    if (Integer(params[:id])!=1 && ((Integer(params[:id])!=@lbord.hollywoodques+1) && (Integer(params[:id])!=@lbord.hollywoodques)))
      @got = '/hollywoods/' + (@lbord.hollywoodques).to_s
      print(@got)
      redirect_to @got
    else
      @lbord.hollywoodques=Integer(params[:id])
      @lbord.save
      @str = ''
      if @hollywood
        if @hollywood.multicheck
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
        print(@hollywood.correctans)
        if @str == @hollywood.correctans
          @lbord.hollywoodscore += 20
          if @lbord.hollywoodscore > @lbord.maxhollyscore
            @lbord.maxhollyscore = @lbord.hollywoodscore
          end
          @lbord.save
        end
        if params[:A] || params[:B] || params[:C] || params[:D] || params[:m]
          if Integer(params[:id]) == Hollywood.count
            redirect_to '/hollywoods/'
          else
             redirect_to @goto
          end
        end
      else
        @lbord.hollywoodscore = 0
        @lbord.hollywoodques = 0
        @lbord.save
        redirect_to root_path
      end
    end
  end   

  # GET /hollywoods/new
  def new
    @hollywood = Hollywood.new
  end

  # GET /hollywoods/1/edit
  def edit
  end

  # POST /hollywoods
  # POST /hollywoods.json
  def create
    @hollywood = Hollywood.new(hollywood_params)

    respond_to do |format|
      if @hollywood.save
        format.html { redirect_to @hollywood, notice: 'Hollywood was successfully created.' }
        format.json { render :show, status: :created, location: @hollywood }
      else
        format.html { render :new }
        format.json { render json: @hollywood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hollywoods/1
  # PATCH/PUT /hollywoods/1.json
  def update
    respond_to do |format|
      if @hollywood.update(hollywood_params)
        format.html { redirect_to @hollywood, notice: 'Hollywood was successfully updated.' }
        format.json { render :show, status: :ok, location: @hollywood }
      else
        format.html { render :edit }
        format.json { render json: @hollywood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hollywoods/1
  # DELETE /hollywoods/1.json
  def destroy
    @hollywood.destroy
    respond_to do |format|
      format.html { redirect_to hollywoods_url, notice: 'Hollywood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hollywood
      if(Integer(params[:id]) <= Hollywood.count)
        @hollywood = Hollywood.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hollywood_params
      params.require(:hollywood).permit(:question, :opta, :optb, :optc, :optd, :correctans)
    end
end
