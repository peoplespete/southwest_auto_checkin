#!/usr/bin/env ruby
$LOAD_PATH << '.'

# Only needed for ruby 1.8.x
require 'rubygems'

# The part that activates bundler in your app
require 'bundler/setup'

# require your gems as usual
require 'pry'
require 'mechanize'

def ask(question)
  puts question
  STDIN.gets.chomp
end


# time_string = ask("when is your flight? (YYYY-MM-DD/HH:MM)")
# url = ask("what is your url?")
url = "http://luv.southwest.com/servlet/cc6?kOHpjQCTBRQqAVyG2G93ve6yxEf6beQ8wfVaVTVtpgsVOOOQkhmloOLklQJhuVJospgzamLjPV%3F00Xv3f7G0%3DJJUSTCUKMHKCMWISBITHIBAKUMYCYKTHMIHSYHUU%25TAJhgMpjuHlphgvmuILj%3Dzg171yW%25TAtHklvHuL%3D93ve6y%25TAMpjklvHuL%3DyG2G0+7Gvc6fbvVGf6beVyG2G93ve6yxEf6beQ8wfV2fb9XV0bWQ2f41AQTYBQpYpUzbpDPQCRRUBBRVXLX"
agent = Mechanize.new
agent.get(url) do |page|
  time_string = page.at('.swa_tables_segmentItinerary_time').text.strip
  # => "12:55PM"

  date_string = page.at('.swa_feature_checkIn_travelDate').text[/ .+/].strip
  # => "March 1, 2015"



  # Check In
  binding.pry
  form = page.form_with(name:"checkinOptions")
  button = form.button_with(:value => "Check In")
  checked_in_page = form.submit

  binding.pry

  # "input#optionEmail1" this needs to be checked
  # "input#emailAddress" this needs to have value of their email
  # "input#checkin_button" this needs to be clicked to submit

end
