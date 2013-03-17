User.delete_all
Donation.delete_all
Application.delete_all

u1 = User.create(name:"Jane", email:"jane@jane.com", password:"abc", password:"abc")
u2 = User.create(name:"Stephen", email:"stephen@stephen.com", password:"abc", password:"abc")

d1 = Donation.create(amount:100, date:"2013-03-03")
d2 = Donation.create(amount:200, date:"2013-03-03")
d3 = Donation.create(amount:300, date:"2013-03-03")
d4 = Donation.create(amount:400, date:"2013-03-03")
d5 = Donation.create(amount:500, date:"2013-03-03")
d6 = Donation.create(amount:600, date:"2013-03-03")

a1 = Application.create(tagline: "Sternbach Global Industries", bio: "Scenester literally ugh squid, art party semiotics blog pinterest cray. Yr locavore freegan artisan, direct trade YOLO godard literally. Gastropub shoreditch mustache banh mi tofu, cosby sweater vice bespoke jean shorts. Pinterest banksy squid banjo dreamcatcher, +1 cred vice umami food truck viral butcher post-ironic vegan. Pour-over brooklyn banksy, hoodie before they sold out food truck biodiesel. Marfa biodiesel freegan artisan whatever. Umami small batch hoodie, high life mixtape synth wayfarers raw denim viral beard.

Typewriter DIY 8-bit butcher truffaut blog. Brunch biodiesel fap PBR, blog sartorial actually street art tonx bespoke leggings. Keffiyeh flexitarian sartorial brooklyn skateboard. Blue bottle shoreditch tumblr kogi. Twee raw denim YOLO, put a bird on it meggings artisan literally post-ironic readymade small batch. Dreamcatcher artisan vice, street art yr plaid neutra before they sold out kogi ethnic fanny pack meh. Pitchfork viral kogi irony.", image: "", age: 22)

a2 = Application.create(tagline: "Peartree Collective", bio: "Blog selfies forage chillwave. Locavore tumblr flexitarian mcsweeney's quinoa, vegan tousled you probably haven't heard of them typewriter ugh tofu fashion axe godard. Echo park VHS 8-bit, sartorial portland biodiesel pitchfork shoreditch banh mi. Vinyl mcsweeney's williamsburg biodiesel ennui quinoa. Pork belly bicycle rights ugh thundercats stumptown. Tousled single-origin coffee blog mustache plaid. Vegan cray pinterest freegan, irony YOLO portland organic flexitarian scenester +1 american apparel.

Brooklyn squid seitan tumblr truffaut, bushwick fixie before they sold out occupy tousled shoreditch helvetica. Bespoke squid master cleanse pop-up pork belly keytar. Church-key banksy fap freegan, pitchfork wolf mixtape tousled single-origin coffee four loko ethnic. Actually cardigan truffaut PBR, mixtape cosby sweater Austin twee organic whatever readymade. Quinoa cray wolf flexitarian tofu, bespoke butcher VHS. Dreamcatcher seitan artisan gastropub fixie, 90's portland hoodie ennui. 8-bit bicycle rights vinyl, cardigan artisan single-origin coffee next level flexitarian wolf bespoke cred mixtape fap.", image: "", age: 22)

u1.donations << d1 << d3 << d5
u2.donations << d2 << d4 << d6

u1.application = a1
u1.save
u2.application = a2
u2.save