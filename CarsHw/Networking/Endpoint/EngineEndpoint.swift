//
//  StreetMotorcycle.swift
//  CarsHw
//
//  Created by Глеб Моргунов on 20.10.25.
//

import Foundation

enum EngineEndpoint: Endpoint {
	case models(parameter: VehicleRequestModel)

	var path: String {
		switch self {
		case .models:
			API.Engine.models
		}
	}
	
	var method: RequestMethod {
		switch self {
		case .models:
			.get
		}
	}
	
	var header: [String : String]? {
		[Constants.authorizationHeaderKey: Constants.authorizationHeaderValue]
	}
	
	var parameters: (any Encodable)? {
		switch self {
		case let .models(parameter):
			parameter
		}
	}
}
