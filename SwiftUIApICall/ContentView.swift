//
//  ContentView.swift
//  SwiftUIApICall
//
//  Created by ADMIN on 18/12/2021.
//

import SwiftUI

struct ContentView: View {
     @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses,id:\.self){course in
                    HStack{
                        URLImageView(urlString: course.image)
                        Text(course.name).bold()
                         
                    }
                }
                
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
