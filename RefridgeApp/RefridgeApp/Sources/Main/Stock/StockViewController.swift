//
//  StockViewController.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 01/12/2022.
//

import Foundation
import UIKit

final class StockViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let ingredients = [
        "Tomatoes",
        "Bread",
        "Mozarella"
    ]
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stock"
        view.backgroundColor = .systemOrange
        
        setup()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        // UITableView.delegate is used for callback actions like tapping or swiping.
        tableView.delegate = self
        
        // UITableView.dataSource is used to get, update and set data for the tableview
        tableView.dataSource = self
        
        // Register cells to populate the tableview
        tableView.register(StockTableViewCell.self, forCellReuseIdentifier: StockTableViewCell.Constants.identifier)
        tableView.rowHeight = StockTableViewCell.Constants.rowHeight
        
        // Define the footer part of the tableview.
        tableView.tableFooterView = UIView()
        
        // Place the tableView itself within this UIViewController
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
    
// MARK: - UITableViewDataSource
// This section is used to describe how to use the fetched data

// cellForRowAt is used to determine what data should be shown in the cell of each row (which is used as indexPath.row)
// numberOfRowsInSection is used to supply how many rows there are.
extension StockViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: StockTableViewCell.Constants.identifier, for: indexPath) as? StockTableViewCell {
            return cell
        } else {
            // Default value if IngredientCell is not dequeued
            let cell = StockTableViewCell(style: .default, reuseIdentifier: StockTableViewCell.Constants.identifier)
            cell.textLabel?.text = "Data not found!"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
}

// MARK: - UITableViewDelegate
// This section is used for callback methods for user interactions.

// didSelectRowAt is called whenever the user taps on a cell of the tableView.
extension StockViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
