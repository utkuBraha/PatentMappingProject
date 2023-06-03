//
//  tptoViewModel.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 15.05.2023.
//

import Foundation

struct tptoTableView {
    let tptoList : [Tpto]
    
    func numberOfRowsInSection() -> Int{
        return self.tptoList.count
    }
    func tptoAtIndexPath(_ index: Int) -> tptoViewModel{
        let tptos = self.tptoList[index]
        return tptoViewModel(tptos: tptos)
    }
    
}

struct tptoViewModel{
    let tptos : Tpto
    
    var name : String{
        return self.tptos.name
    
    }
    var content : String{
        return self.tptos.content
    }
}
