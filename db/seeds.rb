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

classifications = [
	{
		:name => "Computer Programming",
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

crafts = [
	{:name => "Ruby on Rails", :short_description => "Ruby on Rails is a framework for building web applications", :long_description => "Ruby on Rails is a framework for building web applications.", :image_url => "http://bari.the-hub.net/files/2013/02/railslogo.png", :path => "ruby-on-rails", :full_path => "/computer-programming/ruby-on-rails"},
	{:name => "HTML5", :short_description => "HTML5 is the new standard for structuring websites.", :long_description => "HTML5 is the new standard for structuring websites.", :image_url => "http://www.blog-nouvelles-technologies.fr/wp-content/uploads/2011/03/les-10-meilleures-ressources-pour-apprendre-html5.jpg", :path => "html5", :full_path => "/computer-programming/html5"},
	{:name => "JavaScript", :short_description => "JavaScript is used to enhance the behavioral components of web applications.", :long_description => "JavaScript is used to enhance the behavioral components of web applications.", :image_url => "http://austinjavascript.com/wp-content/uploads/2012/11/thanksgiving.js-400x400.png", :path => "javascript", :full_path => "/computer-programming/javascript"},
	{:name => "jQuery UI", :short_description => "jQuery UI offers a number of cool jQuery-based UI elements.", :long_description => "jQuery UI offers a number of cool jQuery-based UI elements.", :image_url => "https://www.cs.washington.edu/education/courses/190m/12su/lectures/slides/images/jquery_ui_logo_small.gif", :path => 'jquery-ui', :full_path => "/computer-programming/jquery-ui"},
	{:name => "jQuery", :short_description => "jQuery is a convenience library written on top of JavaScript.", :long_description => "jQuery is a convenience library written on top of JavaScript.", :path => "jquery", :full_path => "/computer-programming/jquery", :image_url => "http://wpmu.org/wp-content/uploads/2010/04/jquery-logo1.png"},
	{:name => "PHP", :short_description => "PHP is a backend programming language with a purple logo.", :long_description => "PHP is a backend programming language with a purple logo.", :path => "php", :full_path => "/computer-programming/php", :image_url => "https://si0.twimg.com/profile_images/68979870/php.png"}
	]

crafts.each do |craft|
	c = Craft.new
	c.name = craft[:name]
	c.short_description = craft[:short_description]
	c.long_description = craft[:long_description]
	c.image_url = craft[:image_url]
	c.path = craft[:path]
	c.full_path = craft[:full_path]
	c.classification_id = Classification.first.id
	c.save
end


users = [
	{
		:username => "tbloncar",
		:password => "password",
		:email => "loncar.travis@gmail.com",
		:bio => "I enjoy learning and stuff like that."
	},
	{
		:username => "jeffcohen",
		:password => "password",
		:email => "jeff@starterleague.com",
		:bio => "I enjoy learning and stuff like that."
	},
	{
		:username => "raghubetina",
		:password => "password",
		:email => "raghu@starterleague.com",
		:bio => "I enjoy learning and stuff like that."
	},
	{
		:username => "shayhowe",
		:password => "password",
		:email => "shay@starterleague.com",
		:bio => "I enjoy learning and stuff like that."
	},
	{
		:username => "fangari",
		:password => "password",
		:email => "fangari@gmail.com",
		:bio => "I like Ruby and flooded bedrooms."
	},
	{
		:username => "kofiaidoo",
		:password => "password",
		:email => "asante.kofi@gmail.com",
		:bio => "I am interested in UX."
	}
]

users.each do |user|
	u = User.new
	u.username = user[:username]
	u.password = user[:password]
	u.password_confirmation = user[:password]
	u.email = user[:email]
	u.bio = user[:bio]
	u.save
end

resources = [
	{
		:name => "Learn to Program",
		:author => "Chris Pine",
		:description => "A great resource for beginners.",
		:link => "http://www.amazon.com/Program-Second-Edition-Facets-Series/dp/1934356360/ref=sr_1_1?ie=UTF8&qid=1366681854&sr=8-1&keywords=learn+to+program",
		:path => "learn-to-program",
		:full_path => "/computer-programming/ruby-on-rails/learn-to-program",
		:craft => Craft.first.id
	},
	{
		:name => "Eloquent JavaScript",
		:author => "Marijn Haverbeke",
		:description => "A tremendous intro to JavaScript",
		:link => "http://www.amazon.com/Eloquent-JavaScript-Modern-Introduction-Programming/dp/1593272820/ref=sr_1_1?s=books&ie=UTF8&qid=1366681896&sr=1-1&keywords=eloquent+javascript",
		:path => "eloquent-javascript",
		:full_path => "/computer-programming/javascript/eloquent-javascript",
		:craft => Craft.find_by_name("JavaScript").id
	},
	{
		:name => "Web Development",
		:author => "The Starter League",
		:description => "An awesome program for starters looking to gain skills in web design, development, and user experience.",
		:link => "http://starterleague.com",
		:path => "starter-league",
		:full_path => "/computer-programming/ruby-on-rails/starter-league",
		:craft => Craft.first.id
	},
	{
		:name => "Web Design Track",
		:author => "Team Treehouse",
		:description => "Beginner video tutorials in web design and development, user experience, business, and mobile app development.",
		:link => "http://www.teamtreehouse.com",
		:path => "team-treehouse",
		:full_path => "/computer-programming/html5/team-treehouse",
		:craft => Craft.find_by_name("HTML5").id
	},
	{
		:name => "PHP Manual",
		:author => "PHP.net",
		:description => "The PHP Manual provides great information about the backend programming language, PHP.",
		:link => "http://www.php.net",
		:path => "php-manual",
		:full_path => "/computer-programming/php/php-manual",
		:craft => Craft.find_by_name("PHP").id
	},
	{
		:name => "Intro to jQuery",
		:author => "Codecademy",
		:description => "Codecademy's introduction to jQuery is fun and beginner-friendly.",
		:link => "http://www.codecademy.com",
		:path => "intro-to-jquery",
		:full_path => "/computer-programming/jquery/intro-to-jquery",
		:craft => Craft.find_by_name("jQuery").id
	}
]

resources.each_with_index do |resource, i|
	r = Resource.new
	r.name = resource[:name]
	r.author = resource[:author]
	r.description = resource[:description]
	r.link = resource[:link]
	r.path = resource[:path]
	r.full_path = resource[:full_path]
	r.craft_id = resource[:craft]
	r.user_id = User.first.id + i
	r.upvotes_count = 1
	r.save

	u = Upvote.new
	u.user_id = r.user_id
	u.resource_id = r.id
	u.save
end















