class MyMailer < ActionMailer::Base
  include Resque::Mailer
  default from: "team_ninjas@assist.ro"
  def send_enabled_message(user)
    @user = user
    mail(:to => user.email, :subject => "Welcome to Assist Workshop!")
  end
  def new_registration(user)
    @user = user
    mail(:to => @user.email, :subject => "Bun venit!", :body => "Buna, #{@user.first_name}! \n \nSuntem bucurosi ca te-ai alaturat echipei noastre. Te poti loga cu emailul: #{@user.email} si parola pe care ti-ai aleso.\n \nTe saluta echipa @Ninja_team!")
  end
  def new_order(order)
    @order = order
    @code = "#{@order.id}-#{@order.menu_id}"
    mail(:to => @order.user.email, :subject => "Comanda creata", :body => "Buna, #{@order.user.first_name}! \n \nComanda ta a fost receptionata si i s-a atribuit codul de comanda #{@code}. Cu acest cod vei putea verifica starea comenzi.\n \nTe saluta echipa @Ninja_team!")
  end
end