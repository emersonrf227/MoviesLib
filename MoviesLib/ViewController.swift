//
//  ViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/02/19.
//  Copyright © 2019 emerson. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
    }
    





}


























/* outro metodo

func loadMovies() {
    guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
    
    do {
        let jsonData = try Data(contentsOf: jsonURL)
        movies = try JSONDecoder().decode([Movie].self, from: jsonData)
        movies.forEach { (movie) in
            print(movie.summary)
        }
    } catch {
        print(error)
    }
    
}



}

 
 */
