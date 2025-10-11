//
//  CarsEditViewModel.swift
//  CarsHw
//
//  Created by Глеб Моргунов on 9.10.25.
//

import Foundation
import Combine

final class CarsEditViewModel: ObservableObject {
	
	@Published var car: Car
	@Published var configuration: ViewConfiguration
	
	enum ViewConfiguration {
		case editing
		case creating
	}
		
	init(car: Car, configuration: ViewConfiguration = .creating) {
		self.car = car
		self.configuration = configuration
	}
}
	
	



	

