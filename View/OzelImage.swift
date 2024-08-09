//
//  OzelImage.swift
//  flimSwiftUIApp
//
//  Created by Sueda Beyza Özcan on 9.08.2024.
//

import SwiftUI


struct OzelImage: View {
    
    let url: String
    @ObservedObject var imageDownLoaderClient = ImageDownLoaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownLoaderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownLoaderClient.indirilenGorsel,
           let uiImage = UIImage(data: data) {
                       return Image(uiImage: uiImage)
                           .resizable() // Burada resizable özelliğini ekliyoruz
                           .scaledToFit() // Bu da boyutlandırmayı sağlar
                   } else {
                       return Image("placeolder")
                           .resizable() // Yer tutucu görüntüye de ekleyebilirsiniz
                           .scaledToFit()
                   }
    }
}

#Preview {
    OzelImage(url: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")
    
}

/*

struct OzelImage: View {
    
    let url : String
    @ObservedObject var imageDownLoaderClient = ImageDownLoaderClient()
    init (url:String){
        self.url = url
        self.imageDownLoaderClient.gorselIndir(url: self.url)
    }
    var body: some View {
        if let data = self.imageDownLoaderClient.indirilenGorsel{
            let uiImage = UIImage(data: data) {
                return Image(uiImage: UIImage)
                //return Image(uiImage: UIImage(data: data))
            } else{
                return Image("placeolder")
            }
        }
    }
    
    #Preview {
        OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMjI2MzU2NzEzN15BMl5BanBnXkFtZTcwMzI5NTU3Nw@@._V1_SX300.jpg")
    }
}
 */
