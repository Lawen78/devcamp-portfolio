10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Fake Body Data"
  )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end
puts "5 skills created"

9.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio}",
    subtitle: "My great service",
    body:"Lorem Ipsum dolor sit amet...",
    main_image: "http://via.placeholder.com/600x150",
    thumb_image: "http://via.placeholder.com/350x200"
  )
end
puts "9 portfolio items created"