//
//  LearningPathFromBLL.swift
//  Coordinator_Reactive_Demo
//
//  Created by Vikash Anand on 21/08/21.
//

import Foundation

struct LearningPathsFromBLL {
    let learningPaths: [LearningPath]

    subscript(learningPath atIndex: Int) -> LearningPath {
        return learningPaths[atIndex]
    }

    subscript(contents atIndex: Int) -> [ContentItem] {
        return learningPaths[atIndex].contentItems
    }

    lazy var allLearningPathName: [String] = {
        var names: [String] = []
        for learningPath in learningPaths {
            names.append(learningPath.name)
        }
        return names
    }()

    lazy var allContentItems: [ContentItem] = {
        var allContentItems: [ContentItem] = []
        for learningPath in learningPaths {
            allContentItems.append(contentsOf: learningPath.contentItems)
        }
        return allContentItems
    }()
}

struct LearningPath {
    let name: String
    let subtitle: String
    let contentItems: [ContentItem]
}

enum ContentItemType {
    case article
    case audio
    case video

    init?(_ type: String) {
        switch type {
        case "article":
            self = .article
        case "audio":
            self = .article
        case "video":
            self = .article
        default:
            return nil
        }
    }
}

struct ContentItem {
    let type: ContentItemType?
    let description: String
}

extension ContentItem  {
    init(article: Article) {
        self.type = ContentItemType(article.type)
        self.description = article.description
    }
}

extension ContentItem  {
    init(podcast: Podcast) {
        self.type = ContentItemType(podcast.type)
        self.description = podcast.description
    }
}

extension ContentItem  {
    init(video: Video) {
        self.type = ContentItemType(video.type)
        self.description = video.description
    }
}

struct Article {
    let type: String
    let description: String
}

struct Podcast {
    let type: String
    let description: String
}

struct Video {
    let type: String
    let description: String
}

