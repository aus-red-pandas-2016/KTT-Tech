User.destroy_all
Burn.destroy_all
Counter.destroy_all
Comment.destroy_all
Vote.destroy_all

user1 = User.create(username: "tomho", password: 'password')
user2 = User.create(username: "tj", password: 'password')
user3 = User.create(username: "kim", password: 'password')

burn1 = Burn.create(title: "Yo daddy so fat", user_id: 1, burn_description: "Yo daddy so fat, that when she jumps for joy, she gets stuck")
burn2 = Burn.create(title: "programmers", user_id: 2, burn_description: "What do computers and air conditioners have in common? They both become useless when you open windows")
burn3 = Burn.create(title: "Chuck Norris Computer", user_id: 3, burn_description: "Chuck Norris can screen shot his blue screen of death")


counter1 = Counter.create(description: "Yo mama so ugly she made One Direction go the other direction", user_id: 2)
burn1.counters << counter1
burn1.save
counter2 = Counter.create(description: "you're an iDiot", user_id: 1)
burn2.counters << counter2
counter3 = Counter.create(description: "Britney Bitch", user_id: 1)
burn3.counters << counter3

comment1 = Comment.create(user_id: 3, description: "Oh Tom, you're so funny")
burn1.comments << comment1
comment2 = Comment.create(user_id: 3, description: "Oh TJ, that was terrible")
counter1.comments << comment2
