require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { address_1: @contact.address_1, address_2: @contact.address_2, age: @contact.age, birthdate: @contact.birthdate, city: @contact.city, confirmed_number: @contact.confirmed_number, email: @contact.email, name: @contact.name, notes: @contact.notes, opt_in_a: @contact.opt_in_a, opt_in_b: @contact.opt_in_b, opt_in_c: @contact.opt_in_c, phone: @contact.phone, state: @contact.state } }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { address_1: @contact.address_1, address_2: @contact.address_2, age: @contact.age, birthdate: @contact.birthdate, city: @contact.city, confirmed_number: @contact.confirmed_number, email: @contact.email, name: @contact.name, notes: @contact.notes, opt_in_a: @contact.opt_in_a, opt_in_b: @contact.opt_in_b, opt_in_c: @contact.opt_in_c, phone: @contact.phone, state: @contact.state } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
