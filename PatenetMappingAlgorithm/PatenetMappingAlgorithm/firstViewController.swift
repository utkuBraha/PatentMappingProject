//
//  firstViewController.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 13.05.2023.
//

import UIKit

class firstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var ustpoTableView : ustpoTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        veriAl()
        
    }
    
    func veriAl(){
        let url = URL(string: "https://raw.githubusercontent.com/utkuBraha/yeniGit/main/ustpo")
        UsService().icerikIndir(url: url!) { icerik in
            if let icerik = icerik{
                self.ustpoTableView = PatenetMappingAlgorithm.ustpoTableView(ustpoList: icerik)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
               
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ustpoTableView == nil ? 0 : self.ustpoTableView.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celli", for: indexPath) as! OneCell
        let ustpoViewModel = self.ustpoTableView.ustpoAtIndexPath(indexPath.row)
        cell.nameLabel.text = ustpoViewModel.name
        cell.contentLabel.text = ustpoViewModel.content
        return cell 
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
