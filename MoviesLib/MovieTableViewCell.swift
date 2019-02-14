//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 13/02/19.
//  Copyright © 2019 emerson. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    
    
    
    @IBOutlet weak var lbNota: UILabel!
    @IBOutlet weak var lbSinopse: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var ivposter: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func prepare(with movie: Movie) {
        ivposter.image = UIImage(named: movie.image)
        lbTitle.text = movie.title
        lbNota.text = "?? \(movie.rating)/10"
        lbSinopse.text = movie.summary
    }
    
}
