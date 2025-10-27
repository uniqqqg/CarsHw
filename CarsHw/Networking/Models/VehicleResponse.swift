//
//  VehicleResponse.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

struct VehicleResponse: Decodable {

	let collection: VehicleCollection
	let data: [VehicleData]

	struct VehicleCollection: Decodable {
		let url: String
		let count: Int
		let pages: Int
		let total: Int
		let next: String
		let prev: String
		let first: String
		let last: String
	}

	struct VehicleData: Decodable {
		let id: Int
		let makeId: Int
		let make: String
		let name: String
	}

}
