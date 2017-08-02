//
//  SearchRecipeTableViewController.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

//Check here for basic pattern https://stackoverflow.com/documentation/ios/9467/mvp-architecture#t=201707281252273684482

import UIKit

class SearchRecipesTableViewController: UITableViewController, SearchRecipesView {
    
    var configurator = SearchRecipesConfiguratorImplementation()
    var presenter: SearchRecipesPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(searchRecipesTableViewController: self)
        presenter.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRecipes
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath)
        
        return cell
    }
    
    //MARK:  - SearchRecipesView
    
    func refreshRecipesView() {
        
    }
    
    func displayRecipesRetrievalError(title: String, message: String) {
        
    }
    
}


