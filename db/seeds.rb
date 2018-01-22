# 30.times do |num|
# 	topic = Topic.new
# 	topic.title = 'Number ' + num.to_s
# 	topic.text_field = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis convallis sem. Maecenas quis augue consequat, dictum tortor non, tempus diam. Aliquam vestibulum nibh ut mi ultrices, quis gravida felis placerat. Vivamus iaculis non eros eu lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean at lacinia nulla. Curabitur tincidunt sem sed sem commodo pulvinar. Phasellus dapibus nisl bibendum ultrices semper. Curabitur sed malesuada sapien, id ornare justo. Quisque in imperdiet magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur orci quam, ultrices a odio ut, ornare rhoncus orci. Nam consequat viverra suscipit.'
# 	topic.user_id = 1
# 	topic.save!
# 	num+=1
# end
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)

# forum = Forum.new
# forum.name = 'General'
# forum.description = 'general discussion'
# forum.save!

guest_topic = GuestTopic.new
guest_topic.title = 'Try it out!'
guest_topic.user_id = 1
guest_topic.text_field = 'UCF needs better tools to find and sign up for classes, including a new web app and a mobile app. I think we should allocate resources to a professional redesign of course registration. Vote below or click "forum" to voice your opinion about this idea.'
guest_topic.save!



# topic1 = Topic.new
# topic1.title = 'Free Lunch'
# topic1.text_field = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis convallis sem. Maecenas quis augue consequat, dictum tortor non, tempus diam. Aliquam vestibulum nibh ut mi ultrices, quis gravida felis placerat. Vivamus iaculis non eros eu lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean at lacinia nulla. Curabitur tincidunt sem sed sem commodo pulvinar. Phasellus dapibus nisl bibendum ultrices semper. Curabitur sed malesuada sapien, id ornare justo. Quisque in imperdiet magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur orci quam, ultrices a odio ut, ornare rhoncus orci. Nam consequat viverra suscipit.'
# topic1.user_id = 1
# topic1.save!

# # forum_topic = ForumTopic.new
# # forum_topic.name = 'Sample'
# # forum_topic.forum_id = 1
# # forum_topic.user_id = 1
# # forum_topic.save!

# user = User.new
# user.email = 'test@example.com'
# user.password = 'password'
# user.password_confirmation = 'password'
# user.first_name = 'John'
# user.last_name = 'Doe'
# user.save!

# 30.times do
# post = Post.new
# post.forum_topic_id = 1
# post.forum_id = 1
# post.text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quis convallis sem. Maecenas quis augue consequat, dictum tortor non, tempus diam. Aliquam vestibulum nibh ut mi ultrices, quis gravida felis placerat. Vivamus iaculis non eros eu lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean at lacinia nulla. Curabitur tincidunt sem sed sem commodo pulvinar. Phasellus dapibus nisl bibendum ultrices semper. Curabitur sed malesuada sapien, id ornare justo. Quisque in imperdiet magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur orci quam, ultrices a odio ut, ornare rhoncus orci. Nam consequat viverra suscipit.'
# post.user_id = 1
# post.save!
# end