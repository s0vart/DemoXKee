//
//  ViewController.swift
//  DemoApp
//
//  Created by Mark Nevmerzhitskiy on 18.04.2023.
//

import UIKit

class MainController: UIViewController {
    
    //MARK: Properties
    
    let idCell = "cell"
    
    
    //MARK: Actions
    
    
    //MARK: Outlets
    
    @IBOutlet weak var AppNameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var visitorsTableView: UITableView!
    @IBOutlet weak var devicesColletcionView: UICollectionView!
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorsTableView.dataSource = self
        devicesColletcionView.dataSource = self
        devicesColletcionView.delegate = self
        devicesColletcionView.layer.cornerRadius = 5
        devicesColletcionView.clipsToBounds = true
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: idCell)
        cell.textLabel?.text = "Sergei Orlov"
        cell.detailTextLabel?.text = Date().formatted(date: .numeric, time: .shortened)
        return cell
    }
}

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = devicesColletcionView.dequeueReusableCell(withReuseIdentifier: "devices", for: indexPath) as! DevicesCollectionViewCell
        cell.configure(name: "Puskina 18", image: "🏠")
        return cell
    }
    
    
}

