//
//  CarsListView.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 09.10.2025.
//

import SwiftUI
import Kingfisher

struct CarsListView: View {
	
	@StateObject private var viewModel = CarsListViewModel()
	
	var body: some View {
		bodyView
			.navigationTitle("Мой Гараж")
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button {
						viewModel.presentAddSheet()
					} label: {
						Image(systemName: "plus")
					}
				}
			}
			.sheet(isPresented: $viewModel.showAddSheet) {
				NavigationStack {
					CarsEditView(
						viewModel: .init(car: Car.mockEmpty),
						action: { newCar in
							viewModel.addCarToGarage(newCar: newCar)
						}
					)
				}
			}
			.navigationDestination(item: $viewModel.selectedCar) { car in
				CarsDetailView(viewModel: .init(car: car))
			}
			.task {
				await viewModel.fetchCars()
				await viewModel.fetchMotorcycles()
				await viewModel.fetchEngines()
			}
	}
	
	private var bodyView: some View {
		List {
			Section {
				ForEach(viewModel.cars) { car in
					carRow(car: car)
				}
			}
		}
	}
	
	func carRow(car: Car) -> some View {
		Button {
			viewModel.selectCar(car: car)
		} label: {
			HStack {
				if let carImage = car.imageUrl {
					KFImage(URL(string: carImage))
						.resizable()
						.frame(width: 60, height: 60)
						.clipShape(.circle)
				}
				
				VStack(alignment: .leading, spacing: 4) {
					Text(car.brand)
						.font(.title2)
						.foregroundStyle(.black)
					Text(car.model)
						.font(.title3)
						.foregroundStyle(.gray)
				}
				
				Spacer()
				
				Image(systemName: "chevron.right")
					.foregroundStyle(.gray)
			}
		}
	}
	
}

#Preview {
	NavigationStack {
		CarsListView()
	}
}
