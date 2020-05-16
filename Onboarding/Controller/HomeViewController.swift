//
//  HomeViewController.swift
//  Onboarding
//
//  Created by Fritz Heider on 5/15/20.
//  Copyright © 2020 Make School. All rights reserved.
//
import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    
    var collectionView: UICollectionView!
    
    lazy var sections: [Section] = [
        TitleSection(title: "Featured Solutions"),
        FeaturedBoxes(),
        TitleSection(title: "Last Month's Demographics"),
        FavoriteBoxes()
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    func setupViews() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.purple
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
        collectionView.register(UINib(nibName: "FeaturedCell", bundle: .main), forCellWithReuseIdentifier: FeaturedCell.identifier)
        collectionView.register(UINib(nibName: "FavoriteCell", bundle: .main), forCellWithReuseIdentifier: FavoriteCell.identifier)
        self.view.addSubview(collectionView)
        collectionView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.view.backgroundColor = UIColor.purple
        navigationItem.title = "Pandemic"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.reloadData()
    }
    
    
}

extension HomeViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let favoriteSection = FavoriteBoxes()
        let featuredSection = FeaturedBoxes()
        
        var count = 0
        // A new case is excuted every time a new section is created, in this case it's 4.
        switch section {
        case 0:
            count = 1
        case 1:
            count = featuredSection.images.count
        case 2:
            count = 1
        case 3:
            count = favoriteSection.images.count
        default:
            count = sections[section].numberOfItems
            break
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
        
    }
}
