//
//  MotorcyclesEndpoint.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

enum MotorcyclesEndpoint: Endpoint {
	case models(limit: Int, type: String, make: String)
	
	var path: String {
		switch self {
		case .models:
			API.Motorcycles.models
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
		case let .models(limit, type, make):
			["limit": "\(limit)", "type": type, "make": make]
		}
	}
	
}
