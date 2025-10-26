//
//  CarsListViewModel.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 09.10.2025.
//

import SwiftUI
import Combine

final class CarsListViewModel: ObservableObject {
	
	@Published var selectedCar: Car?
	@Published var showDescriptionSheet: Bool = false
	@Published var showAddSheet: Bool = false
	@Published var cars: [Car] = []
	@Published var error: Error? = nil
	@Published var engines: [Engine] = []
	
	private let carsService: CarsServiceProtocol
	private let motorcyclesService: MotorcyclesServiceProtocol
	private let engineService: EngineServiceProtocol
	
	init(
		carsService: CarsServiceProtocol = CarsService(),
		motorcyclesService: MotorcyclesServiceProtocol = MotorcyclesService(),
		engineService: EngineServiceProtocol = EngineService()
	) {
		self.carsService = carsService
		self.motorcyclesService = motorcyclesService
		self.engineService = engineService
	}
	
	func fetchCars() async {
		let result = await carsService.fetchModel(limit: 10)
		switch result {
		case .success(let response):
			cars = Car.fromResponse(response)
		case .serverError(let err):
			self.error = err
		case .authError(let err):
			self.error = err
		case .networkError(let message):
			self.error = NSError(domain: "NetworkError", code: -1, userInfo: [NSLocalizedDescriptionKey: message])
		}
	}
	
	func fetchEngines() async {
		let result = await engineService.fetchModel(parameters: VehicleRequestModel(year: "2018", model: "model",engineType:"engine_type"))
		switch result {
		case .success(let response):
			engines = Engine.fromResponse(response)
		case .serverError(let err):
			self.error = err
		case .authError(let err):
			self.error = err
		case .networkError(let message):
			self.error = NSError(domain: "NetworkError", code: -1, userInfo: [NSLocalizedDescriptionKey: message])
		}
	}
	
	func fetchMotorcycles() async {
		let result = await motorcyclesService.fetchModels(limit: 10, type: "street_motorcycle", make: "Yamaha")
		switch result {
		case .success(let response):
			cars.append(contentsOf: Car.fromResponse(response))
		default:
			self.error = error
		}
	}

	func presentAddSheet() {
		showAddSheet = true
	}
	
	func presentDescriptionSheet() {
		showDescriptionSheet = true
	}

	func selectCar(car: Car) {
		selectedCar = car
	}

	func addCarToGarage(newCar: Car) {
		withAnimation {
			cars.append(newCar)
		}
	}

}
