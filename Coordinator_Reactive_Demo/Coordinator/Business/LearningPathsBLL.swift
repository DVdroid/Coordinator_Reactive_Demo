//
//  LearningPathBLL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import UIKit
import SwiftUI
import Combine

final class LearningPathsBLL: NSObject {

    @ObservedObject var observableLearningPathsFromDAL = ObservableDAL<[LearningPathFromDAL]>()
    @ObservedObject var observableLearningPathsFromBLL = ObservableLearningPathsFromBLL()

    var vc: UIViewController = UIViewController()

    private var cancellable: AnyCancellable?

    var learningPathsDAL: LearningPathsDAL
    init(learningPathsDAL: LearningPathsDAL) {
        self.learningPathsDAL = learningPathsDAL
        self.observableLearningPathsFromDAL = learningPathsDAL.observableLearningPathsFromDAL
        super.init()

        self.cancellable = observableLearningPathsFromDAL.$observedObject.sink(receiveValue: { [weak self] learningPathsFromDAL in
            guard let self = self,
                  let uwLearningPathsFromDAL = learningPathsFromDAL else { return }
            self.observableLearningPathsFromBLL.learningPathFromBLL = self.mapLearningPathsFromDALToBLL(uwLearningPathsFromDAL)
        })
    }

    func mapLearningPathsFromDALToBLL(_ learningPathsFromDAL: [LearningPathFromDAL]) -> LearningPathsFromBLL {

        var learningPaths: [LearningPath] = []
        for learningPathDAL in learningPathsFromDAL {

            let name = learningPathDAL.name
            let subtitle = learningPathDAL.subtitle

            var contents: [ContentItem] = []
            for contentItem in learningPathDAL.contentItems {
                switch contentItem.type {
                case "article":
                    let article = Article(type: contentItem.type,
                                          description: contentItem.description)
                    contents.append(ContentItem(article: article))

                case "podcast":
                    let podcast = Podcast(type: contentItem.type,
                                          description: contentItem.description)
                    contents.append(ContentItem(podcast: podcast))

                case "video":
                    let video = Video(type: contentItem.type,
                                      description: contentItem.description)
                    contents.append(ContentItem(video: video))

                default:
                    continue
                }
            }

            let learningPath = LearningPath(name: name,
                                            subtitle: subtitle,
                                            contentItems: contents)
            learningPaths.append(learningPath)
        }
        return LearningPathsFromBLL(learningPaths: learningPaths)
    }

}

