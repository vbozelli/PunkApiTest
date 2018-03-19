//
//  BeerDetailViewController.swift
//  PunkApiTest
//
//  Created by Victor Bozelli Alvarez on 19/03/2018.
//  Copyright © 2018 Victor Bozelli Alvarez. All rights reserved.
//

import AlamofireImage

final class BeerDetailViewController: UIViewController {
    
    @IBOutlet fileprivate weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var beerImageView: UIImageView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var abvLabel: UILabel!
    @IBOutlet fileprivate weak var taglineLabel: UILabel!
    @IBOutlet fileprivate weak var descriptionTextView: UITextView!
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = beer.name
        nameLabel.text = "Name: " + beer.name
        if let abv = beer.abv {
            abvLabel.text = "ABV: \(abv) %"
        }
        taglineLabel.text = "Tagline: " + beer.tagline
        descriptionTextView.text = beer.description
        descriptionTextView.sizeToFit()
        if let url = URL(string: beer.imageUrl) {
            //cache image
            beerImageView.af_setImage(withURL: url, filter: AspectScaledToFitSizeFilter(size: CGSize(width: 300, height: 225)), imageTransition: .crossDissolve(0.25), runImageTransitionIfCached: true, completion: { (_) in
                self.activityIndicatorView.stopAnimating()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
