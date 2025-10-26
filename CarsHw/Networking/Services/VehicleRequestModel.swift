//
//  VehicleRequestModel.swift
//  CarsHw
//
//  Created by Глеб Моргунов on 22.10.25.
//

import Foundation

struct VehicleRequestModel: Encodable {
	let year: String?
	let model: String?
	let engineType: String?
	
	init(year: String?, model: String?, engineType: String?) {
		self.year = year
		self.model = model
		self.engineType = engineType
	}
}
