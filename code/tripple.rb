require 'rubygems'
require 'appium_lib'

APP_PATH = '/Users/admin/Documents/Appium/Trial/Newsloop_APPs/Newsloop.app'

desired_caps = {
  caps:       {
    waitForAppScript:'$.delay(5000); $.acceptAlert();',
    platformName:  'iOS',
    versionNumber: '8.2',
    deviceName:    'iPhone 5s',
    app:           APP_PATH,
  },
  appium_lib: {
    sauce_username:   nil, # don't run on Sauce
    sauce_access_key: nil
  }
}

server_url = "http://127.0.0.1:4723/wd/hub"

Appium::Driver.new(desired_caps).start_driver
Appium.promote_appium_methods Object

wait = Selenium::WebDriver::Wait.new(:timeout => 20)

#wait.until{Appium.find_element(:name, "Allow")}

#testing nyari pake xpath
#wait.until{Appium.find_element(:xpath, "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[1]")}

#klik don't allow button
#v1 = ARGV[0]
#if v1 == "Allow"
 #   find_element(:xpath, "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[2]").click
  #  puts "ini Allow"
   # else
    #find_element(:xpath, "//UIAApplication[1]/UIAWindow[6]/UIAAlert[1]/UIACollectionView[1]/UIACollectionCell[1]").click
    #puts "ini don't allow"
#end

#scenario can open dashboard
sleep 10
wait.until{Appium.find_element(:name, "bt drawer")}
find_element(:name, "bt drawer").click

#open settings page
wait.until{Appium.find_element(:name, "icon gear")}
find_element(:name, "icon gear").click

#click got it
#wait.until{Appium.find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[4]")}
#find_element(:xpath, "//UIAApplication[1]/UIAWindow[1]/UIAButton[4]").click
wait.until{Appium.find_element(:name, "bt gotit")}
find_element(:name, "bt gotit").click

#country selection option
wait.until{Appium.find_element(:name, "Country Selection")}
find_element(:name, "Country Selection").click

#country selection
wait.until{Appium.find_element(:name, "Singapore")}
find_element(:name, "Singapore").click

#click close
wait.until{Appium.find_element(:name, "Close")}
find_element(:name, "Close").click

#click done
wait.until{Appium.find_element(:name, "Done")}
find_element(:name, "Done").click

#click view content
wait.until{Appium.find_element(:name, "bt refresh content")}
find_element(:name, "bt refresh content").click
  
#check if news are loaded
#wait.until{Appium.find_element(:name, "bt refresh content").displayed == false}

obj = Appium.find(:name, "bt refresh content")
if obj == null
  puts "Done"
else
  puts "not done"
  
end



driver_quit