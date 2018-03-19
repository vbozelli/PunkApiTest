//
//  BeersTableViewController.swift
//  PunkApiTest
//
//  Created by Victor Bozelli Alvarez on 19/03/2018.
//  Copyright © 2018 Victor Bozelli Alvarez. All rights reserved.
//

import AlamofireImage
import MBProgressHUD

final class BeersTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet fileprivate weak var beersTableView: UITableView!
    fileprivate var finished = false
    fileprivate var page = 1
    fileprivate var beers: [Beer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beersTableView.tableFooterView = UIView()
        let progressHud = MBProgressHUD.showAdded(to: view, animated: true)
        progressHud.label.text = "Loading..."
        progressHud.detailsLabel.text = "Loading beers. Please wait..."
        BeersApi.fetchBeers(page: page) { (error, beers) in
            progressHud.hide(animated: true)
            if let error = error {
                let alertController = UIAlertController(title: "Atention", message: error, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true)
            }
            else if let beers = beers {
                self.beers = beers
                self.beersTableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let beers = beers {
            return beers.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let beers = beers {
            let beer = beers[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell", for: indexPath) as! BeerTableViewCell
            cell.configureCell(beer: beer)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let beers = beers, !finished, indexPath.row == beers.count - 1 {
            page += 1
            let progressHud = MBProgressHUD.showAdded(to: view, animated: true)
            progressHud.label.text = "Loading..."
            progressHud.detailsLabel.text = "Loading beers. Please wait..."
            BeersApi.fetchBeers(page: page) { (error, beers) in
                progressHud.hide(animated: true)
                if let beers = beers, beers.count > 0 {
                    self.beers?.append(contentsOf: beers)
                    self.beersTableView.reloadData()
                    self.beersTableView.scrollToRow(at: indexPath, at: .top, animated: true)
                }
                else {
                    //API won't return more beers
                    self.finished = true
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let beers = beers, let beerDetailViewController = storyboard?.instantiateViewController(withIdentifier: "BeerDetailViewController") as? BeerDetailViewController {
            beerDetailViewController.beer = beers[indexPath.row]
            self.navigationController?.pushViewController(beerDetailViewController, animated: true)
        }
    }
}
