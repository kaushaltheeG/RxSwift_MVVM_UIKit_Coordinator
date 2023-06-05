//
//  ViewController.swift
//  MVVmRxSwiftUiKit
//
//  Created by Kaushal Kumbagowdana on 6/2/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: RestaurantListViewModel! // ! need to be forced unwrapped or will crash app everytime it opens
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: RestaurantListViewModel) -> ViewController {
        // method that allows us to create a controller from the story board
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        navigationItem.title = viewModel.title
        
        viewModel.fetchRestaurantViewModels()
            .observe(on: MainScheduler.instance) // schedular dispatching view operations on the main thread
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }
            .disposed(by: disposeBag)
        
    }


}

