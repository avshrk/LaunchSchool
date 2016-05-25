require 'byebug'

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

def get_name_from_email(str)
  str.split('@')[0].downcase
end

def get_first_name(str)
  str.split(' ')[0].downcase
end

def get_data(contact_data,first_name)
  contact_data.each do |indx|
   return indx if get_name_from_email(indx[0]) == first_name
  end
end

contacts.each_with_index do |(name,hash),indx|
   rw =  get_data(contact_data,get_first_name(name))
    hash[:email] = rw[0]
    hash[:addrs] = rw[1]
    hash[:phone] = rw[2]
end

 # puts contacts

puts "Joe's email"

puts contacts['Joe Smith'][:email]

puts "Sally's phone number"

puts contacts['Sally Johnson'][:phone]

