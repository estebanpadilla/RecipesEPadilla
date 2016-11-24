//  RecipeViewController.swift
//  RecipesEPadilla
//  Created by Esteban Padilla on 11/24/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.

import Foundation
import UIKit
import AlamofireImage

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var recipeId: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var recipeRating: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload(json:Any, dataManager:EPDataManager) {
        dataManager.parseRecipe(json: json)
        recipeId.text = "\(dataManager.recipe!._id!)"
        recipeTitle.text = dataManager.recipe!.title!
        recipeRating.text = "\(dataManager.recipe!.rating!)"
        instructions.text = dataManager.recipe!.instructions!
        
        let url = URL(string: dataManager.recipe!.image!)!
        recipeImage.af_setImage(withURL: url)
    }
}
