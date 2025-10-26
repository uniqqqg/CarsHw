//
//  CarsEditView.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 09.10.2025.
//

import SwiftUI
import Kingfisher

// TODO: - Разработай экран редактирования машины
struct CarsEditView: View {
	@StateObject var viewModel: CarsEditViewModel
	@Environment(\.dismiss) var dismiss
	var action: (_ newCar: Car) -> Void
	
	init(
		viewModel: CarsEditViewModel,
		action: @escaping (_ newCar: Car) -> Void
	) {
		_viewModel = StateObject(wrappedValue: viewModel)
		self.action = action
	}
	
	var body: some View {
		ScrollView {
			VStack(spacing: 16) {
//				imageSection
				brandSecton
				modelSection
				yearSection
			}
		}
		.padding(.horizontal, 16)
		.scrollIndicators(.hidden)
		.safeAreaInset(edge: .bottom) {
			buttonSection
				.padding([.horizontal, .bottom], 16)
		}
		.navigationTitle(viewModel.configuration == .creating ? "Создание описания" : "Редактирование описания")
		.navigationBarTitleDisplayMode(.inline)
		
	}
	
//	private var imageSection: some View {
//		VStack(spacing: 24) {
//			if let carImage = viewModel.car.imageUrl {
//				KFImage(URL(string: carImage))
//					.placeholder {
//						ProgressView()
//					}
//					.resizable()
//					.frame(width: .infinity, height: 250)
//					.clipShape(.rect(cornerRadius: 30))
//
//			Text("Cсылка на изображение")
//				.fontWeight(.semibold)
//
//			TextField("Введите ссылку на изображение: ", text: $viewModel.car.imageUrl)
//				.textFieldStyle(.roundedBorder)
//				.frame(maxWidth: .infinity, alignment: .leading)
//			}
//		}
//	}
	
	private var brandSecton: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Марка")
				.fontWeight(.semibold)
			TextField("Введите марку машины", text: $viewModel.car.brand)
			.textFieldStyle(.roundedBorder)
		}
	}
	
	private var modelSection: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("Модель")
				.fontWeight(.semibold)
			TextField("Введите модель", text: $viewModel.car.model)
				.textFieldStyle(.roundedBorder)
		}
		
	}
	
	private var yearSection: some View {
		VStack(alignment: .leading) {
			Text("Год производства")
				.fontWeight(.semibold)
			
			TextField("Введите год производства",text: $viewModel.car.year)
				.textFieldStyle(.roundedBorder)
		}
	}
	
	private var buttonSection: some View {
		Button {
			action(viewModel.car)
			dismiss()
		} label: {
			Text(viewModel.configuration == .creating ? "Создать" : "Сохранить")
				.fontWeight(.bold)
				.frame(maxWidth: .infinity)
				.frame(height: 40)

		}
		.buttonStyle(.borderedProminent)
	}
}

#Preview {
	NavigationStack {
		CarsEditView(
			viewModel: .init(car: Car(imageUrl: "https://media.istockphoto.com/id/1435226078/ru/фото/передняя-часть-белого-bmw-m4-припаркована-на-улице-с-деревьями-на-заднем-плане.jpg?s=612x612&w=0&k=20&c=-TR3ivG5MeDtb97fjyNZGWhNF7TAfeUV_FkPDF2bbIk=", brand: "", model: "", year: "1"),),
			action: { _ in
			})//change
	}
}
