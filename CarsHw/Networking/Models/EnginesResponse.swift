//
//  EnginesResponse.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 26.10.2025.
//

import Foundation

struct EnginesResponse: Decodable {
	let collection: CollectionData
	let data: [EngineData]
	
	struct CollectionData: Decodable {
		let url: String
		let count, pages, total: Int
		let next, prev, first, last: String
	}

	struct EngineData: Decodable {
		let id, makeID, modelID, submodelID: Int
		let trimID, year: Int
		let make, model: String
		let series: String?
		let submodel, trim, trimDescription, engineType: String
		let fuelType, cylinders, size: String
		let horsepowerHP, horsepowerRPM, torqueFtLbs, torqueRPM: Int
		let valves: Int
		let valveTiming, camType, driveType, transmission: String
		
		enum CodingKeys: String, CodingKey {
			case id
			case makeID = "make_id"
			case modelID = "model_id"
			case submodelID = "submodel_id"
			case trimID = "trim_id"
			case year, make, model, series, submodel, trim
			case trimDescription = "trim_description"
			case engineType = "engine_type"
			case fuelType = "fuel_type"
			case cylinders, size
			case horsepowerHP = "horsepower_hp"
			case horsepowerRPM = "horsepower_rpm"
			case torqueFtLbs = "torque_ft_lbs"
			case torqueRPM = "torque_rpm"
			case valves
			case valveTiming = "valve_timing"
			case camType = "cam_type"
			case driveType = "drive_type"
			case transmission
		}
	}
}
