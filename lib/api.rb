# NEED TO RE-FACTOR >> WEEKEND CHORES!

class API 
    
    def self.space_data
        url = 'https://api.le-systeme-solaire.net/rest/bodies/'
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
                
        space_data = JSON.parse(response.body)["bodies"]
    end 

    def self.random_planet
        random_planet = []

        space_data.each do |data|
            random_planet << data["englishName"]
        end 

        random_planet.sample(1)
    end 

    def self.planets
        planets = []

        space_data.each do |data|
            if data["isPlanet"] == true
                planets << data["englishName"]
            end 
        end 

        planets 
    end 

    def self.dwarf_planets
        dwarf_planets = []

        space_data.each do |data|
            if data["isPlanet"] == false && data["englishName"] != ""
                dwarf_planets << data["englishName"]
            end 
        end 
    
        dwarf_planets.sample(10)
    end 
    
    def self.planet_info(name)
        space_data.detect do |data|
            if data["englishName"] == name 
                puts "Name: " + data["englishName"].to_s
                puts "  Mean Radius: " + data["meanRadius"].to_s + " kilometres"
                puts "  Density: " + data["density"].to_s + " g.cm3"
                puts "  Gravity: " + data["gravity"].to_s + " m.s-2"
                puts "  Perihelion: " + data["perihelion"].to_s + " kilometres"
                puts "  Aphelion: " + data["aphelion"].to_s + " kilometres"
                if data["discoveredBy"] != ""
                    puts "  Discovered by: " + data["discoveredBy"].to_s
                end 
                if data["discoveryDate"] != ""
                    puts "  Discovery Date: " + data["discoveryDate"].to_s
                end 
            end 
        end 
    end 

    def self.planet_attributes(name)
        space_data.detect do |data|
            if data["englishName"] == name 
                data 
            end 
        end 
    end 

    def self.closest_planet(current_planet)
        space_data.detect do |data|
            if data["englishName"] == current_planet 
                if data["aroundPlanet"] == nil
                    puts "If you would like to travel to other Planets, please enter 1."
                    puts "If you are interested in dwarf Planets selections, please enter 2."
                else 
                    puts "Your closest planet is " + data["aroundPlanet"]["planet"].capitalize.to_s + "."
                end 
            end 
        end 
    end 

    def self.spacecraft
        url = "https://api.spacexdata.com/v3/rockets"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body

        spacecraft = JSON.parse(response.body)
    end
    
    def self.spacecraft_info 
        spacecraft.each do |ship|
            puts ship["rocket_name"].to_s 
            puts ship["description"].to_s
            puts "  Height: " + ship["height"]["feet"].to_s + " feet"
            puts "  Mass: " + ship["mass"]["lb"].to_s + " lbs"
            puts "  Success Rate: " + ship["success_rate_pct"].to_s + "%"
        end 
        nil 
    end 

    binding.pry

    def self.spacecraft_status(name)
        spacecraft.detect do |ship|
            if ship["rocket_name"] == name 
                puts ship["rocket_name"].to_s 
                puts "  Engine type: " + ship["engines"]["type"].capitalize.to_s 
                puts "  Engine propellant 1: " + ship["engines"]["propellant_1"].capitalize.to_s 
                puts "  Engine propellant 2: " + ship["engines"]["propellant_2"].capitalize.to_s 
            end 
        end 
    end 

    def self.spacecraft_landing(planet)
        space_data.detect do |data|
            puts data["gravity"] if data["englishName"] == planet 
        end 
    end 
end 