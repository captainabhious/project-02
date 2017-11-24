//
//  EspnWDPreViewController.swift
//  project02
//
//  Created by Abhi Singh on 10/18/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class EspnWDPreViewController: UIViewController {
    
    //var receivingPicture: String!
    //var receivingDescription: String!
    var receivingDescription: String!
    var receivingPicture: String!
    
    
    
    @IBOutlet weak var previewDescription: UITextView!
    @IBOutlet weak var previewImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewDescription.text = receivingDescription
        
        let url = URL(string: receivingPicture)!
        let data = try? Data(contentsOf: url)
        previewImageView.image = UIImage(data: data!)
        
        
        
        print("nothing showing up?? \(previewDescription.text!)!")
        // print(receivingDescription!)
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
