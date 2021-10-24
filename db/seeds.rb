# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Approval.destroy_all
User.destroy_all

ComponentPressureTest.destroy_all
SafetyValveTest.destroy_all
Question.destroy_all
PressureTest.destroy_all

Answer.destroy_all

Bop.destroy_all
Rig.destroy_all

rig_1 = Rig.create!(name: "Fatih", reservoir_field: "Tuna-1", contractor_drilling_company: "Odfjell", operator_company: "TPAO")
rig_2 = Rig.create!(name: "Yavuz", reservoir_field: "Tuna-1", contractor_drilling_company: "Maersk", operator_company: "TPAO")
rig_3 = Rig.create!(name: "Kanuni", reservoir_field: "Tuna-2", contractor_drilling_company: "Odfjell", operator_company: "TPAO")
bop_1 = Bop.create!(rig: rig_1, serial_number: "SN BOP 1234", bop_type: "U-shape Dual Ram BOP", producer: "NOV Shaffer", pressure_rating: 15000, description: 'Designed for HP gas fields')
bop_2 = Bop.create!(rig: rig_2, serial_number: "SN BOP 4578", bop_type: "5k Variable ram", producer: "Cameron", pressure_rating: 5000, description: 'Designed for medium pressure oil fields')
bop_3 = Bop.create!(rig: rig_3, serial_number: "SN BOP 6789", bop_type: "10k Subsea", producer: "Vetco", pressure_rating: 10000, description: 'Designed for HP and HT oil fields')

puts "Created rig_1,rig_2, rig_3, bop_1, bop_2, bop_3"

user_1 = User.create!(rig: rig_1, email: "user1@user.com", password: "password", name: "Efe Arslan", position: 'Shift Supervisor', company: "Odfjell", admin: false)
user_2 = User.create!(rig: rig_1, email: "user2@user.com", password: "password", name: "Tural Naghibayli ", position: 'Well Site Leader', company: "TPAO", admin: false)
user_3 = User.create!(rig: rig_1, email: "user3@user.com", password: "password", name: "Duygu Cavushoglu", position: 'Rig Superintendent', company: "Odfjell", admin: false)
user_4 = User.create!(rig: rig_1, email: "user4@user.com", password: "password", name: "Safi Noorazi", position: 'Driller', company: "Odfjell", admin: false)

puts "Created user_1,user_2, user_3,user_4 for rig_1"

# ------ Questions for forms -------

# Equipment Checks
question_1 = Question.create!(name: "Annular pressure regulator - increase/decrease ?", question_type:"", category:"Equipment Checks")
question_2 = Question.create!(name: "Manifold pressure regulator - increase/decrease ?", question_type:"", category:"Equipment Checks")
question_5 = Question.create!(name: "Mud gas Separator", question_type:"", category:"Equipment Checks")
question_6 = Question.create!(name: "Rotary Drilling hoses", question_type:"", category:"Equipment Checks")
question_7 = Question.create!(name: "Trip tanks", question_type:"", category:"Equipment Checks")
question_8 = Question.create!(name: "Pit level indicators", question_type:"", category:"Equipment Checks")
question_3 = Question.create!(name: "Manifold pressure regulator - bypass/normal ?", question_type:"", category:"EquipmentCheckBypassNormal")
question_4 = Question.create!(name: "Maximum manifold pressure applied to all closed ram functions ?", question_type:"", category:"ManifoldPressure")

puts "Created equipment check questions"
# Standpipe Manifold

question_9 = Question.create!(name: "STP Pressure gauge checked", question_type:"", category:"Standpipe Manifold")
question_10 = Question.create!(name: "STP Valves tested individually?", question_type:"", category:"Standpipe Manifold")
question_11 = Question.create!(name: "Test pressure applied to STP manifold", question_type:"", category:"Pressure Input Standpipe Manifold")

puts "Created general manifold questions"
# Choke Manifold
question_12 = Question.create!(name: "Choke manifold Pressure gauges checked ", question_type:"", category:"Choke Manifold")
question_13 = Question.create!(name: "Choke manifold Valves tested individually?", question_type:"", category:"Choke Manifold")
question_15 = Question.create!(name: "Remote and manual choke checked ?", question_type:"", category:"Choke Manifold")
question_16 = Question.create!(name: "Operated auto-chokes with hand pump ?", question_type:"", category:"Choke Manifold")
question_14 = Question.create!(name: "Test pressure applied to Choke manifold:", question_type:"", category:"Pressure Input Choke Manifold")

puts "Created choke manifold questions"

question_17 = Question.create!(name: "Annular pressure regulator - increase/decrease ?", question_type:"", category:"Function Test Questions")
question_18 = Question.create!(name: "Manifold pressure regulator - increase/decrease ?", question_type:"", category:"Function Test Questions")
question_19 = Question.create!(name: "Manifold pressure regulator - bypass/normal ?", question_type:"", category:"Function Test BypassNormal")

puts "Created Function Test questions"

question_20 = Question.create!(name: "Visual Inspection of Equipment", question_type:"", category:"System Engineer Questions")
question_21 = Question.create!(name: "Instrument Calibration in Certification", question_type:"", category:"System Engineer Questions")
question_22 = Question.create!(name: "Visual Ex inspection", question_type:"", category:"System Engineer Questions")

puts "Created System Engineer questions"
