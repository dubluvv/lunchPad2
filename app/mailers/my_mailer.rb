class MyMailer < ActionMailer::Base
  include Resque::Mailer
  default from: "team_ninjas@assist.ro"
  def send_enabled_message(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to Assist Workshop!")
  end
  def new_registration(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to lunch!", :body => "Hi #{@user.first_name}. We're happy to have you. Your credentials are: \n Email: #{@user.email} \n Password: #{@user.password} \n \n Best regards from @Ninja_team")
  end
  def new_order(order)
    @order = order
    @code = "#{@order.id}-#{@order.menu_id}"
    mail(:to => @order.user.email, :subject => "Comanda creata", :body => "Your order has been created. Your order's code is #{@code}")
  end
end