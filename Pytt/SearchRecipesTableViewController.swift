//
//  SearchRecipeTableViewController.swift
//  Pytt
//
//  Created by Hosk, Johan on 2017-07-28.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

//Check here for basic pattern https://stackoverflow.com/documentation/ios/9467/mvp-architecture#t=201707281252273684482

import UIKit
import RxSwift
import RxCocoa
import Localize_Swift

class RecipeListViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var configurator = RecipeListConfiguratorImplementation()
    var viewModel: SearchRecipesViewModelType!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(setText),
                                               name: NSNotification.Name(rawValue: LCLLanguageChangeNotification),
                                               object: nil)
        setText()
        
        configurator.configure(RecipeListViewController: self)
        
        tableView.register(UINib(nibName: "SearchRecipeTableViewCell", bundle: nil),
                           forCellReuseIdentifier: SearchRecipesTableViewCellImplementation.defaultReuseIdentifier)
        
        let cellId = SearchRecipesTableViewCellImplementation.defaultReuseIdentifier
        let cellType = SearchRecipesTableViewCellImplementation.self
        viewModel.outputs.tableContent
            .drive(tableView.rx.items(cellIdentifier: cellId, cellType: cellType )) { _, viewModel, cell in
                cell.bind(viewModel: viewModel)
            }
            .disposed(by: bag)
        
        viewModel.outputs.isLoading
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: bag)
        
        viewModel.outputs.errors
            .drive(onNext: { [unowned self] error in
                // For simplicity's sake of demo purpose, a localizedDescription message is shown
                self.showError(withMessage: error.localizedDescription)
            }).disposed(by: bag)
        
        viewModel.outputs.selectedRecipe
            .drive()
            .disposed(by: bag)
        
        viewModel.inputs.viewLoaded()
    }
    
    @objc func setText() {
        self.title = "RecipeListViewControllerTitle".localized()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.inputs.recipeChanged(recipe: searchText)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.inputs.rowSelected(row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.outputs.height(forRow: indexPath.row)
    }
}
