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
	var brand, model, year, horsepowerHp, cylinders, size, engineType, transmission: String
}

extension Car {
	static let mockEmpty: Car = .init(
		imageUrl: .empty,
		brand: .empty,
		model: .empty,
		year: .empty,
		horsepowerHp: .empty,
		cylinders: .empty,
		size: .empty,
		engineType: .empty,
		transmission: .empty
	)

	init(from data: VehicleResponse.VehicleData) {
		self.imageUrl = nil
		self.brand = data.make
		self.model = data.name
		self.year = "2015"
		self.horsepowerHp = "250"
		self.cylinders = "4"
		self.size = "2.0"
		self.engineType = "Petrol"
		self.transmission = "6-speed manual"
	}
	
	static func fromResponse(_ response: VehicleResponse) -> [Car] {
		response.data.map { Car(from: $0) }
	}
	
	init(from engineData: EnginesResponse.EngineData) {
		self.imageUrl = nil
		self.brand = engineData.make
		self.model = engineData.model
		self.year = String(engineData.year)
		self.horsepowerHp = String(engineData.horsepowerHP)
		self.cylinders = engineData.cylinders
		self.size = engineData.size
		self.engineType = engineData.engineType
		self.transmission = engineData.transmission
	}
	
	static func fromEngineResponse(_ response: EnginesResponse) -> [Car] {
		response.data.map { Car(from: $0) }
	}
}
