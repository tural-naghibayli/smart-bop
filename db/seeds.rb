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
Bop.destroy_all
User.destroy_all
Rig.destroy_all

rig_1 = Rig.create!(name: "Fatih", reservoir_field: "Tuna_1", contractor_drilling_company: "Odfjell", operator_company: "TPAO")
user_1 = User.create!(rig: rig_1, email: "user2@user.com", password: "password", name: "User_name_2", position: "Driller", company: "Odfjell", admin: false)
bop_1 = Bop.create!(rig: rig_1, serial_number: "ofko", bop_type: "power", producer: "gs", pressure_rating: 5, description: 'very good')
pressure_test_1 = PressureTest.create!(user: user_1, bop: bop_1, last_test_date: Date.today-20 , completed_date:Date.today, next_test_deadline:Date.today+21 , test_fluid: "mud", well_name:"A1", serial_number_chart_recorded:"SN gauge 125", comment: "Equipment checked", corrective_action: "Risk assessed", drill_pipe_diameter: "4inch DP XT50")
safety_value_test_1 = SafetyValveTest.create!(pressure_test: pressure_test_1, unit: '12', serial_number: 'SN HW123', connection_type: 'DOI-3xr', high_pressure: 3000, low_pressure: 1200, test_result: 'Good')
component_pressure_test_1 = ComponentPressureTest.create!(pressure_test: pressure_test_1, bop_element_unit: 'xyz 23', component_type: 'Testing-XRT', low_pressure: 300, high_pressure: 4444, test_result: "xyz-xyz", open_gallons: 23, open_time: 5, close_gallons: 23, close_time: 5)
