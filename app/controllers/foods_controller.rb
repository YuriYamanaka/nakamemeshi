class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]  
  def index
        if params[:search] == nil
          @foods= Food.all
        elsif params[:search] == ''
          @foods=Food.all
        else
          #部分検索
          @foods = Food.where("name LIKE ? ",'%' + params[:search] + '%')
        end

        @foods = @foods.page(params[:page]).per(3)
    end

    def new
        @foods = Food.new
      end
    
      def create
        food = Food.new(food_params)
        food.user_id = current_user.id
        if food.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @food = Food.find(params[:id])
        @comments = @food.comments
        @comment = Comment.new
      end

      def edit
        @food = Food.find(params[:id])
      end

      def update
        food = Food.find(params[:id])
        if food.update(food_params)
          redirect_to :action => "show", :id => food.id
        else
          redirect_to :action => "new"
        end
      end  

      def destroy
        food = Food.find(params[:id])
        food.destroy
        redirect_to action: :index
      end

      private
      def food_params
        params.require(:food).permit(:name, :genre, :address, :cost, :about, :date, :overall, :image,:lat,:lng)
      end
end
