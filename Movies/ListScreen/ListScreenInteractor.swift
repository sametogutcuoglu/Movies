//
//  ListScreenInteractor.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenBusinessLogic: AnyObject {
    
}

protocol ListScreenDataStore: AnyObject {
    
}

final class ListScreenInteractor: ListScreenBusinessLogic, ListScreenDataStore {
    
    var presenter: ListScreenPresentationLogic?
    var worker: ListScreenWorkingLogic = ListScreenWorker()
    
}
