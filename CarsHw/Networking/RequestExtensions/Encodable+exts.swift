//
//  Encodable+exts.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

extension Encodable {

	// Преобразовывает словарь в тип URLQueryItem
	func toQueryItems() -> [URLQueryItem]? {

		guard let data = try? JSONEncoder().encode(self),
			  let jsonObject = try? JSONSerialization.jsonObject(with: data),
			  let dictionary = jsonObject as? [String: Any] else {
			return nil
		}

		return dictionary.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
	}

}
