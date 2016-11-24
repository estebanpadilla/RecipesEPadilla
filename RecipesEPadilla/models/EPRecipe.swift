//
//  EPRecipe.swift
//  RecipesEPadilla
//
//  Created by Esteban Padilla on 11/23/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.
//

import Foundation

class EPRecipe  {
    var _id:Int?
    var title:String?
    
    init?(json:[String:Any]) {
        guard let idData = json["id"] as? Int,
                let titleData = json["title"] as? String
            else {
                return nil
        }
        
        self._id = idData
        self.title = titleData
    }
}
