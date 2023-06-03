//
//  EuService.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 13.05.2023.
//

import Foundation

class EuService{
    func icerikIndir(url: URL, completion: @escaping ([Epo]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
               
                let epoDizisi = try? JSONDecoder().decode([Epo].self, from: data)
                
                if let epoDizisi = epoDizisi {
                    completion(epoDizisi)
                }
            }
       
        }.resume()
    }
}
