//
//  DetailVC.swift
//  HedgehogTechTest
//
//  Created by Филяев Илья on 07.11.2021.
//

import UIKit
import SDWebImage

class DetailVC: UIViewController {
    
    var collectionId = Int()
    let networkServie = NetworkService()
    var array = [Album]()
    let business = Business()
    public var indicator = UIActivityIndicatorView()

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var artworkUrl100: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var artistName: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator()
        indicator.startAnimating()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        networkServie.getData(url: "https://itunes.apple.com/lookup?id=\(collectionId)&entity=song") { (albums:Albums) in
            self.array.insert(contentsOf: albums.results, at: 0)
            self.array.removeFirst()
            DispatchQueue.main.async {
                self.collectionName.text = self.array[0].collectionName
                self.artworkUrl100.sd_setImage(with: URL(string: self.array[0].artworkUrl100!), completed: nil)
                self.artistName.text = self.array[0].artistName
                self.releaseDate.text = self.business.setDateFormat(date: self.array[0].releaseDate)
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Activity indicator
    
    private func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.medium
        indicator.center = self.view.center
        view.addSubview(indicator)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        indicator.stopAnimating()
    }
}


