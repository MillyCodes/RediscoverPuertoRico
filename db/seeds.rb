User.create(username: "MillyCodes", password: "millyrock", name: "Milly Rock", email: "MillyCodes@gmail.com", b_day: "11/08")


Post.create( 
    user_id: 1,
    title: "Spend the Afternoon at Palomino Island",
    content: "No need to leave the island to enjoy the best water activities Puerto Rico has to offer. Guests of El Conquistador Resort can hop on the private catamaran, go scuba diving, snorkel, sail, windsurf, or ride horseback across the pristine-white beach of Palamino Island."
    )


Tag.create(
    name: "beaches"
)

PostTag.create(
    post_id: 1,
    tag_id: 1
)