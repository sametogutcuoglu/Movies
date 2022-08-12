//
//  ListScreenRouter.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation
import UIKit

protocol ListScreenRoutingLogic: AnyObject {
    func routerToOfficeDetail(index: Int)
}

protocol ListScreenDataPassing: AnyObject {
    var dataStore: ListScreenDataStore? { get }
}

final class ListScreenRouter: ListScreenRoutingLogic, ListScreenDataPassing {
    
    weak var viewController: ListScreenViewController?
    var dataStore: ListScreenDataStore?
    
    func routerToOfficeDetail(index: Int) {
        let storyboard = UIStoryboard(name: "DetailScreen", bundle: nil)
        let detailVC : DetailScreenViewController = storyboard.instantiateViewController(identifier: "DetailScreen")
        detailVC.router?.dataStore?.movie = dataStore?.movie?.results[index]
        self.viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
