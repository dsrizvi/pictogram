//
//  ImageCell.swift
//  InstagramParse
//
//  Created by Danyal Rizvi on 2/28/16.
//  Copyright © 2016 dsrizvi. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
	
	
	@IBOutlet weak var instagramImageView: UIImageView!
	@IBOutlet weak var captionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
