//
//  ListScreenViewController.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import UIKit

protocol ListScreenDisplayLogic: AnyObject {
    
}

final class ListScreenViewController: UIViewController {
    
    var interactor: ListScreenBusinessLogic?
    var router: (ListScreenRoutingLogic & ListScreenDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ListScreenInteractor()
        let presenter = ListScreenPresenter()
        let router = ListScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension ListScreenViewController: ListScreenDisplayLogic {
    
}
