# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Classification.destroy_all
Craft.destroy_all
Resource.destroy_all
User.destroy_all

crafts = [
	{:name => "Ruby on Rails", :short_description => "Ruby on Rails is a framework for building web applications", :long_description => "Ruby on Rails is a framework for building web applications.", :image_url => "http://bari.the-hub.net/files/2013/02/railslogo.png", :path => "ruby-on-rails"},
	{:name => "HTML5", :short_description => "HTML5 is the new standard for structuring websites.", :long_description => "HTML5 is the new standard for structuring websites.", :image_url => "http://www.blog-nouvelles-technologies.fr/wp-content/uploads/2011/03/les-10-meilleures-ressources-pour-apprendre-html5.jpg", :path => "html5"},
	{:name => "Caligraphy", :short_description => "Caligraphy is beautiful writing.", :long_description => "Caligraphy is beautiful writing.", :image_url => "http://designworklife.com/wp-content/uploads/2011/02/kateforrester_caligraphy_01.jpg", :path => "caligraphy"},
	{:name => "jQuery UI", :short_description => "jQuery UI offers a number of cool jQuery-based UI elements.", :long_description => "jQuery UI offers a number of cool jQuery-based UI elements.", :image_url => "https://www.cs.washington.edu/education/courses/190m/12su/lectures/slides/images/jquery_ui_logo_small.gif", :path => 'jquery-ui'}
	]

crafts.each do |craft|
	c = Craft.new
	c.name = craft[:name]
	c.short_description = craft[:short_description]
	c.long_description = craft[:long_description]
	c.image_url = craft[:image_url]
	c.path = craft[:path]
	c.classification_id = 1
	c.save
end

resources = [
	{
		:name => "Learn to Program",
		:author => "Chris Pine",
		:description => "A great resource for beginners.",
		:image_url => "http://s3.amazonaws.com/37assets/svn/thumb-ltp2-3aed571a6623399c0f896e34cc871166.jpg",
		:upvotes => "0",
		:link => "http://www.amazon.com/Program-Second-Edition-Facets-Series/dp/1934356360/ref=sr_1_1?ie=UTF8&qid=1366681854&sr=8-1&keywords=learn+to+program",
		:path => "learn-to-program",
		:craft => 1
	},
	{
		:name => "Eloquent JavaScript",
		:author => "Marijn Haverbeke",
		:description => "A tremendous intro to JavaScript",
		:image_url => "http://img152.imageshack.us/img152/70/capturesu0.jpg",
		:upvotes => "0",
		:link => "http://www.amazon.com/Eloquent-JavaScript-Modern-Introduction-Programming/dp/1593272820/ref=sr_1_1?s=books&ie=UTF8&qid=1366681896&sr=1-1&keywords=eloquent+javascript",
		:path => "eloquent-javascript",
		:craft => 1
	},
	{
		:name => "The Starter League",
		:author => "The Starter League",
		:description => "An awesome program for starters looking to gain skills in web design, development, and user experience.",
		:image_url => "http://sphotos-a.xx.fbcdn.net/hphotos-snc6/c131.0.403.403/p403x403/284031_420540041346672_273979806_n.jpg",
		:upvotes => 0,
		:link => "http://starterleague.com",
		:path => "starter-league",
		:craft => 1
	},
	{
		:name => "Team Treehouse",
		:author => "Team Treehouse",
		:description => "Beginner video tutorials in web design and development, user experience, business, and mobile app development.",
		:image_url => "http://www.beginningiosdev.com/wp-content/uploads/2012/05/screen-shot-2011-10-17-at-2-56-25-am.png",
		:upvotes => 2,
		:link => "http://www.teamtreehouse.com",
		:path => "team-treehouse",
		:craft => 1
	}
]

resources.each do |resource|
	r = Resource.new
	r.name = resource[:name]
	r.author = resource[:author]
	r.description = resource[:description]
	r.image_url = resource[:image_url]
	r.upvotes = resource[:upvotes]
	r.link = resource[:link]
	r.path = resource[:path]
	r.craft_id = resource[:craft]
	r.save
end

users = [
	{
		:username => "tbloncar",
		:password => "password",
		:email => "loncar.travis@gmail.com",
		:bio => "I enjoy learning and stuff like that.",
		:first_name => "Travis",
		:last_name => "Loncar"
	},
	{
		:username => "jeffcohen",
		:password => "password",
		:email => "jeff@starterleague.com",
		:bio => "I enjoy learning and stuff like that.",
		:first_name => "Jeff",
		:last_name => "Cohen"
	},
	{
		:username => "raghubetina",
		:password => "password",
		:email => "raghu@starterleague.com",
		:bio => "I enjoy learning and stuff like that.",
		:first_name => "Raghu",
		:last_name => "Betina"
	},
	{
		:username => "shayhowe",
		:password => "password",
		:email => "shay@starterleague.com",
		:bio => "I enjoy learning and stuff like that.",
		:first_name => "Shay",
		:last_name => "Howe"
	}
]

users.each do |user|
	u = User.new
	u.username = user[:username]
	u.password = user[:password]
	u.email = user[:email]
	u.bio = user[:bio]
	u.first_name = user[:first_name]
	u.last_name = user[:last_name]
	u.save
end


classifications = [
	{
		:name => "Programming",
		:short_description => "Computer Programming is the practice of instructing computers how to behave.",
		:long_description => "Computer Programming is the practice of instructing computers how to behave.",
		:image_url => "http://www.whitefang.com/wp-content/uploads/2010/03/Computer-Programming1.jpg",
		:path => "computer-programming"
	}
]

classifications.each do |classification|
	c = Classification.new
	c.name = classification[:name]
	c.short_description = classification[:short_description]
	c.long_description = classification[:long_description]
	c.image_url = classification[:image_url]
	c.path = classification[:path]
	c.save
end















