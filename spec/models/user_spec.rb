require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
  	before{@user = User.new(username:"first",first_name:"first",last_name:"last", email:"email@gmail.com",gender:"Male",phone_no: "9384928291",zip_code:"23432",description:"description is this",password:"password@1234" )}
    it 'ensures username presence ' do
      @user.username = " "
      expect(@user).to_not be_valid
    end
    it 'ensures first_name presence ' do
      @user.first_name =" "
      expect(@user).to_not be_valid
    end

    it 'ensures last_name presence ' do
      @user.last_name =" "
      expect(@user).to_not be_valid
    end

    it 'ensures phone_number presence ' do
      @user.phone_no =" "
      expect(@user).to_not be_valid
    end

    it 'ensures gender presence ' do
      @user.gender =" "
      expect(@user).to_not be_valid
    end

    it 'ensures description presence ' do
      @user.description =" "
      expect(@user).to_not be_valid
    end

    it 'ensures password presence ' do
      @user.password =" "
      expect(@user).to_not be_valid
    end

    it 'should save user ' do
      
      @user.save
      expect(@user).to be_valid
    end

    it "has many articles" do
    	should respond_to(:articles)
  	end

  	it "email should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
	      @user.email = valid_address
	      expect(@user).to be_valid
	   end
    end
  	# describe 'Attachment' do
	  #   it 'is valid  ' do
	  #     subject.avatar.attach(io: File.open(fixture_path + '/dummy_image.jpg'), filename: 'attachment.jpg', content_type: 'image/jpg')
	  #     expect(subject.avatar).to be_attached
	  #   end
  	# end

  	# # describe "has attachment" do
  	# # 	it { should have_attached_file(:avatar) }
  	# # end

    # it 'ensures last_name presence ' do
    #   user = User.new(first_name:"first",email:"email@gmail.com"  )
    #   expect(user).to_not be_valid
    # end

    # it 'ensures email presence ' do
    #   user = User.new(first_name:"Name1",last_name:"last")
    #   expect(user).to_not be_valid
    # end

    # it 'should save successfully' do
    #   user = User.new(first_name:"first",last_name:"last", email:"email@gmail.com")
    #   expect(user).to be_valid
    # end
  end
end
