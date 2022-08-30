//
//  CalendarListController.swift
//  cat-calendar
//
//  Created by Eugene Lu on 2022-08-23.
//

import UIKit

class CalendarListViewController: UITableViewController {
    /// Represents the possible sections in the table view.
    enum Section {
        case main
    }
    
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, CalendarListItem>
    
    // MARK: Private Properties
    private let calendarListTableViewCellIdentifier = "CalendarListTableViewCellIdentifier"
    private var calendarListViewModel = CalendarListViewModel(currentDate: Date(), catImageService: CatImageService())
    private var calendarListItems: [CalendarListItem] = []
    private lazy var dataSource = makeDataSource()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Cutest Cat Calendar"
        
        tableView.insetsContentViewsToSafeArea = true
        tableView.register(CalendarListTableViewCell.self, forCellReuseIdentifier: calendarListTableViewCellIdentifier)
        
        setupViews()
        setupConstraints()
        populateCalendarItems()
    }
}

// MARK: Private Functions
private extension CalendarListViewController {
    func setupViews() {
        view.addSubview(spinner)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    func populateCalendarItems() {
        Task {
            do {
                spinner.startAnimating()
                
                calendarListItems = try await calendarListViewModel.getCalendarListItems()
                applySnapshot(animatingDifferences: false)

                spinner.stopAnimating()
            }
            catch {
                showAlert(alertTitle: "Calendar List Error", alertMessage: "Failed to populate calendar list")
                spinner.stopAnimating()
            }
        }
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(calendarListItems)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

    func makeDataSource() -> UITableViewDiffableDataSource<Section, CalendarListItem> {
        UITableViewDiffableDataSource<Section, CalendarListItem>(tableView: tableView) { tableView, indexPath, calendarListItem in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.calendarListTableViewCellIdentifier, for: indexPath) as? CalendarListTableViewCell
            cell?.calendarListItemViewModel = CalendarListItemViewModel(calendarListItem: calendarListItem)
            
            return cell
        }
    }
}

