//
//  ListDataCell.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import UIKit
import SDWebImage

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
        guard let movieImageUrl = viewModel.backdropPath else {
            return
        }
        let imageUrl = "https://image.tmdb.org/t/p/w533_and_h300_bestv2/\(movieImageUrl)"
        movieImageView.sd_setImage(with: URL(string: imageUrl))
        movieImageView.layer.cornerRadius = 15
    }

}
