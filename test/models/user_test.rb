require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "create a simple user" do
    assert_difference 'User.all.count', 1 do
      User.create name: 'Foo'
    end
  end

  test "don't create a user without a name" do
    assert_difference 'User.all.count', 0 do
      User.create bio: 'Bar'
    end
  end

  test "don't create user with duplicate name" do
    assert_difference 'User.all.count', 1 do
      User.create name: 'Boo'
      User.create name: 'Boo'
    end
  end

  test "don't create user unless born" do
    assert_difference 'User.all.count', 0 do
      User.create name: 'Foo', age: -1
    end
  end

end
