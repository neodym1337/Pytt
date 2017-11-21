//
//  SearchReceipesViewModel.swift
//  Pytt
//
//  Created by Dmitry Orlov on 11/14/17.
//  Copyright © 2017 Johan Hosk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchRecipesViewModelType {
    var outputs: SearchRecipesViewModelOutput { get }
    var inputs: SearchRecipesViewModelInput { get }
}

protocol SearchRecipesViewModelInput {
    func viewLoaded()
    func recipeChanged(recipe: String)
    func rowSelected(row: Int)
}

protocol SearchRecipesViewModelOutput {
    var tableContent: Driver<[SearchRecipesCellViewModel]> { get }
    var selectedRecipe: Driver<Recipe> { get }
    var errors: Driver<Error> { get }
    var isLoading: Driver<Bool> { get }
    func height(forRow row: Int) -> CGFloat
}

private let defaultSearchCriteria = "chicken"

class SearchRecipesViewModel: SearchRecipesViewModelType, SearchRecipesViewModelInput, SearchRecipesViewModelOutput {
    
    var outputs: SearchRecipesViewModelOutput { return self }
    var inputs: SearchRecipesViewModelInput { return self }
    
    init(useCase: RecipeListUseCase, router: SearchRecipesRouter) {
        let activityIndicator = ActivityIndicator()
        isLoading = activityIndicator.asDriver()
        
        let errorTracker = ErrorTracker()
        errors = errorTracker.asDriver()
        
        let searchTrigger = Observable
            .merge(viewLoadedSubject.map { defaultSearchCriteria }, recipeChangedSubject)
            .asDriverOnErrorJustComplete()
        
        let recipes = searchTrigger
            .throttle(1)
            .distinctUntilChanged()            
            .flatMapLatest { searchInput in
                useCase.fetchRecipes(ingerdients: searchInput)
                    .trackError(errorTracker)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }

        tableContent = recipes.map { $0.map { SearchRecipesCellViewModel(recipe: $0) } }
        
        selectedRecipe = rowSelectedSubject.asDriverOnErrorJustComplete()
            .withLatestFrom(recipes) { (row, recipes) in
                return recipes[row]
            }
            .do(onNext: router.presentDetailsView)
    }
    
    // Outputs
    
    let tableContent: Driver<[SearchRecipesCellViewModel]>
    let selectedRecipe: Driver<Recipe>
    let isLoading: Driver<Bool>
    let errors: Driver<Error>
    
    func height(forRow row: Int) -> CGFloat {
        return 100
    }
    
    // Inputs
    
    private let viewLoadedSubject = PublishSubject<Void>()
    func viewLoaded() {
        viewLoadedSubject.onNext()
    }
    
    private let recipeChangedSubject = PublishSubject<String>()
    func recipeChanged(recipe: String) {
        recipeChangedSubject.onNext(recipe)
    }
    
    private let rowSelectedSubject = PublishSubject<Int>()
    func rowSelected(row: Int) {
        rowSelectedSubject.onNext(row)
    }
}
