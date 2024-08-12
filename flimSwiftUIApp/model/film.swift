//
//  film.swift
//  flimSwiftUIApp
//
//  Created by Sueda Beyza Özcan on 9.08.2024.
//

import Foundation

struct Film : Codable {
    
    let title : String
    let year : String
    let imdbID : String
    let type : String
    let poster : String
    
    //değişkenleri bşlıklara eşleştirme
    private enum CodingKeys : String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}
struct GelenFilmler : Codable {
    let filmler : [Film]

    private enum CodingKeys : String, CodingKey {
        case filmler = "Search"
    }
}
