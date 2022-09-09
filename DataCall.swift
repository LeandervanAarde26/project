import SwiftUI
import Foundation

class favCars: ObservableObject {
	@Published var myCars: [Car] = []
}

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

class Network: ObservableObject {
	@Published var cars: [Car] = []

	func getCars() {
		guard let url = URL(string: "https://car-specs-data-api.herokuapp.com/cars/specs/Aston%20Martin") else { fatalError("Missing URL") }

		let urlRequest = URLRequest(url: url)

		let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
			if let error = error {
				print("Request error: ", error)
				return
			}

			guard let response = response as? HTTPURLResponse else { return }

			if response.statusCode == 200 {
				guard let data = data else { return }
				
				DispatchQueue.main.async {
					do {
						let decodedUsers = try JSONDecoder().decode([Car].self, from: data)
						self.cars = decodedUsers
//						print(decodedUsers)
					} catch let error {
						print("Error decoding: ", error)
					}
				}
			}
		}

		dataTask.resume()
	}
}
