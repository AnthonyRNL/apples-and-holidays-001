require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each {|x| x[1] << supply}
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  wint = holiday_hash[:winter].collect do |key, value|
     value
  end
  wint.join(" ")
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |key, value|
    puts key.to_s.capitalize + ":"
      value.each do |k,v|
          sups = []
        v.each do |z|
          capt = []
          z.split(" ").each do |q|
            q[0] = q[0].upcase
            capt << q
          end
          sups << capt.join(" ")
        end
        # puts sups.join(", ")
        holiday = ""
        if k.to_s.include?("_")
          holder = []
            k.to_s.split("_").each do |x|
                holder << x.capitalize
            end
          holiday = holder.join(" ")
        else
          holiday = k.to_s.capitalize
        end
        # puts holiday
        str = "  #{holiday}: #{sups.join(', ')}"
        puts str
      end
  end

end
# binding.pry

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays = []
  holiday_hash.each do |key, value|
    value.each do |k,v|
      if v.include?("BBQ")
        holidays << k
      end
    end
  end
  holidays
end
