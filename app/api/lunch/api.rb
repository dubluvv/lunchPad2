module Lunch
	class API < Grape::API
    version 'v1' #, using: :header, vendor: 'lunch'
    format :json
    prefix :api

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end
    end

    resource :menus do
      desc 'Return a list of menus.'
      get do
        Menu.all
      end
    end  

    resource :users do
      desc 'Return a list of users.'
      get do
        User.all
      end
    end  

    resource :orders do
      desc 'Return a list of orders.'
      get do
        Order.all
      end

      desc ' post'
      post do
        @order = Order.create!({
          user_id: params[:user_id],
          menu_id: params[:menu_id],
          status: "in asteptare"
          })
        MyMailer.delay.new_order(@order)
        return @order
      end
    end

    resource :signup do
      desc ' Creaza utilizator'
      post do
        User.create!({
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          phone: params[:phone],
          address: params[:address],
          password: params[:password]
          })
      end
    end

    resource :login do
      desc ' Verifica login'
      post do
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
          return @user
        else
          error!('Autentificare esuata', 401)
        end
      end
    end  
	end
end