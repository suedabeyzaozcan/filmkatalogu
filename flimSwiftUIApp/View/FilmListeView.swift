import SwiftUI

struct FilmListeView: View {
    @ObservedObject var filmListeViewModel: FilmListeViewModel
    @State private var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
    }
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Film Ara...", text: $aranacakFilm, onEditingChanged:{ _ in}, onCommit: {
                    //let filmIsmi = aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines)
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).description.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(filmListeViewModel.filmler, id: \.imdbID) {
                    film in
                    NavigationLink(destination: DetayView(imdbID: film.imdbID),label: {
                        HStack(){
                            OzelImage(url: film.poster)
                                .frame(width: 90, height: 130)
                            VStack(alignment: .leading) {
                                Text(film.title)
                                    .font(.title3.bold())
                                Text(film.year)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            }
                        }
                    })
                }
                .navigationBarTitleDisplayMode(.inline).toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Filmlerimiz").font(.largeTitle.bold()).frame(maxWidth: .infinity, alignment: .leading).padding(.top, 8)}
                        // Başlığı yukarıda hizalamak için
                    }
                                       }
                                   }
                               }
                           }
                       }

    #Preview {
        FilmListeView()
    }

