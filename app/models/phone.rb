class Phone < ApplicationRecord
  belongs_to :contact

  before_save do
    if self.default_phone
      contact.phones.each do |phone|
        phone.update! default_phone: false
      end
    end
  end
end
