//
//  NewsWebDetailViewController.swift
//  project02
//
//  Created by Abhi Singh on 10/20/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit
import WebKit

class NewsWebDetailViewController: UIViewController {


    @IBOutlet weak var NewsWebDeets: WKWebView!
    var receivingData = ""
    var receivingTitle = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: receivingData)
        NewsWebDeets.load(URLRequest(url: url!))
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        
        
        nav?.tintColor = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "clearbrlogo")
        imageView.image = image
        navigationItem.titleView = imageView
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
