//
//  ViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/02/19.
//  Copyright © 2019 emerson. All rights reserved.
//

import UIKit



class MovieViewController: UIViewController {
    
    
    var movie: Movie?
    
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbGenero: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var tvSumary: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if let movie = movie {
            
            
            ivPoster.image = UIImage(named: movie.image)
            lbTitle.text = movie.title
            lbDuration.text = movie.duration
            lbGenero.text = movie.categories
            lbRating.text = "⭐️ \(movie.rating)/10"
            tvSumary.text = movie.summary
            
        }
        
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
