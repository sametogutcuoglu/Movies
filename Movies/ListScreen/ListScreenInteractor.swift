//
//  ListScreenInteractor.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenBusinessLogic: AnyObject {
    func getMovies()
}

protocol ListScreenDataStore: AnyObject {
    var movie: Movies? { get }
}

final class ListScreenInteractor: ListScreenBusinessLogic, ListScreenDataStore { 
    var movie: Movies?

    var presenter: ListScreenPresentationLogic?
    var worker: ListScreenWorkingLogic = ListScreenWorker()
    
    func getMovies() {
        worker.getMovies { response in
            switch response {
            case .success(let data):
                self.movie = data
                let response = ListScreen.Fetch.Response(movies: data)
                self.presenter?.presentOffices(response: response)
            case .failure(let error):
                print(error)
                self.presenter?.Alert(AlertMessage: "Hata oluştu !  \(error)")
            }
        }
    }
    
}
