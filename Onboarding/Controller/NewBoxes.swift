//
//  NewBoxesViewController.swift
//  Onboarding
//
//  Created by Fritz Heider on 5/15/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class NewBoxesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    lazy var collectionView: UICollectionView = {
        let lv = LayoutView()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: lv)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .purple
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "NewBoxesCell", bundle: nil), forCellWithReuseIdentifier: "NewBoxesCell")
        return collectionView
    }()
    
    let data: [NewBox] = [NewBox(image: #imageLiteral(resourceName: "img3-1"), name: "Viral"),
                          NewBox(image: #imageLiteral(resourceName: "img1-1"), name: "Flow"),
                          NewBox(image: #imageLiteral(resourceName: "Img17"), name: "Testing"),
                          NewBox(image: #imageLiteral(resourceName: "Img8"), name: "Checkups"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        navigationItem.title = "Pandemic Alerts"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewBoxesCell", for: indexPath) as! NewBoxesCell
        cell.setUp(with: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: NewBoxesCell = collectionView.cellForItem(at: indexPath) as! NewBoxesCell
        cell.backgroundColor = .yellow
    }

}


