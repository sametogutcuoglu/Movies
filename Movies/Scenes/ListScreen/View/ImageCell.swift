//
//  ImageCell.swift
//  Movies
//
//  Created by samet ogutcuoglu on 12.08.2022.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static let Id = "ImageCell"
    
    @IBOutlet weak var nowPlayingmovieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieInfoLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    func configure(viewModel:ListScreen.Fetch.ViewModel.Nowplaying,pageNumber : Int,selectPage: Int) {
        pageControl.numberOfPages = pageNumber
        pageControl.currentPage = selectPage
        movieTitleLabel.text = viewModel.originalTitle
        movieInfoLabel.text = viewModel.overview
        let imageUrl = AppConstants.getMovieImageUrl+(viewModel.posterPath)
        nowPlayingmovieImageView.sd_setImage(with: URL(string: imageUrl))
    }
}
