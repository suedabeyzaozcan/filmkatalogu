//
//  ImageDownLoaderClient.swift
//  flimSwiftUIApp
//
//  Created by Sueda Beyza Özcan on 9.08.2024.
//

import Foundation
class ImageDownLoaderClient : ObservableObject{
    @Published var indirilenGorsel : Data?
    func gorselIndir(url: String){
        guard let imageUrl = URL(string: url) else {
            return
            //eğer url yanlış olursa oluşacak hata türü
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error)in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async{
                self.indirilenGorsel = data
            }
        }.resume()
    }
}
