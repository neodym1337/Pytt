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

        self.title = "Search recipes"
        configurator.configure(searchRecipesTableViewController: self)
        presenter.viewDidLoad()
        
        tableView.register(UINib(nibName: "SearchRecipeTableViewCell", bundle: nil),
                           forCellReuseIdentifier: SearchRecipesTableViewCellImplementation.defaultReuseIdentifier)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRecipes
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            SearchRecipesTableViewCellImplementation.defaultReuseIdentifier, for: indexPath)
            as? SearchRecipesTableViewCellImplementation else { return UITableViewCell() }
        presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    // MARK: - SearchRecipesView
    
    func refreshRecipesView() {
        print("Did refresh table")
        tableView.reloadData()
    }
    
    func displayRecipesRetrievalError(title: String, message: String) {
        
    }
}
