//
//  DetailEx.swift
//  HedgehogTechTest
//
//  Created by Филяев Илья on 08.11.2021.
//

import UIKit

//MARK: - CollectionViewDataSourse

extension DetailVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        cell.trackName.text = array[indexPath.row].trackName
        cell.artworkUrl100.sd_setImage(with: URL(string: array[indexPath.row].artworkUrl100 ?? "https://img1.freepng.ru/20180621/zso/kisspng-business-click-ecommerce-web-agency-service-plas-no-photo-5b2c4658462e10.8823241115296282482875.jpg"), completed: nil)
        cell.country.text = array[indexPath.row].country
        return cell
    }
}

//MARK: - CollectionViewDelegate

extension DetailVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath)
        print(indexPath)
    }
}

//MARK: - Set Layout of cell
extension DetailVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width-5, height: 128)
    }
}


