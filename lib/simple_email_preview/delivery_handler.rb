module SimpleEmailPreview
  class DeliveryHandler
    def initialize(mail, headers)
      @mail = mail
      @mail.headers(headers)
      @mail.delivery_handler = self
    end

    attr_accessor :mail

    def deliver_mail(_mail)
      yield
    end
  end
end
