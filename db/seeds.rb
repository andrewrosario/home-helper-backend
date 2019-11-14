array = ['paint', 'plubming', 'electrical', 'carpentry', 'flooring', 'landscaping']

array.map { |type| ProjectType.create(name: type) }

def image_fetcher(number)
    gender = ['men', 'women'].sample
    open("https://randomuser.me/portraits/#{gender}/#{number}.jpg")
end

lizzo = User.new(name: 'Lizzo', email: 'lizzo@lizzo.com', password: 'lizzo', password_confirmation: 'lizzo')
lizzo.image.attach({
    io: File.open(Rails.root + 'public/lizzo.jpg'),
    filename: "lizzo.jpg"
})
lizzo.save

Rating.create(novice_id: 1, expert_id: 1, rating: 5)

[1, 2, 3, 4, 5, 6].each do |i|
    expert_in = ExpertIn.create(
        user_id: lizzo.id,
        project_type_id: i,
        rate: 50
    )
    puts expert_in
end

30.times do |i|
    this_user = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.unique.email,
        password: 'password',
        password_confirmation: 'password',
    )

    number = rand(1..98)
    this_user.image.attach({
        io: image_fetcher(number + 1),
        filename: "#{number}.jpg"
    })
    
    category = [1, 2, 3, 4, 5, 6].sample
    this_expert = ExpertIn.create(
        user_id: this_user.id,
        project_type_id: category,
        rate: number
    )
    rating = [1, 2, 3, 4, 5].sample
    Rating.create(novice_id: 1, expert_id: this_user.id, rating: rating)
end

# 10.times do |i|
#     type_id = [1, 2, 3, 4, 5, 6].sample
#     novice_id = User.all.sample.id
#     this_project = Project.create(
#         project_type_id: type_id,
#         description: "This is project number ##{i}",
#         novice_id: novice_id,
#         title: "Project #{i}",
#         expert_status: 'none',
#         is_complete: false
#     )

#     ChatRoom.create(project_id: this_project.id)
# end

# leaky_faucet = Project.create(
#     project_type_id: 2,
#     description: "The faucet in my kitchen sink has a consistent drip",
#     novice_id: 1,
#     title: "Fix my Leaky Faucet",
#     expert_status: 'none',
#     is_complete: false
# )

# ChatRoom.create(project_id: leaky_faucet.id)

