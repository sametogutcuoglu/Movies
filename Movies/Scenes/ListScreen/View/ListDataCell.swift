//
//  ListDataCell.swift
//  Movies
//
//  Created by samet ogutcuoglu on 11.08.2022.
//

import UIKit
import SDWebImage

class ListDataCell: UICollectionViewCell {
    
    static let Id = "ListDataCell"

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    func configure(viewModel : ListScreen.Fetch.ViewModel.Movie?) {
        
        dateLabel.text = viewModel?.releaseDate
        titleLabel.text = viewModel?.title
        subTitleLabel.text = viewModel?.overview
        
        guard let movieImageUrl = viewModel?.backdropPath else {
            return
        }
        
        let imageUrl = AppConstants.getMovieImageUrl+(movieImageUrl)
        movieImageView.sd_setImage(with: URL(string: imageUrl))
        movieImageView.layer.cornerRadius = 10
    }

}
