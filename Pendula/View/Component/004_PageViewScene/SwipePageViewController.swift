//
//  SwipePageViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/14.
//

import UIKit

final class SwipePageViewController: ComponentBaseViewController {

    @IBOutlet weak var pageIndexLabel: UILabel!

    // TODO: storyboardとつなぎこむ（どうやるんだっけ）
    private var pageViewController: UIPageViewController? {
        didSet {
            pageViewController?.dataSource = self
        }
    }
    private var firstViewController: SwipePageFirstViewController?
    private var secondViewController: SwipePageSecondViewController?
    private var thirdViewController: SwipePageThirdViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "004 SwipePage",
                                blogURL: nil,
                                githubPRURL: nil)
        configurePageView()
    }

}

extension SwipePageViewController {

    private func configurePageView() {
        firstViewController = R.storyboard.swipePageFirst.swipePageFirst()!
        secondViewController = R.storyboard.swipePageSecond.swipePageSecond()!
        thirdViewController = R.storyboard.swipePageThird.swipePageThird()!

        pageViewController = children.first as? UIPageViewController
        pageViewController?.setViewControllers([firstViewController!],
                                               direction: .forward,
                                               animated: true,
                                               completion: nil)
    }

}

extension SwipePageViewController: UIPageViewControllerDataSource {

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        if viewController is SwipePageFirstViewController {
            return nil
        } else if viewController is SwipePageSecondViewController {
            return firstViewController
        } else if viewController is SwipePageThirdViewController {
            return secondViewController
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        if viewController is SwipePageFirstViewController {
            return secondViewController
        } else if viewController is SwipePageSecondViewController {
            return thirdViewController
        } else if viewController is SwipePageThirdViewController {
            return nil
        }
        return nil
    }
}
