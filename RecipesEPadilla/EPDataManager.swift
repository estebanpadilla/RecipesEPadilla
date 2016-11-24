//
//  EPDataManager.swift
//  RecipesEPadilla
//
//  Created by Esteban Padilla on 11/23/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.
//

import Foundation
import UIKit

class EPDataManager {
    
    var recipeList:Dictionary<Int, EPRecipe>?
    var recipe:EPFullRecipeData?
    
    init() {
        self.recipeList = Dictionary<Int, EPRecipe>()
    }
    
    func parseRecipeList(json:Any){

        let jsonArray = json as! Array<Any>
        
        for recipe in jsonArray{
            let recipeObject = EPRecipe(json: recipe as! [String : Any])
            recipeList![recipeObject!._id!] = recipeObject!
        }
    }
    
    func parseRecipe(json:Any){
        //let jsonArray = json as! Array<Any>
        self.recipe = EPFullRecipeData(json: json as! [String : Any])
    }
    
    
}

