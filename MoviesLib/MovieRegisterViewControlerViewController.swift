//
//  MovieRegisterViewControlerViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 18/02/19.
//  Copyright © 2019 emerson. All rights reserved.
//

import UIKit
import CoreData

class MovieRegisterViewControlerViewController: UIViewController {
    
    
    
    var movie: Movie?

    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfRating: UITextField!
    @IBOutlet weak var tfDuration: UITextField!
    @IBOutlet weak var tvSumary: UITextView!
    @IBOutlet weak var tfCategories: UITextField!
    @IBOutlet weak var btaddEdit: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            tfTitle.text = movie.title
            tfRating.text = "\(movie.rating)"
            tfCategories.text = movie.categories
            tvSumary.text = movie.summary
            tfDuration.text = movie.duration
            
            
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addEditMovie(_ sender: Any) {
        
        if movie == nil {
            movie = Movie(context: context)
            
            movie?.title = tfTitle.text
            movie?.rating = Double(tfRating.text!) ?? 0
            movie?.duration = tfDuration.text
            movie?.summary = tvSumary.text
            movie?.categories = tfCategories.text
            
            
            
            do {
            
            try context.save()
                navigationController?.popViewController(animated: true)
            }catch {
                
                print(error)
            }
            
            
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
