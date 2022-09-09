import SwiftUI
import Foundation

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
