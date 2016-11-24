//  EPNetworkManager.swift
//  RecipesEPadilla
//  Created by Esteban Padilla on 11/23/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.

import Foundation
import Alamofire

//EPNetworkManager is on charge of all network requests.
class EPNetworkManager{
    
    let recipesURL = "http://gl-endpoint.herokuapp.com/recipes"
    var recipeURL:String! = "http://gl-endpoint.herokuapp.com/recipes/"

    init() { }
    
    //Request all recipies from network
    func getRecipiesData(completion:@escaping (_ jsonData:Any)->()) {
        Alamofire.request(recipesURL).responseJSON { response in
            if let JSON = response.result.value {
                completion(jsonData:JSON)
            }
        }
    }
    
    //Request selected recipe from network
    func getRecipeData(dataManager:EPDataManager, completion:@escaping (_ jsonData:Any,_ dataManager:EPDataManager)->()) {
    
            let url = recipeURL! + "\(dataManager.recipeList![dataManager.selectedIndexRecipe!]._id! )"
            Alamofire.request(url).responseJSON { response in
            
            if let JSON = response.result.value {
                completion(JSON, dataManager)
            }
        }
    }
}
