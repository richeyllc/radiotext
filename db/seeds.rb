# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Rob's super user
# User.create()

# Create the ContestTypes
ContestType.find_or_create_by(name: "Texter X", description: "Contest for a single texter number X.")
ContestType.find_or_create_by(name: "Texter X - Y", description: "Contest for a multiple texters numbers X through Y.")
ContestType.find_or_create_by(name: "Text Keyword X", description: "Contest for a single texter number X that responds with the proper keyword.")
ContestType.find_or_create_by(name: "Caller X", description: "Contest for a single caller number X.")
ContestType.find_or_create_by(name: "Caller X - Y", description: "Contest for a multiple callers numbers X thorugh Y.")
ContestType.find_or_create_by(name: "Text Survey to Win", description: "Contest for a texter that responds to the corresponding survey.")
ContestType.find_or_create_by(name: "Caller Survey to Win", description: "Contest for a single caller that responds to the corresponding survey.")

# Create the BlastTypes
BlastType.find_or_create_by(name: "Outbound Voice Message", description: "Record a message to send to a group.")
BlastType.find_or_create_by(name: "Outbound Text", description: "Send a text to a group.")
BlastType.find_or_create_by(name: "Email Blast", description: "Send an email to a group.")

# Create the ScheduleTypes
ScheduleType.find_or_create_by(name: "Default", description: "Schedule to be run when no other schedules are running.")
ScheduleType.find_or_create_by(name: "Shift", description: "Schedule to be run for certain shifts daily or weekly.")
ScheduleType.find_or_create_by(name: "Start End", description: "Schedule that starts and ends on a given date and/or time.")
ScheduleType.find_or_create_by(name: "Runs For", description: "Schedule that starts now and runs for a certain amount of time.")
ScheduleType.find_or_create_by(name: "Runs Once", description: "Schedule that runs once at the start time.")

# Create SurveyQuestionTypes
SurveyQuestionType.find_or_create_by(name: "True False", description: "Allows the responder to select true or false as responses.")
SurveyQuestionType.find_or_create_by(name: "Yes No", description: "Allows the responder to select yes or no as responses.")
SurveyQuestionType.find_or_create_by(name: "Written Response", description: "Allows the responder to draft a written response.")
SurveyQuestionType.find_or_create_by(name: "Rate 1 to 9", description: "Allows the responder to choose a response from 1 to 9.")
SurveyQuestionType.find_or_create_by(name: "Rate 1 to 5", description: "Allows the respondet to choose a response from 1 to 5.")

# Create Test Phone Numbers
phone = PhoneNumber.find_or_create_by(number: "4358675309", description: "Test Phone Number")

# Create Test Contact
contacta = Contact.find_or_create_by(name: "Test Contact", email: "testing@example.com", address_1: "1234 Anywhere Street", address_2: "Suite 100", city: "Anytown", state: "UT", phone: "4358675309", age: "39", birthdate: Date.new(1979,1,1), opt_in_a: true, opt_in_b: true, opt_in_c: true, confirmed_number: true, notes: "Test contact.")

# Create Test messages
Message.find_or_create_by(contact_id: contacta.id, phone_number_id: phone.id, twilio_date_created: DateTime.new(2001,2,3,4,5,6), twilio_date_updated: DateTime.new(2001,2,3,4,5,6), date_sent: DateTime.new(2001,2,3,4,5,6), account_sid: "account_string", to: phone.number, from: "4353134714", body: "This is a test message.")
