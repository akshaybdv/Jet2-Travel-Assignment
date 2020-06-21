//
//  ArticlesViewModel.swift
//  Jet2TT
//
//  Created by Badve, Akshay on 6/21/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import UIKit

class ArticlesViewModel: NSObject {
    
    // weak declaration to avoid retain cycle
    weak var articlesViewController: ArticlesViewController?
    var articleObjects: [Article] = []
    
    
    /// Function to call fetch api from model file
    /// - Parameter page: page number
    func fetchArticles(atPage page:Int = 1) {
        if page == 1 {
            articleObjects.removeAll()
        }
        articlesViewController?.view.showBlurLoader()
        ServerManager.sharedInstance.getArticleListFromServer(pageCount: page) { (articles, error) in
            if error != nil {
                DispatchQueue.main.async {
                    self.articlesViewController?.view.removeBluerLoader()
                    self.articlesViewController?.showAlert(withTitle: Constants.Alerts.alert, withMessage: Constants.Alerts.errorMessage)
                }
            }
            else {
                if let articles = articles {
                    if articles.count == 0 {
                        self.articlesViewController?.showAlert(withTitle: Constants.Alerts.alert, withMessage: Constants.Alerts.allDataLoaded)
                    }
                    DispatchQueue.main.async {
                        self.articleObjects.append(contentsOf: articles)
                        self.articlesViewController?.articleTableView.reloadData()
                        self.articlesViewController?.view.removeBluerLoader()

                    }
                }
            }
        }
    }
    
}
