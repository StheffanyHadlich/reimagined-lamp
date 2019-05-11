require 'test_helper'


class PhoneTest < ActiveSupport::TestCase

  test "create a phone number" do
    assert_difference 'Phone.all.count', 1 do
      Phone.create number: '12345678', contact: Contact.first
    end
  end

  test "don't create phone without number" do
    assert_difference 'Phone.all.count', 0 do
      Phone.create default_phone: true, contact: Contact.first
    end
  end

  test "don't create a duplicate phone number for the same contact" do
    assert_difference 'Phone.all.count', 1 do
      Phone.create number: '12345678', contact: Contact.first
      Phone.create number: '12345678', contact: Contact.first
    end
  end

  test "only one phone can be the default phone" do
    Phone.create number: '12345678', default_phone: true, contact: Contact.first
    Phone.create number: '87654321', default_phone: true, contact: Contact.first
    assert_equal Phone.where(default_phone: true).count, 1
  end

end
