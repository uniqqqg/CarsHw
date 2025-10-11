//
//  CarsDetailViewModel.swift
//  CarsHw
//
//  Created by Глеб Моргунов on 9.10.25.
//

import Foundation
import Combine

final class CarsDetailViewModel: ObservableObject {
	@Published var car: Car
	@Published var presentEditSheet: Bool
	
	var navTitle: String {
		car.brand + " " + car.model
	}
	
	init(car: Car, presentEditSheet: Bool = false) {
		self.car = car
		self.presentEditSheet = presentEditSheet
	}
	
	func showSheet() {
		presentEditSheet = true
	}
}
