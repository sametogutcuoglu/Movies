//
//  ListDataCell.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import UIKit

class ListDataCell: UICollectionViewCell {

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(viewModel : ListScreen.Fetch.ViewModel.Movie) {
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.overview
    }

}
