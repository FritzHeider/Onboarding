//
//  FavoriteBoxes.swift
//  Onboarding
//
//  Created by Fritz Heider on 5/15/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

struct FavoriteBoxes: Section {
    let numberOfItems = 3
    let images = [
    "Img5",
    "Img6",
    "Img7",
    "Img8",
    "Img9",
    ]
    let textPlace = [
    "Hospitals",
    "IMGO",
    "Antibodies",
    "Vaccines",
    "Hoslistic",
    ]
    
    func layoutSection() -> NSCollectionLayoutSection? {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.35))

        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCell.identifier, for: indexPath) as! FavoriteCell
        cell.imageView.image = UIImage(named: images[indexPath.row])
        cell.favoritesCell .text = textPlace[indexPath.row]
        return cell
    }
}
