//
//  ConvertPictureViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/05/29.
//

import UIKit

final class ConvertPictureViewController: ComponentBaseViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }

    @IBOutlet weak var convertButton: UIButton! {
        didSet {
            convertButton.layer.cornerRadius = 4.0
        }
    }

    @IBOutlet weak var convertedImageView: UIImageView! {
        didSet {
            convertedImageView.layer.borderWidth = 1.0
            convertedImageView.layer.borderColor = UIColor.gray.cgColor
        }
    }

    private let items = ["りんご", "バナナ", "カレー", "ホットケーキ", "ラベンダー"]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "010 ConvertPicture",
                                blogURL: nil,
                                githubPRURL: nil)
    }

    @IBAction func convert(_ sender: Any) {
        let image = convertUIViewToPicture(from: tableView, to: convertedImageView)
        convertedImageView.image = rotate(from: image)
    }

}

// MARK: - Convert UIView to Picture
extension ConvertPictureViewController {

    private func convertUIViewToPicture(from: UIView, to: UIImageView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: to.bounds.size)
        let image = renderer.image { context in
            from.layer.render(in: context.cgContext)
        }
        return image
    }

}

// MARK: - Rotate UIImage
extension ConvertPictureViewController {

    // TODO [feature/#74]: UIImageの回転処理を書く
    private func rotate(from: UIImage) -> UIImage {
        //        UIGraphicsBeginImageContextWithOptions(CGSize(width: from.size.width, height: from.size.height), false, 0.0)
        //        let context: CGContext = UIGraphicsGetCurrentContext()!
        //
        //        let radian: CGFloat = 0
        //        context.rotate(by: radian)
        //        context.draw(from.cgImage!, in: CGRect(x: 0, y: 0, width: from.size.width, height: from.size.height))
        //
        //        let rotatedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        //        UIGraphicsEndImageContext()
        //        return rotatedImage
        return from
    }

}

extension ConvertPictureViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row]
        cell.detailTextLabel?.text = "\(indexPath.row)"
        return cell
    }

}
