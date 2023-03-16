//
//  IngredientCell.swift
//  RefridgeApp
//
//  Created by Syakur, Y. (Yusuf) on 04/01/2023.
//

import Foundation
import UIKit

final class StockTableViewCell: UITableViewCell {
    
    // MARK: - Internal properties
    
    enum Constants {
        static let identifier = "INGREDIENT_CELL_IDENTIFIER"
        static let rowHeight: CGFloat = 100
        static let seperatorColor: UIColor = .systemGray2
        static let seperatorWidth: CGFloat = 4
        static let seperatorHeight: CGFloat = 68
        static let editImageColor: UIColor = .systemOrange
    }
    
    // MARK: - Private properties
    
    private let nameStackView = UIStackView()
    var nameLabel = UILabel()
    var unitLabel = UILabel()
    private let seperatorlineView = UIView()
    private let editImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StockTableViewCell {
    private func setup() {
        seperatorlineView.translatesAutoresizingMaskIntoConstraints = false
        seperatorlineView.backgroundColor = Constants.seperatorColor
        
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.axis = .vertical
        nameStackView.spacing = 0
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "Ingredient name"
        
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        unitLabel.adjustsFontForContentSizeCategory = true
        unitLabel.text = "Amount in units"
        
        editImageView.translatesAutoresizingMaskIntoConstraints = false
        let largeConfig = UIImage.SymbolConfiguration(scale: .large)
        if let editImage = UIImage(systemName: "plus.forwardslash.minus", withConfiguration: largeConfig)?
                            .withTintColor(Constants.editImageColor, renderingMode: .alwaysOriginal) {
            editImageView.image = editImage
        }
        
        // It is important to add to `contentView` instead of the UIView itself. This is the content of a cell
        contentView.addSubview(seperatorlineView)
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(unitLabel)
        contentView.addSubview(nameStackView)
        contentView.addSubview(editImageView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            seperatorlineView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            seperatorlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            seperatorlineView.heightAnchor.constraint(equalToConstant: Constants.seperatorHeight),
            seperatorlineView.widthAnchor.constraint(equalToConstant: Constants.seperatorWidth),
            seperatorlineView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameStackView.leadingAnchor.constraint(equalTo: seperatorlineView.trailingAnchor, constant: 8),
            nameStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            editImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            editImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
