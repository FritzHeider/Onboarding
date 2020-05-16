//
//  FeaturedBoxes.swift
//  Onboarding
//
//  Created by Fritz Heider on 5/15/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import Foundation
import UIKit

struct FeaturedBoxes: Section {
    let numberOfItems = 10
    let images = [
    "Img10",
    "Img11",
    "Img12",
    "Img13",
    "Img14",
    "Img15",
    "Img16",
    "Img17",
    "Img18",
    "Img19",
    ]
    let textPlace = [
    "Government subsidies",
    "Local Programs",
    "Community Drivea",
    "Social distancing",
    "Shelter in PKLace",
    "Compassion",
    "The New Normal",
    "Friends",
    "Social networking",
    "Facetime",
    ]
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.identifier, for: indexPath) as! FeaturedCell
        cell.imageView.image = UIImage(named: images[indexPath.row])
        cell.textLabel.text = textPlace[indexPath.row]
        return cell
    }
    
}
