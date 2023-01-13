//
//  StockViewController.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 01/12/2022.
//

import Foundation
import UIKit

final class StockViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Internal properties
    
    var tableView = UITableView()
    
    // MARK: - Private properties
    
    private let ingredients = [
        "Tomatoes",
        "Bread",
        "Mozarella"
    ]
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stock"
        view.backgroundColor = .systemOrange
        
        setup()
    }
    
    // MARK: - UITableViewDataSource
    // This section is used to describe how to use the fetched data
    
    // cellForRowAt is used to determine what data should be shown in the cell of each row (which is used as indexPath.row)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = ingredients[indexPath.row]
        return cell
    }
    
    // numberOfRowsInSection is used to supply how many rows there are.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    // MARK: - UITableViewDelegate
    // This section is used for callback methods for user interactions.
    
    // didSelectRowAt is called whenever the user taps on a cell of the tableView.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - Private methods
    
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        // UITableView.delegate is used for callback actions like tapping or swiping.
        tableView.delegate = self
        
        // UITableView.dataSource is used to get, update and set data for the tableview
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
