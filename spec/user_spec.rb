require('spec_helper')

describe('User') do

  it{'should validate_presence_of (:first_name)'}

  it{'should validate_presence_of (:last_name)'}

  it{'should validate_presence_of (:description)'}

  it{'should validate_presence_of (:email)'}

  it{'should validate_presence_of (:programmer_rating)'}

  it{'should validate_length_of (:description)'}

  it("titleizes all words in the name fields") do
    user = User.create(first_name: 'jim', last_name: 'smith')
    expect(user.first_name()).to(eq('Jim'))
    expect(user.last_name()).to(eq('Smith'))

  end

  # it("says a prog_match is good if both programmer ratings are equal") do
  #   user1 = User.create(first_name: 'jim', last_name: 'smith', programmer_rating: 3)
  #   user2 = User.create(first_name: 'john', last_name: 'thomas', programmer_rating: 3)
  #   expect(user1.prog_match(user2)).to(eq("great"))
  # end
  #
  # it("says a prog_match is good if programmer ratings are one point apart") do
  #   user1 = User.create(first_name: 'jim', last_name: 'smith', programmer_rating: 3)
  #   user2 = User.create(first_name: 'john', last_name: 'thomas', programmer_rating: 4)
  #   expect(user1.prog_match(user2)).to(eq("good"))
  # end
  #
  # it("says a prog_match is okay if programmer ratings are two points apart") do
  #   user1 = User.create(first_name: 'jim', last_name: 'smith', programmer_rating: 3)
  #   user2 = User.create(first_name: 'john', last_name: 'thomas', programmer_rating: 5)
  #   expect(user1.prog_match(user2)).to(eq("okay"))
  # end

  # it("says a project_match is okay if project ratings are equal") do
  #   user1 = User.create(first_name: 'jim', last_name: 'smith', project_rating: 3)
  #   user2 = User.create(first_name:"billy", last_name: "bob", project_rating: 3)
  #   expect(user1.project_match(user2)).to(eq("great"))
  # end

    it("says a match is a great match if a user's preferred programming level match equals another user's programming level") do
      user1 = User.create(first_name: 'jim', last_name: 'smith', programmer_rating: 3, project_rating: 3, pace_rating: 5, lb_rating: 4, preferred_matches: "4")
      user2 = User.create(first_name: 'john', last_name: 'thomas', programmer_rating: 4, project_rating: 3, pace_rating: 5, lb_rating: 4, preferred_matches: "3")
      expect(user1.preferred_match(user2)).to(eq(5))
    end


    it("says a match is a great match if it receives a score of 20 or higher") do
      user1 = User.create(first_name: 'jim', last_name: 'smith', programmer_rating: 3, project_rating: 3, pace_rating: 5, lb_rating: 4, preferred_matches: "4")
      user2 = User.create(first_name: 'john', last_name: 'thomas', programmer_rating: 4, project_rating: 3, pace_rating: 5, lb_rating: 4, preferred_matches: "4")
      expect(user1.match(user2)).to(eq("great match"))
    end

    it("says a match is not a good match if it receives a score of 14 or lower") do
      user1 = User.create(first_name: 'jim', last_name: 'smith', programmer_rating: 1, project_rating: 1, pace_rating: 1, lb_rating: 1, preferred_matches: "4")
      user2 = User.create(first_name: 'john', last_name: 'thomas', programmer_rating: 5, project_rating: 5, pace_rating: 5, lb_rating: 5, preferred_matches: "4")
      expect(user1.match(user2)).to(eq("not a good match"))
  end
end
