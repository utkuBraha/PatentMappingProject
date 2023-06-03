//
//  UsService.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 13.05.2023.
//

import Foundation

class UsService{
    func icerikIndir(url: URL, completion: @escaping ([Ustpo]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
               
                let ustpoDizisi = try? JSONDecoder().decode([Ustpo].self, from: data)
                
                if let ustpoDizisi = ustpoDizisi {
                    completion(ustpoDizisi)
                }
            }
       
        }.resume()
    }
}
