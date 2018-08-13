User.create(
    username: "MillyCodes", 
    password: "millyrock",
    name: "Milly Rock"
    email: "MillyCodes@gmail.com",
    b_day: "11/08"
    
    )

Post.create( 
    user_id: 1
    title: "Diversity in Engineering: The Effect on Questions",
    content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    )


Tag.create(
    name: "beaches"
)

PostTag.create(
    post_id: 1,
    tag_id: 1,
)