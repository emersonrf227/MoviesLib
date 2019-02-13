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
        loadMovies()
        
        
    }
    
    
    
    
    
    func loadMovies() {
        
        guard  let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
        
        
        
    }
    
}


