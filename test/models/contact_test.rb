require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test "create a contact" do
    assert_difference 'Contact.all.count', 1 do
      Contact.create name: 'Foo', user: User.first
    end
  end

  test "don't create a user without a name" do
    assert_difference 'Contact.all.count', 0 do
      Contact.create born_date: '01/01/2001', user: User.first
    end
  end

  test "don't create contact with duplicate name" do
    assert_difference 'Contact.all.count', 1 do
      Contact.create name: 'Boo', user: User.first
      Contact.create name: 'Boo', user: User.first
    end
  end

end
