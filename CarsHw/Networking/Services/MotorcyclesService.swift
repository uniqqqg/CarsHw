//
//  MotorcyclesService.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

protocol MotorcyclesServiceProtocol {
	func fetchModels(limit: Int, type: String, make: String) async -> Result<VehicleResponse>
}

class MotorcyclesService: Requester, MotorcyclesServiceProtocol {
	func fetchModels(limit: Int, type: String, make: String) async -> Result<VehicleResponse> {
		return await sendRequest(endpoint: MotorcyclesEndpoint.models(limit: limit, type: type, make: make), responseModel: VehicleResponse.self)
	}
}
