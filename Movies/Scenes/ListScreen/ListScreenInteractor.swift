//
//  ListScreenInteractor.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import Foundation

protocol ListScreenBusinessLogic: AnyObject {
    func getMovies()
    func getNowplayingMovies()
}

protocol ListScreenDataStore: AnyObject {

}

final class ListScreenInteractor: ListScreenBusinessLogic, ListScreenDataStore {
    
    var presenter: ListScreenPresentationLogic?
    var worker: ListScreenWorkingLogic = ListScreenWorker()
    
    func getMovies() {
        worker.getMovies { response in
            switch response {
            case .success(let data):
                let response = ListScreen.Fetch.Response(movies: data)
                self.presenter?.presentMovies(response: response)
            case .failure(let error):
                self.presenter?.alert(AlertMessage: AppConstants.error + (error.localizedDescription))
            }
        }
    }
    
    func getNowplayingMovies() {
        worker.getNowPlaying { response in
            switch response {
            case .success(let data):
                let response = ListScreen.Fetch.Response.init(nowPlaying: data)
                self.presenter?.presentNowPlaying(response: response)
            case .failure(let error):
                print(error)
                self.presenter?.alert(AlertMessage: AppConstants.error + (error.localizedDescription))
            }
        }
    }
}
