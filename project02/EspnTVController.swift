//
//  EspnTVController.swift
//  project02
//
//  Created by Abhi Singh on 10/15/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import UIKit

class EspnTVController: UITableViewController, UIViewControllerPreviewingDelegate {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEspnNow()

        // check for 3D haptic availability
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            // prepare for preview, with delegate
            registerForPreviewing(with: self, sourceView: self.tableView)
        } else {
            print("Isn't Compatible")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let nav = self.navigationController?.navigationBar
        
 
        nav?.tintColor = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "clearespn")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if ConnectionCheck.isConnectedToNetwork() {
            print("Network is Reachable :)")
        } else {
            print("Network is NOT Reachable :(")
            let alertController = UIAlertController(title: "Error", message: "No Internet Connection", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title:"Ok", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    
    // peek
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
//        let thing = espnNews
        guard let indexPath = tableView.indexPathForRow(at: location), let cell = tableView.cellForRow(at: indexPath) as? EspnTVCell
            else {
                return nil
                
            }

        guard let thisView = storyboard?.instantiateViewController(withIdentifier: "preview") as? EspnWDPreViewController else {
        return nil
        }
        
        thisView.receivingDescription = espnNews?.articles![indexPath.row].description
        thisView.receivingPicture = espnNews?.articles![indexPath.row].urlToImage
        
        
//        thisView.espnNews?.articles![indexPath.row].description = cell.espnTitle.text!
//        previewingContext.sourceRect = cell.frame
       // thisView.
        
       // thisView.espnNews?.articles![indexPath.row].url = cell.espnImage
        
        return thisView
    }
    
    // pop: enable user to go from preview2 to WebDetailVC/finalView
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        let finalView = storyboard?.instantiateViewController(withIdentifier: "webdetail")
   //     let finalView = storyboard?.instantiateViewController(withIdentifier: EspnWDPreViewController)
        
        
        //setup your final view here
        
        show(finalView!, sender: self)
        
    }
 
    
    
    
    
    
    
    
    
    
    
    var espnNews: News?
    
    func updateEspnNow(){
        let requestUrl = URL(string: "https://newsapi.org/v1/articles?source=espn&sortBy=top&apiKey=129fc856f7454aeca1b6726575bf23c6")
   
          let request = URLRequest(url: requestUrl!)
            let task = URLSession.shared.dataTask(with: request) {
                (data, response, error) in
                
                guard error == nil else {
                    print("Networking Error: \(String(describing: error))")
                    return
                }
                guard let data = data else {
                    print("Networking Error: Did Not Receive Data")
                    return
                }
                
                do {
                    self.espnNews = try
                        JSONDecoder().decode(News.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                }
                catch {
                    print("Error in serializing JSON")
                }
            }
            task.resume()
    }
    
    

    
    
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return espnNews?.articles?.count ?? 0
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "espnCellIdentifier", for: indexPath) as! EspnTVCell
        let row = indexPath.row
        
        // lazy loading
        //if let validUrlToImage = espnNews!.articles![indexPath.row].urlToImage { //checks for valid image url
        if let validUrlToImg = espnNews!.articles?[indexPath.row].urlToImage {
            cell.espnImage.downloadImageFrom(link: validUrlToImg) // down(lazy)loads image url
        } else {
            cell.espnImage.image = #imageLiteral(resourceName: "noImage") // gives default "image not available" otherwise
        }
       
        // Espn Title
        let title = espnNews?.articles![indexPath.row].title
        cell.espnTitle.text = title

        
        cell.shareButton.addTarget(self, action: #selector(btnPress), for: .touchUpInside)
        cell.shareButton.tag = row
       
     return cell
     }
    
    
    @objc func btnPress(sender: UIButton!) {
        let activityVC = UIActivityViewController(activityItems: [self.espnNews!.articles![sender.tag].title, self.espnNews!.articles![sender.tag].url, self.espnNews!.articles![sender.tag].urlToImage], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    
    //MARK: Passing Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       // Get the row from the cell click in the table
        let cellThatWasClicked = sender as! UITableViewCell
        let indexPath = self.tableView.indexPath(for: cellThatWasClicked)!
       // Get the relevant data from espnNews
       // let passingPicture = espnNews!.articles![indexPath.row].urlToImage
       // let passingDescription = espnNews!.articles![indexPath.row].description
        
        let passingData = espnNews!.articles![indexPath.row].url
        let passingTitle = espnNews!.articles![indexPath.row].title
        
      // Create reference and pass it to appropriate ViewController's empty string var
        let detailViewController = segue.destination as! WebDetailViewController //EspnWDPreViewController
     //  detailViewController.receivingPicture = passingPicture
    //    detailViewController.receivingDescription = passingDescription
        detailViewController.receivingData = passingData
        detailViewController.receivingTitle = passingTitle

    }
    

    //MARK: ScrollView Hiding
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
       // navigationController?.barHideOnTapGestureRecognizer
        
        if(velocity.y>0) {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
             //   self.tabBarController?.hidesBottomBarWhenPushed
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 2.5, delay: 0, options: UIViewAnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
            }, completion: nil)
        }
    }
}

//lazy loading extension
extension UIImageView {
    
    func downloadImageFrom(link: String)  {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            if error != nil {
                print("error", error!, Date())
            }
            DispatchQueue.main.async {
                print(#line, "<-Reached")
                self.image = nil
                self.contentMode =  .scaleToFill
                if let data = data {
                    print(#line, #function)
                    self.image = UIImage(data: data)
                }
            }
        }).resume()
    }
}


