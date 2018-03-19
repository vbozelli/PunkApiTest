//
//  Beer.swift
//  PunkApiTest
//
//  Created by Victor Bozelli Alvarez on 19/03/2018.
//  Copyright © 2018 Victor Bozelli Alvarez. All rights reserved.
//

import ObjectMapper

final class Beer: Mappable {
    var abv: Float!
    var ibu: Float!
    var description: String!
    var imageUrl: String!
    var name: String!
    var tagline: String!
    
    init?(map: Map) {
    }
    
    func mapping(map: Map) {
        abv <- map["abv"]
        ibu <- map["ibu"]
        description <- map["description"]
        imageUrl <- map["image_url"]
        name <- map["name"]
        tagline <- map["tagline"]
    }
}
