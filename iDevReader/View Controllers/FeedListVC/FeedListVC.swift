//
//  FeedListVC.swift
//  iDevReader
//
//  Created by Nilson Nascimento on 3/25/18.
//  Copyright © 2018 Nilson Nascimento. All rights reserved.
//

import UIKit

class FeedListVC: UIViewController {

    fileprivate static let cellIdentifier = "cell_identifier"

    @IBOutlet weak var tableView: UITableView!

    let feeds: [Feed]

    init(feeds: [Feed]) {
        self.feeds = feeds

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: FeedListVC.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FeedListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let feed = feeds[indexPath.row]
        let articleListVC = ArticleListVC(feed: feed)
        navigationController?.pushViewController(articleListVC, animated: true)
        
    }
}

extension FeedListVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedListVC.cellIdentifier, for: indexPath)
        let feed = feeds[indexPath.row]

        cell.textLabel?.text = feed.title

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Feeds"
    }

}
