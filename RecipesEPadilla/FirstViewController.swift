//
//  FirstViewController.swift
//  RecipesEPadilla
//
//  Created by Esteban Padilla on 11/23/16.
//  Copyright © 2016 Esteban Padilla. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    var dataManager:EPDataManager?
    var epNetworkManager:EPNetworkManager?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataManager = EPDataManager()
        epNetworkManager = EPNetworkManager()
        epNetworkManager!.getRecipesList(completion: self.reload)
        //epNetworkManager!.getRecipeInfo(recipeId: 655890, dataManager: dataManager!)
        tableView!.register(RecipeCell.self, forCellReuseIdentifier: "RecipeCell")
        navigationItem.title = "Recipe List"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload(json:Any) {
        dataManager?.parseRecipeList(json: json)
        self.tableView!.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = dataManager!.recipeList!.count
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
    }
}

class RecipeCell: UITableViewCell {
    var title:UILabel?
    
    override init(style:UITableViewCellStyle, reuseIdentifier reusedIdentifier:String?) {
        super.init(style: style, reuseIdentifier: reusedIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.title = UILabel()
        self.title!.text = "Cell"
        addSubview(title!)
    }
}

