require 'rubygems'
require 'appium_lib'

APP_PATH = '/Users/admin/Documents/Appium/Trial/Newsloop_APPs/Newsloop.app'

desired_caps = {
  caps:       {
  platformName:     'Android',
  platformVersion:  '5.1',
  deviceName:       '4df1fe711a3d5f99',
  appPackage:     'com.singtel.aurora.test',
  appActivity:    'com.singtel.aurora.test.SplashActivity',

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

#wait.until{Appium.find_element(:name, "Allow")}

#testing nyari pake xpath
wait.until{Appium.find_element(:xpath, "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[1]")}

#klik don't allow button
v1 = ARGV[0]
  if v1 == "Allow"
    find_element(:xpath, "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]").click
    puts "ini Allow"  
  else
    find_element(:xpath, "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[1]").click
    puts "ini don't allow"
  end

#scenario can open dashboard
wait.until{Appium.find_element(:name, "bt drawer")}
find_element(:name, "bt drawer").click

#open settings page
wait.until{Appium.find_element(:name, "icon gear")}
find_element(:name, "icon gear").click

#click got it
wait.until{Appium.find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[4]")}
find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[4]").click

#open Country selection
wait.until{Appium.find_element(:name, "Country Selection")}
find_element(:name, "Country Selection").click

#change flag
nation = ARGV[1]
wait.until{Appium.find_element(:name, "#{nation}")}
find_element(:name, "#{nation}").click

#wait text changes
wait { text "Categories/sources changed for #{nation}"}
puts "berhasil"

driver_quit