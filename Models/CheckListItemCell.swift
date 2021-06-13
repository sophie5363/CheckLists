//
//  CheckListItemCell.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 13/06/2021.
//

import UIKit

class CheckListItemCell: UITableViewCell {
    
    //MARK: - IBOUTLETS

    @IBOutlet weak var labelCheckMark: UILabel!
    @IBOutlet weak var labelCellText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
