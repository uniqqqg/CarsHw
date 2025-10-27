//
//  StreetMotorcycleService.swift
//  CarsHw
//
//  Created by Глеб Моргунов on 21.10.25.
//

import Foundation

protocol EngineServiceProtocol {
	func fetchModel(requestModel: VehicleRequestModel) async -> Result<EnginesResponse>
}
	
	class EngineService: Requester, EngineServiceProtocol {
		func fetchModel(requestModel: VehicleRequestModel) async -> Result<EnginesResponse> {
			return await sendRequest(endpoint: EngineEndpoint.models(model: requestModel), responseModel: EnginesResponse.self)
		
		}
	}
