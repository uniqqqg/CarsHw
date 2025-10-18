//
//  Car.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 09.10.2025.
//

import Foundation

struct Car: Identifiable, Hashable {
	var id = UUID()
	var imageUrl: String?
	var brand: String
	var model: String
	var year: String
}

extension Car {
	static let mockEmpty: Car = .init(imageUrl: "", brand: "", model: "", year: "")

	init(from data: VehicleResponse.VehicleData) {
		self.imageUrl = nil
		self.brand = data.make
		self.model = data.name
		self.year = "2015"
	}
	
	static func fromResponse(_ response: VehicleResponse) -> [Car] {
		response.data.map { Car(from: $0) }
	}
}
