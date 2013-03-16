User.delete_all
Donation.delete_all

u1 = User.create(name:"Jane", email:"jane@jane.com", password:"abc", password:"abc")
u2 = User.create(name:"Stephen", email:"stephen@stephen.com", password:"abc", password:"abc")

d1 = Donation.create(amount:100, date:"2013-03-03")
d2 = Donation.create(amount:200, date:"2013-03-03")
d3 = Donation.create(amount:300, date:"2013-03-03")
d4 = Donation.create(amount:400, date:"2013-03-03")
d5 = Donation.create(amount:500, date:"2013-03-03")
d6 = Donation.create(amount:600, date:"2013-03-03")

u1.donations << d1 << d3 << d5
u2.donations << d2 << d4 << d6