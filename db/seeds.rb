array = ['paint', 'plubming', 'electrical', 'carpentry', 'flooring', 'landscaping']

array.map { |type| ProjectType.create(name: type) }

def image_fetcher(num)
    gender = ['men', 'women'].sample
    open("https://randomuser.me/portraits/#{gender}/#{num}.jpg")
end

30.times do |i|
    this_user = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.unique.email,
        password: 'password',
        password_confirmation: 'password',
    )

    number = rand(1..99)
    this_user.image.attach({
        io: image_fetcher(number),
        filename: "#{number}.jpg"
    })
    
    category = [1, 2, 3, 4, 5, 6].sample
    this_expert = ExpertIn.create(
        user_id: this_user.id,
        project_type_id: category,
        rate: number
    )
end

10.times do |i|
    type_id = [1, 2, 3, 4, 5, 6].sample
    novice_id = User.all.sample.id
    this_project = Project.create(
        project_type_id: type_id,
        description: "This is project number #1",
        novice_id: novice_id,
        title: "Project #1",
        expert_status: 'none',
        is_complete: false
    )
end