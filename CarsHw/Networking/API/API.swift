//
//  API.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

struct API {
	static let baseURL = "https://carapi.app/api/"
	
	struct Cars {
		static let models = "models/v2"
	}
	
	struct Motorcycles {
		static let models = "models/powersports"
	}
}
