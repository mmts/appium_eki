require 'rubygems'
require 'appium_lib'

#APP_PATH = '/Users/ahmadfmudzaki/Downloads/1442782901_app-staging-debug-040.apk'

desired_caps = {
  caps:       {
  platformName:     'Android',
  platformVersion:  '5.1',
  deviceName:       '4df1fe711a3d5f99',
  #app:           APP_PATH,
  appPackage:     'com.tripple.tripple',
  appActivity:    'com.tripple.tripple.SplashActivity',

  },
  appium_lib: {
    sauce_username:   nil, # don't run on Sauce
    sauce_access_key: nil
  }
}

server_url = "http://127.0.0.1:4723/wd/hub"

Appium::Driver.new(desired_caps).start_driver
Appium.promote_appium_methods Object

wait = Selenium::WebDriver::Wait.new(:timeout => 15)


#wait until overlay comes
#wait.until{Appium.find_element(:id, "com.tripple.tripple:id/iv_overlay")}
sleep 5

#swipe overlay
#(0..2).each do |i|
#   swipe :start_x => 583, :start_y => 720, :end_x => 583, :end_y => 100, :touchCount => 1, :duration => 400
#end

#click + button
wait.until{Appium.find_element(:id, "com.tripple.tripple:id/iv_right_actionbar").click}

#click choose city
wait.until{Appium.find_element(:id, "com.tripple.tripple:id/btn_new_question_select_city").click}

#select city
city = Appium.find_element(:name, "Search")
city.click
city.send_keys("Bali")

#Click Bali
Appium.find_element(:name, "Bali, Indonesia").click

#typing question
Appium.find_element(:id, "com.tripple.tripple:id/txt_input").send_keys("This is new question?????")

#click post button 
Appium.find_element(:id, "com.tripple.tripple:id/tv_right_actionbar").click


#testo.each_with_index do |val, index|
#  if val.text != "Bali, Indonesia"
#    swipe :start_x => 583, :start_y => 720, :end_x => 583, :end_y => 100, :touchCount => 1, :duration => 800
#  end 
#  puts val.text + " -> #{index}"
#end


sleep 5

wait { text 'This is new question'}
puts "berhasil hilal terlihat juragan"

sleep 4
driver_quit