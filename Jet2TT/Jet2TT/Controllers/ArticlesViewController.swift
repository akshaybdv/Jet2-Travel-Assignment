//
//  ViewController.swift
//  Jet2TT
//
//  Created by Badve, Akshay on 6/21/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import UIKit

class ArticlesViewController: BaseViewController {

    @IBOutlet weak var articleTableView: UITableView!
    // In MVVM architecture, controller will have instance of view model
    var articlesViewModel: ArticlesViewModel = ArticlesViewModel()
    var currPage = 1
    let defaultPageSize = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performInitialSetupWhileLoadingView()
        articlesViewModel.fetchArticles()
    }
    
    /// Function to perform or setup initial settings
    func performInitialSetupWhileLoadingView() {
        articlesViewModel.articlesViewController = self
        articleTableView.rowHeight = UITableView.automaticDimension
        articleTableView.estimatedRowHeight = 100
    }
}

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesViewModel.articleObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.articleTableViewCell, for: indexPath) as! ArticleTableViewCell
        cell.setArticlesOnCellAt(indexPath: indexPath, articleObjects: articlesViewModel.articleObjects)
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let fetchNextPage = (self.currPage * defaultPageSize) - 1 == indexPath.row
        if fetchNextPage == true {
            self.currPage = self.currPage + 1
            // Request presenter to fetch data
            articlesViewModel.fetchArticles(atPage: currPage)
        }
    }
}




