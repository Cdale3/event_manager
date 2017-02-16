require 'csv'

def clean_phone(homephone)
  if homephone.length < 10
    puts "not valid too short"
  elsif homephone.length == 10
    puts homephone
  elsif homephone.length == 11 && homephone[0] == 1
    puts homephone[1..10]
  elsif homephone.length == 11 && homephone[0] != 1
    puts "not valid 1st digit isn't a 1"
  else
    puts "not valid #{homephone}"
  end
end

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  phone = clean_phone(row[:homephone])

  print "#{name}, #{phone}"

end
