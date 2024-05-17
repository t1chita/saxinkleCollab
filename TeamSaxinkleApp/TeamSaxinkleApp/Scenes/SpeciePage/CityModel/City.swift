//
//  City.swift
//  TeamSaxinkleApp
//
//  Created by Temur Chitashvili on 17.05.24.
//

import Foundation

//MARK: Struct For City Id
struct City: Decodable {
    let results: [CityResult]
    
    //MARK: Nested Structs
    struct CityResult: Decodable {
        let id: Int?
    }
}

//MARK: Struct For Plants And Animals/Birds
struct NatureInfo: Decodable {
    let results: [NatureResults]
}


struct NatureResults: Decodable {
    let taxon: Taxon?
}

struct Taxon: Decodable {
    let name: String?
    let defaultPhoto: DefaultPhoto?
    let wikipediaUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case defaultPhoto = "default_photo"
        case wikipediaUrl = "wikipedia_url"
    }
}

struct DefaultPhoto: Decodable {
    let attribution: String?
    let url: String?
}
