//
//  CarsService.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

protocol CarsServiceProtocol {
	func fetchModel(limit: Int) async -> Result<VehicleResponse>
}


class CarsService: Requester, CarsServiceProtocol {

	func fetchModel(limit: Int) async -> Result<VehicleResponse> {
		return await sendRequest(endpoint: CarsEndpoint.model(limit: limit), responseModel: VehicleResponse.self)
	}

}
