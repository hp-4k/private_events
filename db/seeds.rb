# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Set BCrypt to 

# Users

sheldon = User.create(name: "Sheldon", password: "bazinga", password_confirmation: "bazinga")
leonard = User.create(name: "Leonard", password: "foobar", password_confirmation: "foobar")
howard = User.create(name: "Howard", password: "foobar", password_confirmation: "foobar")
rajesh = User.create(name: "Rajesh", password: "foobar", password_confirmation: "foobar")
penny = User.create(name: "Penny", password: "foobar", password_confirmation: "foobar")
amy = User.create(name: "Amy", password: "foobar", password_confirmation: "foobar")
bernadette = User.create(name: "Bernadette", password: "foobar", password_confirmation: "foobar")

# Events

e1 = sheldon.events.create(
  title: 'Halo night',
  date: '2018-01-18',
  time: '20:00',
  location: "Sheldon and Leonard's apartment",
  description: 'We are playing the first Halo on the XBox, just like in the good old times.'
)

e2 = sheldon.events.create(
  title: 'Take away curry meal',
  date: '2016-03-12',
  time: '18:00',
  location: 'Sheldon and Leonard\'s apartment',
  description: 'All usual attenders are welcome. Penny is paying for her own food this time though.'
)
e3 = sheldon.events.create(
  title: 'WI-FI meeting',
  date: '2015-05-10',
  time: '08:00',
  location: "Penny's apartment",
  description: "An intervention to stop Penny from using our WIFI"
)

e4 = sheldon.events.create(
  title: 'Profesor Proton in town',
  date: '2015-11-20',
  time: '13:00',
  location: 'The comic book store',
  description: 'Profesor Protown visits Stuart\'s book store! It is a once-in-a-lifetime opportunity to get our old VHS cassettes with his shows signed!'
)

e5 = sheldon.events.create(
  title: 'Room mate agreement review',
  date: '2016-08-01',
  time: '10:00',
  location: 'Living room',
  description: 'A regular yearly review of the room mate agreement between Leonard and Sheldon'
)

e6 = leonard.events.create(
  title: 'Lactose intolerance - international trade fair',
  date: '2016-09-15',
  time: '08:00',
  location: 'Pasadena Exhibition Centre',
  description: "The world's biggest trade fair with lactose free products. I don't know about you but I am going!"
)

e7 = rajesh.events.create(
  title: 'Sale at the comic book store',
  date: '2016-02-01',
  time: '10:00',
  location: "Stuart's comic book store",
  description: "Stuart is selling some of the old Batman comic books half-price!"
)

e8 = penny.events.create(
  title: "Girls night out",
  date: '2016-03-10',
  time: '20:00',
  location: 'Somewhere with cheap alcohol',
  description: "Let's leave boys at home and have some fun."
)

# Invitations

Invitation.create(attended_event: e1, attendee: leonard)
Invitation.create(attended_event: e1, attendee: howard)
Invitation.create(attended_event: e1, attendee: rajesh)

Invitation.create(attended_event: e2, attendee: leonard)
Invitation.create(attended_event: e2, attendee: penny)
Invitation.create(attended_event: e2, attendee: howard)
Invitation.create(attended_event: e2, attendee: bernadette)
Invitation.create(attended_event: e2, attendee: rajesh)
Invitation.create(attended_event: e2, attendee: amy)

Invitation.create(attended_event: e3, attendee: penny)
Invitation.create(attended_event: e3, attendee: leonard)

Invitation.create(attended_event: e4, attendee: leonard)
Invitation.create(attended_event: e4, attendee: howard)

Invitation.create(attended_event: e5, attendee: leonard)

Invitation.create(attended_event: e7, attendee: sheldon)
Invitation.create(attended_event: e7, attendee: leonard)
Invitation.create(attended_event: e7, attendee: howard)

Invitation.create(attended_event: e8, attendee: bernadette)
Invitation.create(attended_event: e8, attendee: amy)
Invitation.create(attended_event: e8, attendee: rajesh)