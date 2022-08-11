//
//  ListScreenRouter.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenRoutingLogic: AnyObject {
    
}

protocol ListScreenDataPassing: class {
    var dataStore: ListScreenDataStore? { get }
}

final class ListScreenRouter: ListScreenRoutingLogic, ListScreenDataPassing {
    
    weak var viewController: ListScreenViewController?
    var dataStore: ListScreenDataStore?
    
}
