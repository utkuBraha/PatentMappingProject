//
//  secondViewController.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 13.05.2023.
//

import UIKit

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   @IBOutlet weak var tableView: UITableView!
   
    private var epoTableView : epoTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        veriAl()
    }
    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/utkuBraha/yeniGit/main/epo")
        EuService().icerikIndir(url: url!) { icerik in
            if let icerik = icerik{
                
                self.epoTableView = PatenetMappingAlgorithm.epoTableView(epoList: icerik)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return epoTableView == nil ? 0 : self.epoTableView.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellii", for: indexPath) as! TwoCell
        let epoViewModel = self.epoTableView.epoAtIndexPath(indexPath.row)
        cell.nameLabel.text = epoViewModel.name
        cell.contentLabel.text = epoViewModel.content
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
