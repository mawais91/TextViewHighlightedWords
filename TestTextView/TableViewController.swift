//
//  TableViewController.swift
//  TestTextView
//
//  Created by Muhammad  Awais on 11/09/2023.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Create a table view or IBOutlet connection to an existing table view in your storyboard
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source and delegate to self
        tableView.dataSource = self
        tableView.delegate = self
        
        // Add the table view to your view hierarchy
        view.addSubview(tableView)
        
        // Add constraints to the table view to position and size it within the main view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // Register the custom cell class with the table view
        tableView.register(InAppPurchaseOfferMenuCellsUserReviewsHeaderTableViewCell.self, forCellReuseIdentifier: "cellReuseIdentifier")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 20
        
        // Reload the table view to display the cell
        tableView.reloadData()
    }
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in your table view
        return 3 // Adjust as needed
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue the custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as! InAppPurchaseOfferMenuCellsUserReviewsHeaderTableViewCell
        
        if indexPath.row == 0 {
            cell.headlineLabel2.text = """
                                        In today's fast-paced world, technology plays an integral role in our daily lives. From smartphones that keep us connected to the internet, to artificial intelligence simplifying tasks, technology has revolutionized the way we live and work. It has opened new avenues for communication, transformed industries, and empowered individuals. However, with great power comes responsibility. We must use technology wisely, addressing concerns like privacy and digital well-being. Striking a balance between the convenience of technology and its potential drawbacks is crucial. As we move forward, harnessing the benefits of technology while being mindful of its impact on society will be a defining challenge of our time.
                                      """
            
            let font = UIFont(name: "Teko-Bold", size: 35) ?? UIFont.systemFont(ofSize: 30)
            cell.headlineLabel2.setLineHeight(30)
            cell.headlineLabel2.setHighlightedWords(highlights: [("world", font),
                                                                          ("intelligence", font),
                                                                          ("lives", font),
                                                                          ("responsibility", font),
                                                                          ("convenience", font),
                                                                          ("challenge", font),
                                                                          ("time", font)])
            return cell
        }
        // Configure the cell as needed
        cell.headlineLabel2.text = """
                                    In today's fast-paced world, technology plays an integral role in our daily lives. From smartphones that keep us connected to the internet, to artificial intelligence simplifying tasks, technology has revolutionized the way we live and work. It has opened new avenues for communication, transformed industries, and empowered individuals. However, with great power comes responsibility. We must use technology wisely, addressing concerns like privacy and digital well-being. Striking a balance between the convenience of technology and its potential drawbacks is crucial. As we move forward, harnessing the benefits of technology while being mindful of its impact on society will be a defining challenge of our time.
                                  """
        
        let font = UIFont(name: "Teko-Bold", size: 35) ?? UIFont.systemFont(ofSize: 30)
        cell.headlineLabel2.setLineHeight(-5)
        cell.headlineLabel2.setHighlightedWords(highlights: [("smartphones", font),
                                                                      ("simplifying", font),
                                                                      ("avenues", font),
                                                                      ("individuals", font),
                                                                      ("technology", font),
                                                                      ("Striking", font),
                                                                      ("defining", font)])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Check if the cell you are interested in has been loaded
        
        if let customCell = cell as? InAppPurchaseOfferMenuCellsUserReviewsHeaderTableViewCell {
            let font = UIFont(name: "Teko-Bold", size: 35) ?? UIFont.systemFont(ofSize: 30)
            customCell.headlineLabel2.removeWordsBackground()
            if indexPath.row == 0 {
                customCell.headlineLabel2.setWordsBackground([
                    ("world", UIColor.yellow, font, 8),
                    ("intelligence", UIColor.green, font, 5),
                    ("lives", UIColor.brown, font, 3),
                    ("responsibility", UIColor.blue, font, 10),
                    ("convenience", UIColor.blue, font, 10),
                    ("challenge", UIColor.magenta, font, 6),
                    ("time", UIColor.systemPink, font, 6)
                ], lineHeight: 0)
            } else {
                customCell.headlineLabel2.setWordsBackground([
                    ("smartphones", UIColor.yellow, font, 8),
                    ("simplifying", UIColor.green, font, 5),
                    ("avenues", UIColor.brown, font, 3),
                    ("individuals", UIColor.blue, font, 10),
                    ("technology", UIColor.blue, font, 10),
                    ("Striking", UIColor.magenta, font, 6),
                    ("defining", UIColor.systemPink, font, 6)
                ], lineHeight: -5)
            }
            
        }
    }
}
