//
//  TabListView.swift
//  CreateTabListViewWithUIKit
//
//  Created by 力石優武 on 2022/10/26.
//

import SwiftUI
import UIKit

struct TabContentListView: View, UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coodinator {
        Coodinator()
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        
        pageViewController.setViewControllers([context.coordinator.viewControllers[0]],
                                              direction: .forward,
                                              animated: true)
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {

    }
    
    class Coodinator: NSObject, UIPageViewControllerDataSource {
        let viewControllers = [
            UIHostingController(rootView: Text("view 1")),
            UIHostingController(rootView: Text("view 2")),
            UIHostingController(rootView: Text("view 3"))
        ]
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let sampleTextViewController = viewController as? UIHostingController<Text>,
                  let currentIndex = viewControllers.firstIndex(of: sampleTextViewController) else {
                return nil
            }
            
            if currentIndex == 0 {
                return viewControllers.last
            }
            
            return viewControllers[currentIndex - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let sampleTextViewController = viewController as? UIHostingController<Text>,
                  let currentIndex = viewControllers.firstIndex(of: sampleTextViewController) else {
                return nil
            }
            
            if currentIndex == viewControllers.count - 1 {
                return viewControllers.first
            }
            
            return viewControllers[currentIndex + 1]
        }
        
        
    }
}

struct TabContentListView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentListView()
    }
}
