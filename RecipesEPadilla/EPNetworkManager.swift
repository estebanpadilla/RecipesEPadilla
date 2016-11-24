//
//  EPNetworkManager.swift
//  RecipesEPadilla
//
//  Created by Esteban Padilla on 11/23/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.
//

import Foundation
import Alamofire


class EPNetworkManager{
    
    let recipesURL = "http://gl-endpoint.herokuapp.com/recipes"
    var recipeURL:String?

    init() {
        self.recipeURL = "http://gl-endpoint.herokuapp.com/recipes/"
        
    }
    
    
    func getRecipesList(completion:@escaping (_ jsonData:Any)->()) {
        
        Alamofire.request(recipesURL).responseJSON { response in

            if let JSON = response.result.value {
                //dataManager.parseRecipeList(json: JSON)
                completion(jsonData:JSON)
            }
        }
    }
    
    func getRecipeInfo(recipeId:Int, dataManager:EPDataManager) {
        
        var url = recipeURL! + "\(recipeId)"
        
        Alamofire.request(url).responseJSON { response in
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                dataManager.parseRecipe(json: JSON)
            }
        }
    }
    
}
