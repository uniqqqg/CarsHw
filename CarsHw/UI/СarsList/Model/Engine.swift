//
//  Engine.swift
//  CarsHw
//
//  Created by Глеб Моргунов on 21.10.25.
//

import Foundation

struct Engine: Identifiable, Hashable {
	var id = UUID()
	let year: String?
	let model: String?
	let engineType: String?
	
	init(year: String?, model: String?, engineType: String?) {
		self.year = year
		self.model = model
		self.engineType = engineType
	}
}

extension Engine {
	static let mock: Engine = .init(year: "", model: "", engineType: "")
	
	init(from data: VehicleResponse.EngineData) {
		self.year = data.year
		self.model = data.model
		self.engineType = data.engineType
	}
	
	static func fromResponse(_ response: VehicleResponse) -> [Engine] {
		response.engine.map { Engine(from: $0) }
	}
}
