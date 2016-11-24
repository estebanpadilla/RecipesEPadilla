//  FirstViewController.swift
//  RecipesEPadilla
//  Created by Esteban Padilla on 11/23/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.

import UIKit

class AllRecipesViewController: UITableViewController {

    var dataManager:EPDataManager?
    var epNetworkManager:EPNetworkManager?
    var cellIdentifier = "EPRecipeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataManager = EPDataManager()
        epNetworkManager = EPNetworkManager()
        epNetworkManager!.getRecipiesData(completion: self.reload)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload(json:Any) {
        dataManager?.parseRecipeList(json: json)
        self.tableView!.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = dataManager!.recipeList!.count
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! EPRecipeCell
        let recipe = self.dataManager!.recipeList![indexPath.row]
        cell.title!.text = recipe.title!
        cell.subTitle!.text = "\(recipe._id!)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dataManager!.selectedIndexRecipe = indexPath.row
        self.performSegue(withIdentifier: "showView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showView" {
            if let destinationVC = segue.destination as? RecipeViewController {
                epNetworkManager?.getRecipeData(dataManager:self.dataManager!, completion: destinationVC.reload)
            }
        }
    }
}


