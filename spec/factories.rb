FactoryGirl.define do
	factory :user do
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password "Likegene2013"
		password_confirmation "Likegene2013"
		gender "male"

		factory :girl do
			gender "female"
		end

		factory :user_with_groups do
			ignore do
				groups_count 3
			end

			after(:create) do |user, evaluator|
				FactoryGirl.create_list(:group, evaluator.groups_count, creator: user)
			end
		end
	end

	factory :album do
		name "Album"
		association :group, strategy: :build
		association :creator, factory: :user
	end

	factory :availability do
	end

	factory :comment do
	end

	factory :group do
		name "Frecipe"
		capacity 10
		association :creator, factory: :user
	end

	factory :group_subscription do
		association :user
		association :group
	end

	factory :invite do
	end

	factory :notification do
	end

	factory :picture do
		text "Picture"
		association :user
		association :imageable, factory: :user
		
		picture_file_name "File name"
		picture_content_type "image/png"
		picture_file_size 1024
		picture_updated_at Time.new
	end

	factory :post do
		text "Post"
		association :user
		association :group
	end
end