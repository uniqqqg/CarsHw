//
//  Car.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 09.10.2025.
//

import Foundation

struct Car: Identifiable, Hashable {
	var id = UUID()
	var imageUrl: String
	var brand: String
	var model: String
	var year: Int
}
