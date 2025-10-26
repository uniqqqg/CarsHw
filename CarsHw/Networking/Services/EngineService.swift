//
//  StreetMotorcycleService.swift
//  CarsHw
//
//  Created by Глеб Моргунов on 21.10.25.
//

import Foundation

protocol EngineServiceProtocol {
	func fetchModel( parameters: VehicleRequestModel) async -> Result<VehicleResponse>
}
	
	class EngineService: Requester, EngineServiceProtocol {
		func fetchModel( parameters: VehicleRequestModel) async -> Result<VehicleResponse> {
			return await sendRequest(endpoint: EngineEndpoint.models(parameter: parameters), responseModel: VehicleResponse.self)
		
		}
	}
