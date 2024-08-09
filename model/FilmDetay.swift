//
//  FilmDetay.swift
//  flimSwiftUIApp
//
//  Created by Sueda Beyza Özcan on 9.08.2024.
//

import Foundation
struct FilmDetay : Codable {
    
    let title : String
    let year : String
    let genre : String
    let director : String
    let writer: String
    let actors : String
    let plot : String
    let awards : String
    let poster :String
    let metascore : String
    let imdbRating : String
    let imdbID : String
    
    private enum CodingKeys : String, CodingKey{
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case awards = "awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbID = "imdbID"
    }
}
