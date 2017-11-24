//
//  WebDetailViewController.swift
//  project02
//
//  Created by Abhi Singh on 10/17/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit
import WebKit

class WebDetailViewController: UIViewController {
    
    @IBOutlet weak var espnWebView: WKWebView!
    var receivingData = ""
    var receivingTitle = ""
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        nav?.tintColor = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "clearespn")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let url = URL(string: receivingData)
        espnWebView.load(URLRequest(url: url!))
 
        //navigationItem.title = receivingTitle
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
