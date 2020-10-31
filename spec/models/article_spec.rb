require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validation tests' do
  	before{@article = Article.new(title:"article title",description:"article description")}
  	it "ensure title should present" do
	  	@article.title = " "
	  	expect(@article).to_not be_valid
  	end

  	it "ensure description should present" do
	  	@article.description = " "
	  	expect(@article).to_not be_valid
  	end

  	it "has many articles_groups" do
    	should respond_to(:article_groups)
  	end

  	it "belongs to user" do
	  t = Article.reflect_on_association(:user)
	  expect(t.macro).to eq(:belongs_to)
	end

	# it "has many groups through article_groups" do
    # should respond_to(:groups).through(:article_groups)
	 # should_have_many :groups, :through => :article_groups
	 #end
	 #  	describe Article, 'association' do
	#    it { should have_many(:groups).through(:article_groups) }
	# end

  end
end
