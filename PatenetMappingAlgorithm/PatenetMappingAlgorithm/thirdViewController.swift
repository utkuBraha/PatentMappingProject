//
//  thirdViewController.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 13.05.2023.
//

import UIKit

class thirdViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    private var tptoTableView : tptoTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        veriAl()
    }
    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/utkuBraha/yeniGit/main/tpto")
        TrService().icerikIndir(url: url!) { icerik in
            if let icerik = icerik {
                self.tptoTableView = PatenetMappingAlgorithm.tptoTableView(tptoList: icerik)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tptoTableView == nil ? 0 : self.tptoTableView.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celliii", for: indexPath) as! ThreeCell
        let tptoViewModel = self.tptoTableView.tptoAtIndexPath(indexPath.row)
        cell.nameLabel.text = tptoViewModel.name
        cell.contentLabel.text = tptoViewModel.content
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
