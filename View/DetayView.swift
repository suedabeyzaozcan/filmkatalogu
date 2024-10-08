//
//  DetayView.swift
//  flimSwiftUIApp
//
//  Created by Sueda Beyza Özcan on 9.08.2024.
//
import SwiftUI

struct DetayView: View {
    let imdbID: String
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack {
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film İsmi Gösterilecek").font(.title.bold()).padding()
            Text("Yılı: \(filmDetayViewModel.filmDetayi?.year ?? "yılı Gösterilecek")").foregroundColor(.gray).padding()
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek").padding()
            Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
            Text("Senaristler: \(filmDetayViewModel.filmDetayi?.writer ?? "Senaristler Gösterilecek")").padding()
            Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")").padding()
        }
        .onAppear {
            self.filmDetayViewModel.filmDetayiAl(imdbID: imdbID)
        }
    }
}

#Preview {
    DetayView(imdbID: "test")
}
