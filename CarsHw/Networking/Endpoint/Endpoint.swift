//
//  Endpoint.swift
//  CarsHw
//
//  Created by Захар Литвинчук on 18.10.2025.
//

import Foundation

protocol Endpoint {

	// Путь до конечной точки на сервере
	var path: String { get }
	
	// Метод работы с HTTP (Get, Post, ...)
	var method: RequestMethod { get }
	
	// Заголовок - это дополнительные мета-данные для запроса
	var header: [String: String]? { get }
	
	// Это дополнительные параметры для взаимодействия с серверным API
	var parameters: Encodable? { get } // Query Items & Json -> (["String": Any])

}
