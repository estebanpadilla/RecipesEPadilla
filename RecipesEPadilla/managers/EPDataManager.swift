//  EPDataManager.swift
//  RecipesEPadilla
//  Created by Esteban Padilla on 11/23/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.

import Foundation
import UIKit

//EPDataManager is on charge of the data.
class EPDataManager {
    
    var recipeList:Array<EPRecipe>?
    var recipe:EPFullRecipeData?
    var selectedIndexRecipe:Int?
    
    init() {
        self.recipeList = Array<EPRecipe>()
        selectedIndexRecipe = 0
    }
    
    //Parse json data to a list of recipies.
    func parseRecipeList(json:Any){

        let jsonArray = json as! Array<Any>
        
        for recipe in jsonArray{
            let recipeObject = EPRecipe(json: recipe as! [String : Any])
            if (recipeObject != nil) {
                recipeList!.append(recipeObject!)
            }
        }
    }
    
    //Parse json data to the selected recipe.
    func parseRecipe(json:Any){
        self.recipe = EPFullRecipeData(json: json as! [String : Any])
    }
}

