//
//  CalendarListTableViewCell.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-23.
//

import UIKit

class CalendarListTableViewCell: UITableViewCell {
    // MARK: Public Properties
    var calendarListItemViewModel: CalendarListItemViewModel! {
        didSet {
            dateLabel.text = calendarListItemViewModel.dateText
            todayLabel.isHidden = calendarListItemViewModel.isTodayLabelHidden
            backgroundImageView.image = calendarListItemViewModel.calendarListItem.catImage
        }
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, todayLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "TODAY"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    
    // MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Functions
private extension CalendarListTableViewCell {
    func setupViews() {
        addSubview(backgroundImageView)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
                                     backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                                     stackView.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
}
