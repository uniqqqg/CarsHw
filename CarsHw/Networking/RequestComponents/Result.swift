//
//  Result.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

// Для фильтрация результата запроса
enum Result<T> {
	case success(_ response: T)
	case serverError(_ error: Error)
	case authError(_ error: Error)
	case networkError(_ error: String)
}
