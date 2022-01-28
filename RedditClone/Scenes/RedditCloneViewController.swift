//
//  RedditCloneViewController.swift
//  RedditClone
//
//  Created by Oğulcan Aslan on 27.01.2022.
//

import UIKit

class RedditCloneViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel = RedditCloneViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        viewModel.getDataList { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "RedditCloneTableViewCell", bundle: nil), forCellReuseIdentifier: "RedditCloneTableViewCell")
    }
    
}

extension RedditCloneViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.response?.data?.children.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RedditCloneTableViewCell") as? RedditCloneTableViewCell
        guard let viewModel = viewModel.response?.data?.children[indexPath.row].data else { return UITableViewCell() }
        cell?.populate(viewModel: viewModel)
        return cell ?? UITableViewCell()
    }
}
