//
//  DetailScreenRouter.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol DetailScreenRoutingLogic: AnyObject {
    
}

protocol DetailScreenDataPassing: AnyObject {
    var dataStore: DetailScreenDataStore? { get }
}

final class DetailScreenRouter: DetailScreenRoutingLogic, DetailScreenDataPassing {
    
    weak var viewController: DetailScreenViewController?
    var dataStore: DetailScreenDataStore?
    
}
