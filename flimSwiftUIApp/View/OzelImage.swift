import SwiftUI


struct OzelImage: View {
    
    let url: String
    @ObservedObject var imageDownLoaderClient = ImageDownLoaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownLoaderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
           if let data = self.imageDownLoaderClient.indirilenGorsel, let uiImage = UIImage(data: data) {
               return Image(uiImage: uiImage)
                   .resizable()  // Bu satır, görüntünün yeniden boyutlandırılmasına olanak tanır
                   .scaledToFit() // Görüntüyü uygun şekilde ölçeklendirmek için ekledim
           } else {
               return Image("placeholder")
                   .resizable()  // Placeholder görüntüsü de yeniden boyutlandırılabilir
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
                //
            } else{
               
            }
        }
    }
    
    #Preview {
        OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMjI2MzU2NzEzN15BMl5BanBnXkFtZTcwMzI5NTU3Nw@@._V1_SX300.jpg")
    }
}
 */
