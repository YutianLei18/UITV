//
//  Gateway.swift
//  UITV
//
//  Created by Colin on 11/14/22.
//


import Foundation
import UIKit

class Gateway : ObservableObject{
    @Published var searchresults : SearchReply = SearchReply()
    var selectedsearch : SearchResult = SearchResult()
    @Published var seriesData : SeriesData = SeriesData()
    var selectedactor : Actor = Actor()
    
    func doSeriesSearch(search s : String) async {
        guard !s.isEmpty else { return}
        let escapedString = s.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let key = "k_whajo3te"
        let urlStr = "https://imdb-api.com/en/API/SearchSeries/\(key)/\(escapedString!)"
        guard let url = URL(string: urlStr) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as! HTTPURLResponse).statusCode == 200 else { return }
            let pl = try JSONDecoder().decode(SearchReply.self, from: data)
            DispatchQueue.main.async { self.searchresults = pl }
        } catch {
        }
    }
    func doMovieSearch(search s : String) async {
        guard !s.isEmpty else { return}
        let escapedString = s.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let key = "k_whajo3te"
        let urlStr = "https://imdb-api.com/en/API/SearchMovie/\(key)/\(escapedString!)"
        guard let url = URL(string: urlStr) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as! HTTPURLResponse).statusCode == 200 else { return }
            let pl = try JSONDecoder().decode(SearchReply.self, from: data)
            DispatchQueue.main.async { self.searchresults = pl }
        } catch {
        }
    }
    func getDetails() async {
        let key = "k_whajo3te"
        let id = selectedsearch.id
        let urlStr = "https://imdb-api.com/en/API/Title/\(key)/\(id)/FullActor,"
        guard let url = URL(string: urlStr) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as! HTTPURLResponse).statusCode == 200 else { return }
            let pl = try JSONDecoder().decode(SeriesData.self, from: data)
            DispatchQueue.main.async { self.seriesData = pl }
        } catch {
        }
    }
    
    
    
}

