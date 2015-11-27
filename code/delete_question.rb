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
sleep 8

#search by name dulu
user = Appium.find_element(:name, "Search by city")
user.click
user.send_keys("Eki")
sleep 2

#find question dulu
swipe :start_x => 583, :start_y => 280, :end_x => 10, :end_y => 280, :touchCount => 1, :duration => 800
sleep 1
#click delete to delete
Appium::TouchAction.new.tap(x: 615, y:460, count: 1).release.perform
sleep 2
puts "berhasil delete gan"
driver_quit