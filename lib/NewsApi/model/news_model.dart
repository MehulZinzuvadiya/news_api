class NewsModel {
  String? status;
  int? totalResults;
  List<ArticleModel>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromMap(Map m1) {
    return NewsModel(
        status: m1['status'],
        totalResults: m1['totalResults'],
        articles:List<ArticleModel>.from(
            m1["articles"].map((x) => ArticleModel.fromMap(x))),
    );
  }
}

class ArticleModel {
  sourceModel? source;
  String? author, title, description, url, urlToImage, publishedAt, content;

  ArticleModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory ArticleModel.fromMap(Map m1) {
    return ArticleModel(
      author: m1['author'],
      content: m1['content'],
      description: m1['description'],
      publishedAt: m1['publishedAt'],
      title: m1['title'],
      url: m1['url'],
      urlToImage: m1['urlToImage'],
      source: sourceModel.fromMap(m1['source']),
    );
  }
}

class sourceModel {
  String? id, name;

  sourceModel({this.id, this.name});

  factory sourceModel.fromMap(Map m1) {
    return sourceModel(id: m1['id'], name: m1['name']);
  }
}
