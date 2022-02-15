//
//  FlickrSearchViewController.swift
//  CVSDemo
//
//  Created by Martin Chibwe on 2/14/22.
//

import UIKit
import Kingfisher
// Picture search screen
class FlickrSearchViewController: UIViewController{
    
    //MARK: Outlets
    @IBOutlet weak var flickrTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var flickrService = WebService()
    var searchResults = [FlickrItems]()
    private var flickrListModel: FlickrListItemsModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        flickrTableView.dataSource = self
        searchBar.delegate = self
    }
    
    func setup() {
        flickrService.getFlickrPictures(query: searchBar.text!) { flickrItems in
            if let flickrItems = flickrItems {
                self.flickrListModel = FlickrListItemsModel(flickrItems: flickrItems)
                
                DispatchQueue.main.async {
                    self.flickrTableView.reloadData()
                    
                }
            }
        }
    }
}
extension FlickrSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        if(searchBar.text == "") {
            searchResults.removeAll()
        }
        else {
           setup()
        }
    }
}
extension FlickrSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
extension FlickrSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flickrListModel.numberOfRowsInSection(section)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        self.flickrListModel == nil ? 0 :  self.flickrListModel.numberOfSection
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = flickrTableView.dequeueReusableCell(withIdentifier: "flickrCell", for: indexPath) as? FlickrImageTableViewCell else {
            fatalError("flickrTableViewCell not Found")
        }
       let flickrVM =  self.flickrListModel.flickrItemsAtIndex(indexPath.row)
        cell.configureCell(with: flickrVM)
        return cell
    }
}
