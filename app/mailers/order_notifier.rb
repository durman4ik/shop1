class OrderNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Parfumers.by - Ваш заказ принят!'
  end

  def new_order(order)
    @order = order
    @full_name = @order.first_name + ' ' + @order.last_name

    mail to: 'yur4ik93@mail.ru', subject: 'Новый заказ'
  end
end
