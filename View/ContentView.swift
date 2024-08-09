import SwiftUI

struct ContentView: View {
    @ObservedObject var filmListeViewModel: FilmListeViewModel
    @State private var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Film Ara...", text: $aranacakFilm, onCommit: {
                    let filmIsmi = aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines)
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: filmIsmi.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? filmIsmi)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(filmListeViewModel.filmler, id: \.imdbID) { film in
                    NavigationLink(destination: DetayView(imdbID: film.imdbID)) {
                        HStack {
                            OzelImage(url: film.poster)
                                .frame(width: 110, height: 110)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(film.title)
                                    .font(.title3.bold())
                                Text(film.year)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            }
                            .frame(height: 110)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Filmlerimiz")
                            .font(.largeTitle.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 8) // Başlığı yukarıda hizalamak için
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
