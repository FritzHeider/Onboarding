//
//  HistoryBoxes.swift
//  Onboarding
//
//  Created by Fritz Heider on 5/15/20.
//  Copyright © 2020 Make School. All rights reserved.
//


import UIKit

class HistoryBoxes: UIViewController {
    
    let tableview: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = 80
        return view
    }()
    
    var boxesOfHistory = [Box]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "History"
        setTable()
        getData()
    }
    
    func setTable(){
        view.addSubview(tableview)
        view.backgroundColor = .purple
        
        tableview.register(HistoryCell.self, forCellReuseIdentifier: "HistoryCell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        tableview.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    func getData() {
        let angels = Item(name: "doctors", image: "img1")
        let lakers = Item(name: "Covid", image: "img6")
        let chargers = Item(name: "Flu", image: "Img7")
        let trojans = Item(name: "Hospitals", image: "Img10")
        
        let boxOne = Box(date: "January 2020", items:[angels], image: "box")
        boxesOfHistory.append(boxOne)
        let boxTwo = Box(date: "February 2020", items:[lakers], image: "box")
        boxesOfHistory.append(boxTwo)
        let boxThree = Box(date: "March 2020", items:[chargers], image: "box")
        boxesOfHistory.append(boxThree)
        let boxFour = Box(date: "April 2020", items: [trojans], image: "box")
        boxesOfHistory.append(boxFour)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension HistoryBoxes: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxesOfHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
        cell.setContents(box: boxesOfHistory[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = InsideView()
        viewController.currentBox = boxesOfHistory[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
