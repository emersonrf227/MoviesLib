//
//  ViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/02/19.
//  Copyright © 2019 FIAP. All rights reserved.

// app icon generator ios

import UIKit
import AVKit


class MovieViewController: UIViewController {
    
   
    
    
    //MARK: Outlet
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var lbGenero: UILabel!
    @IBOutlet weak var tvSumary: UITextView!
    
    
    //MARK: Variaveis
    var trailer: String = ""
    var movie: Movie?
    var moviePlayer: AVPlayer?
    var moviePlayController: AVPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title  = movie?.title {
            loadTrailer(title: title)
        }
        
    }
    
    
    
   
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let movie = movie {
            //ivPoster.image = UIImage(named: movie.image)
            lbTitle.text = movie.title
            lbDuration.text = movie.duration
            lbRating.text = "??\(movie.rating)/10"
            lbGenero.text = movie.categories
            tvSumary.text = movie.summary
            ivPoster.image = movie.image as? UIImage
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieRegisterViewController {
            vc.movie = movie
        }
    }
    
    
    //MARK - METODOS
    func loadTrailer(title: String) {
        API.loadTrailers(title: title) { (apiResult) in
            guard let results = apiResult?.results, let trailer = results.first else {return}
            
            self.trailer = trailer.previewUrl
            DispatchQueue.main.async {
                
                 self.prepareVideo()

            }
           
        }
    }
    
    func prepareVideo(){
        
        guard let url = URL(string: trailer) else {return}
        moviePlayer = AVPlayer(url: url)
        moviePlayController = AVPlayerViewController()
        moviePlayController?.player = moviePlayer
        moviePlayController?.showsPlaybackControls = true
        
     
    }
    
    
    
    @IBAction func playMovieTrailer(_ sender: Any) {
   
        guard let moviePlayerController = moviePlayController else {return}
        present(moviePlayerController, animated: true, completion: nil)
        
    }
    
}

