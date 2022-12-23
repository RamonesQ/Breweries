//
//  BreweryModel.swift
//  Breweries
//
//  Created by Ramon Queiroz dos Santos on 26/11/22.
//

import Foundation

struct Brewery: Codable, Hashable {
	 let id: String
	 let name: String
	 let type: String
	 let street: String?
	 let address2: String?
	 let address3: String?
	 let city: String
	 let state: String
	 let postalCode: String
	 let country: String
	 let longitude: Double?
	 let latitude: Double?
	 let website: String?
	 let phone: String?
	 let average: Double
	 let sizeEvaluations: Double
	 let photos: [String?]?
	 
	 enum CodingKeys: String, CodingKey {
		  case id
		  case name
		  case type = "brewery_type"
		  case street
		  case address2
		  case address3
		  case city
		  case state
		  case postalCode = "postal_code"
		  case country
		  case longitude
		  case latitude
		  case website = "website_url"
		  case phone
		  case average
		  case sizeEvaluations = "size_evaluations"
		  case photos
	 }
}

struct BreweryEvaluation: Codable {
	 let email: String
	 let breweryId: String
	 let evaluationGrade: Double
	 
	 enum CodingKeys: String, CodingKey {
		  
		  case email = "email"
		  case breweryId = "brewery_id"
		  case evaluationGrade = "evaluation_grade"
	 }
}

struct ApiEvaluationResponse: Codable {
	 let email: String
	 let breweryId: String
	 let evaluationGrade: Double
}

struct BreweryPhotos: Codable, Equatable {
	let PhotoId: String
	let breweryId: String
	let url: String
	
	enum CodingKeys: String, CodingKey{
		case PhotoId = "id"
		case breweryId = "brewery_id"
		case url
	}
}

struct Brewery10: Codable, Hashable {
	 let name: String
	 let type: String
	 let average: Double
	 let photos: [String?]?
}

let topTenMock: [Brewery10] = [Brewery10(name: "Cervejaria A", type: "Pub", average: 3.8, photos: [nil]), Brewery10(name: "Cervejaria B", type: "Pub", average: 3.8, photos: [nil]), Brewery10(name: "Cervejaria C", type: "Pub", average: 3.8, photos: [nil]), Brewery10(name: "Cervejaria D", type: "Pub", average: 3.8, photos: [nil]), Brewery10(name: "Cervejaria E", type: "Pub", average: 3.8, photos: [nil])]

let breweriesMock: [Brewery] = [Brewery(id: "a", name: "Cervejaria C", type: "Pub", street: "Elm Street", address2: nil, address3: nil, city: "New York", state: "NY", postalCode: "0000", country: "USA", longitude: nil, latitude: nil, website: nil, phone: nil, average: 3.8, sizeEvaluations: 2.0, photos: [nil]),Brewery(id: "b", name: "Cervejaria D", type: "Pub", street: "Elm Street", address2: nil, address3: nil, city: "New York", state: "NY", postalCode: "0000", country: "USA", longitude: nil, latitude: nil, website: nil, phone: nil, average: 3.8, sizeEvaluations: 2.0, photos: [nil]),Brewery(id: "c", name: "Cervejaria A", type: "Pub", street: "Elm Street", address2: nil, address3: nil, city: "New York", state: "NY", postalCode: "0000", country: "USA", longitude: nil, latitude: nil, website: nil, phone: nil, average: 4.8, sizeEvaluations: 2.0, photos: [nil]),Brewery(id: "d", name: "Cervejaria E", type: "Pub", street: "Elm Street", address2: nil, address3: nil, city: "New York", state: "NY", postalCode: "0000", country: "USA", longitude: nil, latitude: nil, website: nil, phone: nil, average: 3.8, sizeEvaluations: 2.0, photos: [nil]),Brewery(id: "e", name: "Cervejaria B", type: "Pub", street: "Elm Street", address2: nil, address3: nil, city: "New York", state: "NY", postalCode: "0000", country: "USA", longitude: nil, latitude: nil, website: nil, phone: nil, average: 2.8, sizeEvaluations: 2.0, photos: [nil])]
