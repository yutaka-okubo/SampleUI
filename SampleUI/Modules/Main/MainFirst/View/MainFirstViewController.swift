//
//  MainFirstViewController.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/14.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit

// Protcol that defines the view input methods
protocol MainFirstViewInterface: class {
    func showCarouselData(carousels: [Carousel])
    func showNoContentScreen()
}

class MainFirstViewController: UIViewController {

    private var carousels: [Carousel] = [Carousel]()
    var presenter: MainFirstPresentation!

    @IBOutlet private weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Build Success")
        self.configView()
        self.initializePullToRefresh()
        
        presenter.viewDidLoad()
    }

    private func configView() {
        self.navigationItem.title = "探す"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Pull to Refresh
    private func initializePullToRefresh() {
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(onPullToRefresh(_:)), for: .valueChanged)
    }
    
    @objc private func onPullToRefresh(_ sender: AnyObject) {
        refresh()
    }
    
    // MARK: - Data Flow
    private func refresh() {
        DispatchQueue.global().async {
            self.presenter.refreshTable()
            DispatchQueue.main.async {
                if self.refreshControl.isRefreshing {
                    self.refreshControl.endRefreshing()
                }
            }
        }
    }
}

// MARK:- UITableViewDataSource
// MARK:- UITableViewDelegate
extension MainFirstViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carousels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.indentifier, for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        let carousel = carousels[indexPath.row]
        cell.updateData(carousel: carousel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Todo: Mode detail screen
    }
}



// MARK:- ViewInterface
extension MainFirstViewController: MainFirstViewInterface {
    func showCarouselData(carousels: [Carousel]) {
        DispatchQueue.main.async {
            self.carousels = carousels
            self.tableView.reloadData()
        }
    }

    func showNoContentScreen() {
        print("Show table view placeholder")
    }

    func showActivityIndicator() {
        /// Show indicator
        print("Show indicator")
    }

    func hideActivityIndicator() {
        print("Hiden indicator")
    }
}
