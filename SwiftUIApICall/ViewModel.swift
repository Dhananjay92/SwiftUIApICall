//
//  ViewModel.swift
//  SwiftUIApICall
//
//  Created by ADMIN on 18/12/2021.
//

import SwiftUI


struct course: Hashable,Codable{
    let name:String
    let image: String
    
}

class ViewModel:ObservableObject{
    @Published var courses:[course] = []

    func fetch(){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else{return}
    
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
              guard  let data = data, error == nil else {
                return
                  
            }
            // Covert to JSON
            do{
                let courses = try JSONDecoder().decode([course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses=courses
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
}
}

 
