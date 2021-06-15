//
//  WorkOutTableViewCell.swift
//  Sport timer
//
//  Created by Евгений Петренко on 14.06.2021.
//

import UIKit

class WorkOutTableViewCell: UITableViewCell {

    @IBOutlet weak var workOutTitleLabel: UILabel!
    @IBOutlet weak var workOutDurationLabel: UILabel!
    @IBOutlet weak var restDurationLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
