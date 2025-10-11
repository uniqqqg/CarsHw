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
	@Published var cars: [Car] = [
		.init(
			imageUrl: "https://avatars.mds.yandex.net/get-vertis-journal/3934100/2025-toyota-supra-a90-final-edition-europe_1.jpg_1733065612129/1600x1600",
			brand: "Toyota",
			model: "Supra",
			year: "2025"
		),
		.init(
			imageUrl: "https://electrodrivemoscow.ru/upload/iblock/6f1/6f1d0c8b6d9e8ed8657ef8ad7de673fb.JPG",
			brand: "Chevrolet",
			model: "Corvete",
			year: "2023"
		),
		.init(
			imageUrl: "https://hips.hearstapps.com/hmg-prod/images/challengerdemon-1557775422.jpg?crop=0.926xw:0.846xh;0.0593xw,0.154xh&resize=2048:*",
			brand: "Dodge",
			model: "Challenger Demon",
			year: "2018"
		),
		.init(
			imageUrl: "https://avatars.mds.yandex.net/get-vertis-journal/3934100/2025-toyota-supra-a90-final-edition-europe_1.jpg_1733065612129/1600x1600",
			brand: "Toyota",
			model: "Supra",
			year: "2025"
		),
		.init(
			imageUrl: "https://images.unsplash.com/photo-1607853554439-0069ec0f29b6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=627",
			brand: "Bmw",
			model: "320d",
			year: "2018"
		)
	]

	func presentAddSheet() {
		// TODO: Реализовать переход на модальный экран(sheet) добавления машины в гараж
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
