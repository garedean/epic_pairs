require('spec_helper')

describe('User') do

  it{'should validate_presence_of (:first_name)'}

  it{'should validate_presence_of (:last_name)'}

  it{'should validate_presence_of (:description)'}

  it{'should validate_presence_of (:email)'}

  it{'should validate_presence_of (:programmer_rating)'}

  it{'should validate_length_of (:description)'}

  it("titleizes all words in the name fields") do
    user = User.create(first_name: jim last_name: smith)
    expect(user.name()).to(eq('Jim Smith'))
  end
end
