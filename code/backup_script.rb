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