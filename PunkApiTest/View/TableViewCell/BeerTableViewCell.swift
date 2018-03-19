//
//  BeerTableViewCell.swift
//  PunkApiTest
//
//  Created by resource on 19/03/2018.
//  Copyright © 2018 Victor Bozelli Alvarez. All rights reserved.
//

import AlamofireImage

final class BeerTableViewCell: UITableViewCell {
    @IBOutlet fileprivate weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var abvLabel: UILabel!
    @IBOutlet fileprivate weak var beerImageView: UIImageView!
    
    func configureCell(beer: Beer) {
        nameLabel.text = "Name: " + beer.name
        if let abv = beer.abv {
            abvLabel.text = "ABV: \(abv) %"
        }
        beerImageView.image = nil
        beerImageView.layer.removeAllAnimations()
        beerImageView.af_cancelImageRequest()
        activityIndicatorView.startAnimating()
        if let url = URL(string: beer.imageUrl) {
            //cache image
            beerImageView.af_setImage(withURL: url, filter: AspectScaledToFitSizeFilter(size: CGSize(width: 40, height: 40)), imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: { (_) in
                self.activityIndicatorView.stopAnimating()
            })
        }
    }
}
