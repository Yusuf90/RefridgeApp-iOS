//
//  StockViewController.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 01/12/2022.
//

import Foundation
import UIKit
import Combine

final class StockViewController: UIViewController {
    
    // MARK: - Internal properties
    
    var tableView = UITableView()
    
    // MARK: - Private properties
    
    private let stockViewModel: StockTableViewModel
    private let defaultCell: StockTableViewCell = {
        let defaultCell = StockTableViewCell(style: .default, reuseIdentifier: StockTableViewCell.Constants.identifier)
        defaultCell.textLabel?.text = "Data not found!"
        return defaultCell
    }()
    
    // TODO: What is a Cancellable?
    private var cancellables = Set<AnyCancellable>()
    
    init(stockViewModel: StockTableViewModel) {
        self.stockViewModel = stockViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Private methods
    
    private func setup() {
        title = "Stock"
        view.backgroundColor = .systemOrange
        
        // TODO: What does this code snippet do exactly?
        stockViewModel.$state
            .sink { [weak self] state in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        
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
// numberOfRowsInSection is used to supply how many rows there are in a certain section
// numberOfSections is used to supply how many sections there are in total.
extension StockViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Check if cell thats dequeued is a StockTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockTableViewCell.Constants.identifier, for: indexPath) as? StockTableViewCell else {
            return self.defaultCell
        }
        
        // Check if state of the viewModel has data
        guard case StockTableViewModel.State.data(let data) = stockViewModel.state else {
            // Should define other use cases here (loading, empty, etc)
            return self.defaultCell
        }
        
        cell.nameLabel.text = data[indexPath.row].name
        cell.unitLabel.text = data[indexPath.row].unit.rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard case .data(let data) = stockViewModel.state else { return 0 }
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

// MARK: - UITableViewDelegate
// This section is used for callback methods for user interactions.

// didSelectRowAt is called whenever the user taps on a cell of the tableView.
extension StockViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
