//
//  RequestMethod.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

// Все HTTP методы для взаимодействия с сервером
enum RequestMethod: String {
	
	// Получение данных
	case get = "GET"
	
	// Отправка данных
	case post = "POST"
	
	// Удаление данных
	case delete = "DELETE"
	
	// Изменение данных
	case put = "PUT"
	
	// Изменение + обновление данных
	case patch = "PATCH"
}
