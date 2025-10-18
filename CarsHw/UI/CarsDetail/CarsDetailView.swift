//
//  CarsDetailView.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 09.10.2025.
//

import SwiftUI
import Kingfisher


struct CarsDetailView: View {
	@StateObject var viewModel: CarsDetailViewModel
	
	init(viewModel: CarsDetailViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	var body: some View {
		VStack {
			List {
				imageSection
				modelSection
				yearSection
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.navigationTitle(viewModel.navTitle)
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				Button {
					viewModel.presentEditSheet = true
				} label: {
					Image(systemName:"pencil")
				}
			}
		}
		.sheet(isPresented: $viewModel.presentEditSheet) {
			NavigationStack {
				CarsEditView(
					viewModel: .init(
						car: viewModel.car,
						configuration: .editing
					),
					action: { editedCar in
						withAnimation {
							viewModel.car = editedCar
						}
					}
				)
			}
		}
	}
	
	private var imageSection: some View {
		Section {
			HStack(spacing: 16) {
				if let carImage = viewModel.car.imageUrl {
					KFImage(URL(string: carImage))
						.resizable()
						.frame(width: 100, height: 100)
						.clipShape(.rect(cornerRadius: 30))
				}
				Text(viewModel.car.model)
					.font(.largeTitle)
			}
		}
		.listRowBackground(Color.clear)
		
	}
	
	private var modelSection: some View {
		Section("Model") {
			HStack {
				Image(systemName: "photo.artframe")
					.foregroundStyle(.yellow.opacity(0.5))
				Text(viewModel.car.model)
			}
		}
	}
	
	private var yearSection: some View {
		Section("Year") {
			HStack {
				Image(systemName:"creditcard.and.numbers")
					.foregroundStyle(.blue.opacity(0.5))
				Text(viewModel.car.year)
			}
		}
	}
}

#Preview {
	NavigationStack {
		CarsDetailView(
			viewModel: .init(
				car: .init(
					imageUrl: "https://avatars.mds.yandex.net/get-vertis-journal/3934100/2025-toyota-supra-a90-final-edition-europe_1.jpg_1733065612129/1600x1600",
					brand: "Toyota",
					model: "Supra",
					year: "2025"
				)
			)
		)
	}
}
