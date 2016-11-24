//  EPFullRecipeData.swift
//  RecipesEPadilla
//  Created by Esteban Padilla on 11/23/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.

import Foundation

class EPFullRecipeData  {
    var _id:Int?
    var title:String?
    var rating:Int?
    var image:String?
    var instructions:String?
    
    init?(json:[String:Any]) {
        guard let idData = json["id"] as? Int,
            let titleData = json["title"] as? String,
            let ratingData = json["rating"] as? Int,
            let imageData = json["image"] as? String,
            let instructionsData = json["instructions"] as? String
        
            else {
                return nil
        }
        
        self._id = idData
        self.title = titleData
        self.rating = ratingData
        self.image = imageData
        self.instructions = instructionsData
    }
}
