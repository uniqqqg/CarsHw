//
//  CarsEndpoint.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

enum CarsEndpoint: Endpoint {

	case model(limit: Int)
	
	var path: String {
		switch self {
		case .model:
			API.Cars.models
		}
	}
	
	var method: RequestMethod {
		switch self {
		case .model:
				.get
		}
	}
	
	var header: [String : String]? {
		[Constants.authorizationHeaderKey: Constants.authorizationHeaderValue]
	}
	
	var parameters: (any Encodable)? {
		switch self {
		case .model(let limit):
			["limit": limit]
		}
	}

}
