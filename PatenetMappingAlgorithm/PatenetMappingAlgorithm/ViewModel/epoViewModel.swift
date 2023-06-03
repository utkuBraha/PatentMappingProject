//
//  epoViewModel.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 15.05.2023.
//

import Foundation

struct epoTableView{
    let epoList : [Epo]
    
    func numberOfRowsInSection() -> Int{
        return self.epoList.count
    }
    func epoAtIndexPath(_ index: Int) -> epoViewModel{
        let epos = self.epoList[index]
        return epoViewModel(epos: epos)
    }
    
    
}

struct epoViewModel{
    let epos : Epo
    
    var name : String{
        return self.epos.name
    }
    var content : String{
        return self.epos.content
    }
}
