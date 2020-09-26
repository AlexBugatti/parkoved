//
//  CityController.swift
//  Parkoved
//
//  Created by Александр on 26.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit

class CityController: UIViewController {

    var parks: [Park] = Park().all()
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.register(UINib(nibName: "CityEventsCell", bundle: nil), forCellReuseIdentifier: "CityEventsCell")
            self.tableView.register(UINib(nibName: "ParkCell", bundle: nil), forCellReuseIdentifier: "ParkCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let tab = self.tabBarController?.tabBar.items?.first {
            tab.image = #imageLiteral(resourceName: "Home")
        }
        // Do any additional setup after loading the view.
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

extension CityController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.parks.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityEventsCell", for: indexPath) as! CityEventsCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParkCell", for: indexPath) as! ParkCell
            let park = self.parks[indexPath.row]
            cell.setupUI(park: park)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 20))
        let title = section == 0 ? "   Акции и События" : "   Парки города"
        
        label.text = title
        return label
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 128
//    }
//    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
}
