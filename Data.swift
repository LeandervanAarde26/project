
import Foundation

struct Car: Hashable,Codable, Identifiable {
    let id : Int?
    var make: String
    var model: String?
    var generation: String?
    var engine_modification: String?
    var year: Int 
    var powertrain_architecture: String?
    var body_type: String?
    var number_of_seats: Int?
    var number_of_doors: Int?
    var urban_fuel_consumption: Double?
    var extra_urban_fuel_consumption: Double?
    var combined_fuel_consumption: Double?
    var fuel_type: String?
    var acceleration: Double? // was Int
    var top_speed: Int? // was Int
    var power: Int?
    var torque: Int?
    var engine_location: String?
    var engine_displacement: Int?
    var number_of_cylinders: Int?
    var position_of_cylinders: String?
    var number_of_valves_per_cylinder: Int?
    var fuel_system: String?
    var engine_aspiration: String?
    var kerb_weight: Int?
    var fuel_tank_capacity: Double?
    var drive_wheel: String?
    var number_of_gears: Int?
    var front_brakes: String?
    var rear_brakes: String?
}
