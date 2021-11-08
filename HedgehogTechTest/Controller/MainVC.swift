//
//  ViewController.swift
//  HedgehogTechTest
//
//  Created by Филяев Илья on 05.11.2021.
//

import UIKit
import SDWebImage

class MainVC: UIViewController {
    
    let business = Business()
    let networkService = NetworkService()
    var indicator = UIActivityIndicatorView()
    var array = [Album]()
    var timer = Timer()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        searchBar.delegate = self
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    // MARK: - Activity indicator
    
    public func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.style = UIActivityIndicatorView.Style.medium
        indicator.center = self.view.center
        view.addSubview(indicator)
    }
}





