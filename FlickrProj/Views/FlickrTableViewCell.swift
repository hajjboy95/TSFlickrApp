//
//  FlickrTableViewCell.swift
//  FlickrProj
//
//  Created by Ismail El-habbash on 3/18/16.
//  Copyright © 2016 Ismail El-Habbash. All rights reserved.
//

import UIKit

class FlickrTableViewCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeTakenLabel: UILabel!
    
    
    var cellInfo:Flickr? {
        didSet{
            
            titleLabel.text = cellInfo!.title
            descriptionLabel.text = cellInfo!.desription
            timeTakenLabel.text = cellInfo!.date_taken
        }
    }
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
