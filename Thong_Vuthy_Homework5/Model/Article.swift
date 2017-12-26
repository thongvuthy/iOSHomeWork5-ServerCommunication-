//
//  Article.swift
//  Thong_Vuthy_Homework5
//
//  Created by iMac008 on 12/26/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import Foundation
import ObjectMapper

struct Article {
    var title: String?
    var desc: String?
    var image: String?
    var createdDate : Date?
}

extension Article: Mappable {

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        title <- map["TITLE"]
        desc <- map["DESCRIPTION"]
        image <- map["IMAGE"]
        createdDate <- map["CREATED_DATE"]
    }

    func convertObject() -> [String : Any] {

        let data = ["TITLE": self.title!,
                    "DESCRIPTION": self.desc!,
                    "IMAGE": self.image!,
                    "CREATED_DATE" : self.createdDate!,
                    ] as [String : Any]
        
        return data
    }
}



