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
	
	// TODO: - Сделать навигацию к детальному экрану, экрану редактирование, а также удаление машины из гаража
	// TODO: - Для редактирования и удаления, посмотри про свайп-действия в list :)
	// И да я тебе не запрещаю эксперементировать, главное разберись и повтори функционал предыдущего дз что мы с тобой делали на занятии.

	var body: some View {
		List {
			Section {
				ForEach(viewModel.cars) { car in
					carRow(car: car)
				}
			}
		}
		.navigationTitle("Мой Гараж")
	}

	func carRow(car: Car) -> some View {
		Button {
			viewModel.selectCar(car: car)
		} label: {
			HStack {
				KFImage(URL(string: car.imageUrl))
					.resizable()
					.frame(width: 60, height: 60)
					.clipShape(.circle)

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
