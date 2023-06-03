//
//  TrService.swift
//  PatenetMappingAlgorithm
//
//  Created by Utku Yavuz on 13.05.2023.
//

import Foundation

class TrService{
    func icerikIndir(url: URL, completion: @escaping ([Tpto]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
               
                let tptoDizisi = try? JSONDecoder().decode([Tpto].self, from: data)
                
                if let tptoDizisi = tptoDizisi {
                    completion(tptoDizisi)
                }
            }
       
        }.resume()
    }
}
