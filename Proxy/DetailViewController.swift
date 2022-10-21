//
//  DetailViewController.swift
//  Proxy
//
//  Created by Nataliya Lazouskaya on 21.10.22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let url = URL(string: "https://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    func loadImage() {
        let imageService = LoadImageService()
        let proxy = Proxy(service: imageService)
        
        proxy.loadImage(url: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        cacheData = nil
        imageView.image = nil
        loadImage()
    }
    
}
