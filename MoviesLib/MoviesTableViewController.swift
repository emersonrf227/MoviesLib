//
//  MoviesTableViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/02/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit
import CoreData

class MoviesTableViewController: UITableViewController {
    
   // var movies: [Movie] = []
    
    
    
    var fetchedResultsController: NSFetchedResultsController<Movie>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // segue.destination
        if let indexPath = tableView.indexPathForSelectedRow,
            let movieVC = segue.destination as? MovieViewController{
           
     
         //   let movie = movies[row]
            movieVC.movie = fetchedResultsController.object(at: indexPath)
            
        }
        
        
    }
    
    func loadMovies() {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController (fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        do{
            try fetchedResultsController.performFetch()
            
        }catch
        {print(error)}
        
        
        
        
        
        
        /*
        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
        
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            
            let jsonDecoder = JSONDecoder()
            //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            movies = try jsonDecoder.decode([Movie].self, from: jsonData)
            
        } catch {
            print(error)
        }
        */
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie = fetchedResultsController.object(at: indexPath)
        cell.prepare(with: movie)
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
     // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        
        let movie = fetchedResultsController.object(at: indexPath)
        context.delete(movie)
        try? context.save()

     }
}
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension MoviesTableViewController: NSFetchedResultsControllerDelegate{
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.reloadData()
     
    }
    
    
}
