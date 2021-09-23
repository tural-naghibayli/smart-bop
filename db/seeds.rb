# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ComponentPressureTest.destroy_all
SafetyValveTest.destroy_all
PressureTest.destroy_all
User.destroy_all
Rig.destroy_all
Bop.destroy_all
Question.destroy_all

rig_1 = Rig.create!(name: "Fatih", reservoir_field: "Tuna_1", contractor_drilling_company: "Odfjell", operator_company: "TPAO")
user_1 = User.create!(rig: rig_1, email: "user2@user.com", password: "password", name: "User_name_2", position: "Driller", company: "Odfjell", admin: false)
bop_1 = Bop.create!(rig: rig_1, serial_number: "ofko", bop_type: "power", producer: "gs", pressure_rating: 5, description: 'very good')

pressure_test_1 = PressureTest.create!(user: user_1, bop: bop_1, last_test_date: Date.today-20 , completed_date:Date.today, next_test_deadline:Date.today+21 , test_fluid: "mud", well_name:"A1", serial_number_chart_recorded:"SN gauge 125", comment: "Equipment checked", corrective_action: "Risk assessed", drill_pipe_diameter: "4inch DP XT50")
safety_value_test_1 = SafetyValveTest.create!(pressure_test: pressure_test_1, unit: '12', serial_number: 'SN HW123', connection_type: 'DOI-3xr', high_pressure: 3000, low_pressure: 1200, test_result: 'Good')
component_pressure_test_1 = ComponentPressureTest.create!(pressure_test: pressure_test_1, bop_element_unit: 'xyz 23', component_type: 'Testing-XRT', low_pressure: 300, high_pressure: 4444, test_result: "xyz-xyz", open_gallons: 23, open_time: 5, close_gallons: 23, close_time: 5)

rig_2 = Rig.create!(name: "Zatih", reservoir_field: "Tuna_2", contractor_drilling_company: "Odfjell", operator_company: "TPAO")
user_1 = User.create!(rig: rig_1, email: "user2@user.com", password: "password", name: "User_name_2", position: 'Driller', company: "Odfjell", admin: false)
user_2 = User.create!(rig: rig_1, email: "user3@user.com", password: "password", name: "User_name_3", position: 'Shift Supervisor', company: "Odfjell", admin: false)
user_3 = User.create!(rig: rig_1, email: "user4@user.com", password: "password", name: "User_name_4", position: 'Well Site Leader', company: "Odfjell", admin: false)
user_4 = User.create!(rig: rig_1, email: "user5@user.com", password: "password", name: "User_name_5", position: 'Rig Superintendent', company: "Odfjell", admin: false)
user_5 = User.create!(rig: rig_2, email: "user6@user.com", password: "password", name: "User_name_6", position: 'Rig Superintendent', company: "Odfjell", admin: false)

bop_1 = Bop.create!(rig: rig_1, serial_number: "ofko", bop_type: "power", producer: "gs", pressure_rating: 5, description: 'very good')

pressure_test_1 = PressureTest.create!(user: user_1, bop: bop_1, last_test_date: Date.today-20 , completed_date:Date.today, next_test_deadline:Date.today+21 , test_fluid: "mud", well_name:"A1", serial_number_chart_recorded:"SN gauge 125", comment: "Equipment checked", corrective_action: "Risk assessed", drill_pipe_diameter: "4inch DP XT50")

puts "Created rig_1, user_1, bop_1, pressure_test_1 WITH NEW ids"
# ------ Questions for forms -------

# Equipment Checks
question_1 = Question.create!(name: "Annular pressure regulator - increase/decrease ?", question_type:"", category:"Equipment Checks")
question_2 = Question.create!(name: "Manifold pressure regulator - increase/decrease ?", question_type:"", category:"Equipment Checks")
question_3 = Question.create!(name: "Manifold pressure regulator - bypass/normal ?", question_type:"", category:"Equipment Checks")
question_4 = Question.create!(name: "Maximum manifold pressure applied to all closed ram functions ?", question_type:"", category:"Equipment Checks")
question_5 = Question.create!(name: "Mud gas Separator", question_type:"", category:"Equipment Checks")
question_6 = Question.create!(name: "Rotary Drilling hoses", question_type:"", category:"Equipment Checks")
question_7 = Question.create!(name: "Trip tanks", question_type:"", category:"Equipment Checks")
question_8 = Question.create!(name: "Pit level indicators", question_type:"", category:"Equipment Checks")

puts "Created equipment check questions"
# General Manifold

question_9 = Question.create!(name: "Test pressure applied", question_type:"", category:"General Manifold")
question_10 = Question.create!(name: "Pressure gauge checked", question_type:"", category:"General Manifold")
question_11 = Question.create!(name: "Valves tested individually?", question_type:"", category:"General Manifold")

puts "Created general manifold questions"
# Choke Manifold
question_13 = Question.create!(name: "Remote manual choke checked ?", question_type:"", category:"Choke Manifold")
question_14 = Question.create!(name: "Operated auto-chokes with hand pump ?", question_type:"", category:"Choke Manifold")
question_15 = Question.create!(name: "Operated auto-chokes with hand pump ?", question_type:"", category:"Choke Manifold")

puts "Created choke manifold questions"
