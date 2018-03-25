class FootballsController < ApplicationController
  before_action :set_football, only: [:show, :edit, :update, :destroy]

  # GET /footballs
  # GET /footballs.json
  def index
    @lbord = Leaderboard.find_by_user_id(current_user.id)
    @leadbord = Leaderboard.find_by_user_id(current_user.id)
    @fooballs = Leaderboard.order('maxfootscore DESC')
    if @leadbord.footballques == Football.count
      @leadbord.footballscore = 0
      @leadbord.footballques = 0
      @leadbord.save
    end
  end

  def show
    @lbord = Leaderboard.find_by_user_id(current_user.id)
    @goto = '/footballs/' + (Integer(params[:id])+1).to_s
    @lbord.checkf = true
    if (Integer(params[:id])==1)
      @lbord.footballscore = 0
    end
    if (Integer(params[:id])!=1 && ((Integer(params[:id])!=@lbord.footballques+1) && (Integer(params[:id])!=@lbord.footballques)))
      @got = '/footballs/' + (@lbord.footballques).to_s
      print(@got)
      redirect_to @got
    else
      @lbord.footballques=Integer(params[:id])
      @lbord.save
      @str = ''
      if @football
        if @football.multicheck
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
        print(@football.correctans)
        if @str == @football.correctans
          @lbord.footballscore += 20
          if @lbord.footballscore > @lbord.maxfootscore
            @lbord.maxfootscore = @lbord.footballscore
          end
          @lbord.save
        end
        if params[:A] || params[:B] || params[:C] || params[:D] || params[:m]
          if Integer(params[:id]) == Football.count
            redirect_to '/footballs/'
          else
             redirect_to @goto
          end
        end
      else
        @lbord.footballscore = 0
        @lbord.footballques = 0
        @lbord.save
        redirect_to root_path
      end
    end
  end   

  # GET /footballs/new
  def new
    @football = Football.new
  end

  # GET /footballs/1/edit
  def edit
  end

  # POST /footballs
  # POST /footballs.json
  def create
    @football = Football.new(football_params)

    respond_to do |format|
      if @football.save
        format.html { redirect_to @football, notice: 'Football was successfully created.' }
        format.json { render :show, status: :created, location: @football }
      else
        format.html { render :new }
        format.json { render json: @football.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /footballs/1
  # PATCH/PUT /footballs/1.json
  def update
    respond_to do |format|
      if @football.update(football_params)
        format.html { redirect_to @football, notice: 'Football was successfully updated.' }
        format.json { render :show, status: :ok, location: @football }
      else
        format.html { render :edit }
        format.json { render json: @football.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /footballs/1
  # DELETE /footballs/1.json
  def destroy
    @football.destroy
    respond_to do |format|
      format.html { redirect_to footballs_url, notice: 'Football was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_football
      if(Integer(params[:id]) <= Football.count)
        @football = Football.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def football_params
      params.require(:football).permit(:question, :opta, :optb, :optc, :optd, :correctans)
    end
end
