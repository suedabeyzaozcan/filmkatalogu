import Foundation

class DownloaderClient {
    
    func filmleriIndir(search: String, completion: @escaping(Result<[Film]?, DownloaderError>)-> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=850dd865") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            
            guard let filmCevabi = try?
                    JSONDecoder().decode(GelenFilmler.self, from: data)
            else{
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(filmCevabi.filmler))
            
        }.resume()
    }
    
    func filmDetayiniIndir(imdbId: String, completion: @escaping(Result<FilmDetay, DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=850dd865") else {
            return completion(.failure(.yanlisUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let gelenFilmDetay = try? JSONDecoder().decode(FilmDetay.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(gelenFilmDetay))
        }.resume()
    }
}
// Olası hatalar
        enum DownloaderError: Error {
            case yanlisUrl
            case veriIslenemedi
            case veriGelmedi
        }
        

          

/*import Foundation

class DownloaderClient {
    func filmleriIndir(search: String, completion: @escaping(Result<[Film]?,DownloaderError>)-> Void) {
        //hata oluşursa verilecek uyarılar
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=850dd865") else {
            return completion(.failure(.yanlisUrl))
            //eğer url yanlış olursa oluşacak hata türü
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error)in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            guard let filmCevabi =  try? JSONDecoder().decode(GelenFilmler.self, from: data) else{
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(filmCevabi.filmler))
        }.resume()
    }
    
    func filmDetayiniIndir(imdbID : String, completion: @escaping(Result<[FilmDetay]?,DownloaderError>)-> Void) {

        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=850dd865") else {
            return completion(.failure(.yanlisUrl))
            //eğer url yanlış olursa oluşacak hata türü
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let gelenFilmDetay =  try? JSONDecoder().decode(FilmDetay.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success([gelenFilmDetay]))
        }.resume()    }
 }
 */
