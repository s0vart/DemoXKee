//
//  DevicesCollectionViewCell.swift
//  DemoApp
//
//  Created by Mark Nevmerzhitskiy on 20.04.2023.
//

import UIKit

class DevicesCollectionViewCell: UICollectionViewCell {
    
    static let shared = DevicesCollectionViewCell()
    
    @IBOutlet weak var deviceEmoji: UILabel!
    
    @IBOutlet weak var deviceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(name: String, image: String) {
        deviceName?.text = name
        deviceEmoji?.text = image
    }
}
