//
//  ustpoViewModel.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 15.05.2023.
//

import Foundation

struct ustpoTableView{
    let ustpoList : [Ustpo]
    
    func numberOfRowsInSection() -> Int{
        return self.ustpoList.count
    }
    func ustpoAtIndexPath(_ index: Int) -> ustpoViewModel{
        let ustpos = self.ustpoList[index]
        return ustpoViewModel(ustops: ustpos)
    }
   
}

struct ustpoViewModel{
    let ustops : Ustpo
    
    var name : String{
        return self.ustops.name
    }
    var content : String{
        return self.ustops.content
    }
}
