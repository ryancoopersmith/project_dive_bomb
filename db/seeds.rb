# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{name: 'Star Wars' }, {name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def rating(review)
  if review.user.admin?
    review.bar.rating = (review.drinks * 1.5 + review.food * 0.5 + review.entertainment * 0.5 + review.vibe * 1.25 + review.setting * 1.25) / 5.0
    review.bar.save
  end
end

if Rails.env.development? || Rails.env.production?
  Bar.destroy_all
  User.destroy_all
  Review.destroy_all

  devin = User.create!(
    username: 'dbombay',
    email: 'devin.bombay@gmail.com',
    password: 'dbombay1',
    password_confirmation: 'dbombay1',
    admin: true
  )
  ryan = User.create!(
    username: 'ryancoopersmith1',
    email: 'ryancoopersmith1@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    admin: true
  )
  arielle = User.create!(
    username: 'arilandau',
    email: 'ariellelandau360@gmail.com',
    password: 'password1',
    password_confirmation: 'password1',
    admin: true
  )
  corey = User.create!(
    username: 'fischer0525',
    email: 'fischer0525@gmail.com',
    password: 'password2',
    password_confirmation: 'password2',
    admin: true
  )
  typical_user = User.create!(
    username: 'typicaluser',
    email: 'typicaluser12345@gmail.com',
    password: 'typicalpassword',
    password_confirmation: 'typicalpassword'
  )

  franks = Bar.create!( name: 'Dirty Frank\'s Bar', address: '347 S. 13th St.', city: 'Philadelphia', state: 'PA', zip: '19107', phone_number: '215-732-5010', url: 'http://www.dirtyfranksbar.com', image_url: 'http://jayfmillercreative.com/wp-content/uploads/2012/01/i_Dirty-Franks-JFMillerCr.jpg', description: 'Cash-only corner bar filled with eclectic knickknacks hanging from the ceiling and local art.' )

  oscars = Bar.create!( name: 'Oscar\'s Tavern', address: '1524 Sansom St.', city: 'Philadelphia', state: 'PA', zip: '19130', phone_number: '215-972-9938', url: 'https://m.facebook.com/Oscars-Tavern-187176721252/', image_url: 'https://scontent-mia1-2.xx.fbcdn.net/v/t1.0-9/fr/cp0/e15/q65/1917917_213451346252_6865044_n.jpg?efg=eyJpIjoidCJ9&oh=9d75e498e46764c1d3f398d8a69c6d1f&oe=596BD775', description: 'This Center City staple has a Cheers vibe with a decidedly grittier atmosphere. Its location provides a healthy mix of locals and visitors, and one of the most eclectic crowds in Philadelphia. Several TVs (if you can hear them over the boisterous conversation) are usually tuned to local sports, and if you are hungry make sure to order the \'cheesesteak and a half.' )

  mcglincheys = Bar.create!( name: 'McGlinchey\'s', address: '259 S. 15th St.', city: 'Philadelphia', state: 'PA', zip: '19102', phone_number: '215-735-1259', url: 'http://www.mcglincheys.com', image_url: 'http://www.mcglincheys.com/uploads/1/9/9/7/19979013/6639258_orig.jpg', description: 'There is something charming about the slightly somber environment of this Center City watering hole. If you ever find yourself sandwiched between an Average Joe lamenting the work day and a Millennial ready to take on the world, you might just be at McGlinchey\'s. McGlinchey\'s is truly a dive\'s dive. Did I mention this might be the only bar in Center City where smoking is still permitted?' )

  bobs = Bar.create!( name: 'Bob and Barbara\'s', address: '1509 South St', city: 'Philadelphia', state: 'PA', zip: '19146', phone_number: '215-545-4511', url: 'http://www.bobandbarbaras.com/', image_url: 'http://www.bobandbarbaras.com/images/uploads/home/med/home_1344534984_1.jpg', description: 'Bob and Barbs\' exudes that legendary dive bar vibe, and for good reason. This bar has enough Pabst Blue Ribbon memorabilia to claim official shrine status, and between \'dirty\' bingo and \'drag night\' it may provide some of the most original and refreshing entertainment the city has to offer. Did I mention that Bob and Barbs invented the \'CityWide Special\', a shot of Jim Beam and a Pabst for $3?' )

  moms = Bar.create!( name: 'Tattooed Mom\'s', address: '530 South St.', city: 'Philadelphia', state: 'PA', zip: '19147', phone_number: '215-238-9880', url: 'https://www.tattooedmomphilly.com/', image_url: 'https://www.tattooedmomphilly.com/wp-content/uploads/2016/12/TM-exterior-e1482625597867.jpg', description: 'Punkers\', junkers\', and even yunkers\ can be found rubbing shoulders at this South Street institution. With retro decor and almost every square inch covered in graffiti, it\'s equal parts Rob Zombie film set and The Footclan Hideout from Ninja Turtles. If you are hungry, highlights include \'Taco Tuesdays\' and \'Pierogi Thursdays.' )

  rays = Bar.create!( name: 'Ray\'s Happy Birthday Bar', address: '1200 E. Passyunk Ave.', city: 'Philadelphia', state: 'PA', zip: '19147', phone_number: '215-365-1169', url: 'http://www.thehappybirthdaybar.com/', image_url: 'https://static.wixstatic.com/media/e41df7_7408f0f7f56248e4bd14c7e34d9b9b6a.jpg/v1/fill/w_960,h_627,al_c,q_85/e41df7_7408f0f7f56248e4bd14c7e34d9b9b6a.webp', description: 'Legend has it that Ray\'s lives up to its name, serving up a free drink to any birthday boy or girl. Thats not to say Ray\'s is a one trick pony, on the contrary the crowd is eclectic, the karaoke is killer, and 75+ years of South Philly history make it a magical little dive. If you\'re hungry after drinking, Pat\'s and Genos are one block away.' )

  dolphin = Bar.create!( name: 'The Dolphin', address: '1539 S. Broad St.', city: 'Philadelphia', state: 'PA', zip: '19147', phone_number: '215-278-7950', url: 'http://www.dolphinphilly.com/', image_url: 'https://static1.squarespace.com/static/565c9172e4b04cd6cea4c714/565dd7e8e4b019f40c9f3232/565dd7ece4b019f40c9f3280/1448990704483/Rock+Tits+%40+The+Dolphin+Tavern_May+17%2C+2013_Photography+by+Jason+Melcher_rDSC_5463.jpg?format=1000w', description: 'Originally a nudie bar for several decades, the current iteration of The Dolphin no longer has the stripper poles but more than makes up for it with the bangin\' sound system and dance floor. Very young and hip crowd enjoys a late night happy hour and an diverse entertainment lineup, including live acts and themed DJ nights. At The Dolphin you can either camp at the bar or let loose on the dance floor, it\'s your choice.' )

  lucky = Bar.create!( name: 'Lucky 13', address: '1820 S. 13th St.', city: 'Philadelphia', state: 'PA', zip: '19148', phone_number: '215-336-8467', url: 'http://www.lucky13pubphilly.com/', image_url: 'http://media.philly.com/images/1200*800/Lucky13-1024.jpg', description: 'This unassuming bar is right off of the Passyunk bar strip and feels like an oasis from the more \'hip\' and expensive bars that line the avenue. A chill spot, it usually remains that way throughout the course of the night unlike many dives that tend to get rowdy. For many locals, this is a home away from home.' )

  dive = Bar.create!( name: 'The Dive', address: '947 E Passyunk Ave', city: 'Philadelphia', state: 'PA', zip: '19147', phone_number: '215-465-5505', url: 'https://www.facebook.com/the.dive.bar', image_url: 'http://www.totalhappyhour.com/preview/500-450/content/files/mod.happyhour/4c721a4cbbb545e4b99dfef5aa1be523.jpg', description: 'Unabashedly living up to its name, this (sometimes) three-floor bar offers live mic nights and other entertainment options. The fairly low key hangout is known to get rowdy on occasion. While there is no official food menu, the bartender will throw a Hot Pocket in the microwave for a small fee. Does it get more \'divey\' than that?' )

  pope = Bar.create!( name: 'Pub of Passyunk East', address: '1501 E. Passyunk Ave.', city: 'Philadelphia', state: 'PA', zip: '19147', phone_number: '215-755-5125', url: 'http://pubonpassyunkeast.com/', image_url: 'http://press.visitphilly.com/uploads/photos/2477_l.jpg', description: 'Endearingly known as \'The Pope,\' this bar has it all. Good food, large selection of beers an liquors, and occasional DJ entertainment. This place tends to attract a younger crowd an frequently turns into a party environment at night. This dive wears many hats.' )

  republican = Bar.create!( name: 'Republican Club', address: '1734 Snyder Ave.', city: 'Philadelphia', state: 'PA', zip: '19145', phone_number: '215-462-0310', image_url: 'https://s3-media1.fl.yelpcdn.com/bphoto/aDHjCbOwV2jG56I-ZHP9yQ/o.jpg', description: 'One of the most unique dives in the city, its nondescript street presence will not prepare for what you are about to experience inside. \'The Republican\' is actually a private after-hours club, staying open until 3:30 many nights. In case you aren\'t quite hooked yet, The Republican is primarily know for offering topless dancing!' )

  twelvesteps = Bar.create!( name: '12 Steps Down', address: '831 Christian St.', city: 'Philadelphia', state: 'PA', zip: '19147', phone_number: '215-238-0379', url: 'http://www.12stepsdown.com/', image_url: 'http://media.philly.com/images/12steps5.jpg', description: 'This basement bar quite literally lives up to its name. Another dive that allows smoking, this often packed night spot has a pool table and a banging \'Punk Rock Karaoke\' night. Very sweet down to earth owners who work both the bar and the door. This is a Philly hipster favorite, but is extraordinarily welcoming to anyone.' )

  kellianns = Bar.create!( name: 'Kellianns', address: '1549 Spring Garden St.', city: 'Philadelphia', state: 'PA', zip: '19130', phone_number: '215-563-6990', url: 'https://www.facebook.com/Kellianns-Bar-and-Grill-281261789931/', image_url: 'http://fishtownbeerrunners.com/wp-content/uploads/2013/11/kel1.jpg', description: 'Old school Irish bar and a dive in the most traditional sense. More of a local bar than a destination, it\'s worth the travel. Excellent pub-grub and a solid drink selection make this a good choice during the day or night. Generally an older crowd, but very welcoming to anyone.' )

  greenroom = Bar.create!( name: 'The Green Room', address: '1940 Green St.', city: 'Philadelphia', state: 'PA', zip: '19130', phone_number: '215-241-6676', url: 'http://greenroomphiladelphia.com/', image_url: 'http://media.phillyvoice.com/media/images/Screen_Shot_2015-05-25_at_7.11.56_P.focus-none.width-800.png', description: 'American grub and beer offered in a snug saloon setting with pool tables and an old-school vibe.' )

  institute = Bar.create!( name: 'The Institute', address: '549 N. 12th St.', city: 'Philadelphia', state: 'PA', zip: '19123', phone_number: '215-787-0888', url: 'http://www.institutebar.com/', image_url: 'https://i1.wp.com/eraserhood.com/wp-content/uploads/2017/01/10381382364_11ac09ca5a_b.jpg?resize=915%2C1024', description: 'This quaint 2-story hangout offers taps of craft beers and private booths (each with its own TV).' )

  lorraine = Bar.create!( name: 'Lorraine', address: '1502 Brown St.', city: 'Philadelphia', state: 'PA', zip: '19130', phone_number: '215-232-4282', image_url: 'https://s3-media3.fl.yelpcdn.com/bphoto/khtTbOWuXI6-vXR2mZpbMg/o.jpg', description: 'Little corner spot whose highlight is definitely the large outdoor backyard.' )

  barbary = Bar.create!( name: 'The Barbary', address: '951 Frankfort Ave.', city: 'Philadelphia', state: 'PA', zip: '19125', phone_number: '215-634-7400', url: 'https://www.facebook.com/thebarbary/', image_url: 'http://cdn.clubzone.com/content/uploads/places/17332/1-600x430.jpg', description: 'DJs set the scene for dance parties along with frequent live bands at this cash-only club.' )

  el = Bar.create!( name: 'El Bar', address: '1356 N. Front St.', city: 'Philadelphia', state: 'PA', zip: '19122', phone_number: '215-634-6430', url: 'https://www.facebook.com/The-El-Bar-76572966730/', image_url: 'http://fishtownbeerrunners.com/wp-content/uploads/2015/12/The-El-Bar-.jpg', description: 'Cash-only dive bar with a deck under the train tracks has weekly live music and draws a diverse crowd.' )

  kfn = Bar.create!( name: 'Kung Fu Necktie', address: '1250 N Front St', city: 'Philadelphia', state: 'PA', zip: '19122', phone_number: '215-291-4919', url: 'http://www.kungfunecktie.com/', image_url: 'https://laurenzapata.files.wordpress.com/2011/06/kfn.jpg', description: 'Live bands play most nights at this 2-floor watering hole with red-leather booths & dim lighting.' )

  handle = Bar.create!( name: 'Handle Bar', address: '1102 Frankfort Ave.', city: 'Philadelphia', state: 'PA', zip: '19123', phone_number: '215-425-2005', url: 'https://www.facebook.com/pages/The-Handle-Bar/115846711776769', image_url: 'http://www.thejawn.com/jawn-photos/the-handle-bar-philadelphia-1345059385.jpg', description: 'Blink and you\'ll miss it, this hole in the wall can appear somewhat rough but is a dive in the truest sense. For a true respite from the trendier bars in the area, pop into here for a quick pre- or post-game drink.' )

  sevenhundred = Bar.create!( name: '700 Club', address: '700 N. Second St.', city: 'Philadelphia', state: 'PA', zip: '19123', phone_number: '215-413-3181', url: 'http://www.the700.org/', image_url: 'http://cdn.clubzone.com/content/uploads/places/16453/1-650x430.jpg', description: 'This multilevel sports bar is a regular haunt for soccer fanatics and also offers DJs and dancing.' )

  ortliebs = Bar.create!( name: 'Ortliebs', address: '847 N. Third St.', city: 'Philadelphia', state: 'PA', zip: '19123', phone_number: '215-324-3348', url: 'http://ortliebslounge.ticketfly.com/', image_url: 'http://www.phillyliving.com/images/blogs/2013/02/DSCF2079.jpg', description: 'Local funk, jazz and rock performers provide the soundtrack for burgers, burritos and beer drinking.' )

  saint = Bar.create!( name: 'Saint Lazarus', address: '102 W. Girard Ave.', city: 'Philadelphia', state: 'PA', zip: '19123', phone_number: '215-258-8332', url: 'https://www.facebook.com/saintlazarusbar/', image_url: 'http://philly.thedrinknation.com/images/bars/bar_picture_the_saint_philly.jpg', description: 'Cocktails, Southern pub grub and DJ\'d dance parties offered in a cool nightclub with an edgy vibe.')

  Review.create!( bar: franks, user: corey, drinks: 4, food: 1, entertainment: 1, vibe: 5, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: oscars, user: corey, drinks: 5, food: 5, entertainment: 1, vibe: 5, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: mcglincheys, user: corey, drinks: 5, food: 2, entertainment: 1, vibe: 5, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: mcglincheys, user: corey, drinks: 5, food: 2, entertainment: 1, vibe: 5, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: bobs, user: corey, drinks: 5, food: 1, entertainment: 5, vibe: 5, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: moms, user: corey, drinks: 4, food: 5, entertainment: 3, vibe: 5, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: rays, user: corey, drinks: 5, food: 1, entertainment: 3, vibe: 5, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: dolphin, user: corey, drinks: 4, food: 1, entertainment: 5, vibe: 5, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: lucky, user: devin, drinks: 4, food: 4, entertainment: 2, vibe: 4, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: dive, user: devin, drinks: 5, food: 1, entertainment: 3, vibe: 4, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: pope, user: devin, drinks: 3, food: 5, entertainment: 2, vibe: 4, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: republican, user: devin, drinks: 4, food: 1, entertainment: 5, vibe: 4, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: twelvesteps, user: devin, drinks: 4, food: 4, entertainment: 3, vibe: 5, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: kellianns, user: arielle, drinks: 4, food: 5, entertainment: 1, vibe: 4, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: greenroom, user: arielle, drinks: 3, food: 4, entertainment: 2, vibe: 3, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: institute, user: arielle, drinks: 4, food: 4, entertainment: 3, vibe: 4, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: lorraine, user: arielle, drinks: 4, food: 4, entertainment: 2, vibe: 4, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: barbary, user: arielle, drinks: 4, food: 1, entertainment: 5, vibe: 5, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: el, user: ryan, drinks: 5, food: 2, entertainment: 5, vibe: 5, setting: 5, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: kfn, user: ryan, drinks: 4, food: 1, entertainment: 5, vibe: 4, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: handle, user: ryan, drinks: 5, food: 1, entertainment: 1, vibe: 3, setting: 3, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: sevenhundred, user: ryan, drinks: 4, food: 1, entertainment: 4, vibe: 5, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: ortliebs, user: ryan, drinks: 4, food: 4, entertainment: 5, vibe: 4, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.create!( bar: saint, user: ryan, drinks: 5, food: 4, entertainment: 4, vibe: 3, setting: 4, description: "Rock and roll baby this place is mayhem!" )

  Review.all.each do |review|
    rating(review)
  end
end
