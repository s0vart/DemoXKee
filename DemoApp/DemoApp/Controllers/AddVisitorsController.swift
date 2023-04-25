//
//  AddVisitorsController.swift
//  DemoApp
//
//  Created by Mark Nevmerzhitskiy on 22.04.2023.
//

import UIKit
import FSCalendar

class AddVisitorsController: UIViewController {
    
    //MARK: Open Properties
    
    var calendarHeightConstaraint: NSLayoutConstraint!
    
    let showHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open calendar", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Private Properties
    
    private var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    //MARK: Actions
    
    
    
    //MARK: Outlets
    
    @IBOutlet weak var visitorsFirstName: UITextField!
    
    @IBOutlet weak var visitorsLastName: UITextField!
    
    @IBOutlet weak var changeDevice: UITextField!
    
    @IBOutlet weak var visitorsPassword: UITextField!
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        
        calendar.delegate = self
        calendar.dataSource = self
        
        showHideButton.addTarget(self, action: #selector(showHideButtonTapped), for: .touchUpInside)
        
        calendar.scope = .week
    }
    
    //MARK: OBJC Methods
    
    @objc func showHideButtonTapped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHideButton.setTitle("Close calendar", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            showHideButton.setTitle("Open calendar", for: .normal)
        }
    }
    
}

extension AddVisitorsController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstaraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
}

extension AddVisitorsController {
    
    func setConstraints() {
        
        view.addSubview(calendar)
        
        calendarHeightConstaraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeightConstaraint)
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: visitorsPassword.topAnchor, constant: 50),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        view.addSubview(showHideButton)
        NSLayoutConstraint.activate([
            showHideButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
            showHideButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            showHideButton.widthAnchor.constraint(equalToConstant: 100),
            showHideButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
