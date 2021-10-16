//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Sanskar Atrey on 16/10/21.
//

import UIKit

class TableViewCell: UITableViewCell {

   
   
    
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
