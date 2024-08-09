//
//  FilmDetayViewModel.swift
//  flimSwiftUIApp
//
//  Created by Sueda Beyza Özcan on 9.08.2024.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    //gözlemci
    @Published var filmDetayi : FilmDetaylariViewModel?
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbID : String) {
        downloaderClient.filmDetayiniIndir(imdbID: imdbID){ (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                if let detay = filmDetay?.first {

                DispatchQueue.main.async {
                    self.filmDetayi = FilmDetaylariViewModel(detay: detay)
                }
                              }
                          }
                      }
                  }
              }
struct FilmDetaylariViewModel{
    let detay : FilmDetay

    var title : String {
        detay.title
    }
    var poster : String{
        detay.poster
    }
    var year: String{
        detay.year
    }
    var imdbID : String{
        detay.imdbID
    }
    var director : String{
        detay.director
    }
    var writer : String{
        detay.writer
    }
    var awards : String{
        detay.awards
    }
    var plot : String{
        detay.plot
    }
}
