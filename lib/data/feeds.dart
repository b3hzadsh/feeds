class FeedData {
  static Map<String, List<String>> feedUrls = {
    "dls": [
      // 0
      "https://downloadly.ir/feed/",
      "https://androidkade.com/feed",
      "https://download.ir/feed/"
    ],
    "movie": [
      // 1
      "https://dlroozane.net/feed",
      "https://www.uptvs.com/feed",
      //"https://lianmovie.com/feed",
      "https://www.film2movie.asia/feed",
    ],
    "game": [
      // 2
      "https://www.zoomg.ir/feed/",
      "https://gamene.ws/feed",
      "https://gamefa.com/feed",
      ""
    ],
    "it": [
      // 3
      "https://toranji.ir/feed",
      "https://digiato.com/feed",
      "https://www.zoomit.ir/feed"
    ],
    "economy": [
      // 4
      "https://www.khabaronline.ir/rss/tp/2",
      // "https://www.isna.ir/rss/tp/34",
      "https://www.mehrnews.com/rss/tp/25",
      "https://www.farsnews.ir/rss/economy"
    ],
    // "boors": ["https://www.mehrnews.com/rss/tp/122"],
    "sports": [
      // 9
      // "https://www.isna.ir/rss/tp/24",
      "https://www.mehrnews.com/rss/tp/9",
      "https://www.farsnews.ir/rss/sports",
      "https://www.khabaronline.ir/rss/tp/1276"
    ],
    "iranianFootbal": [
      // 8
      "https://www.isna.ir/rss/tp/119",
      "https://www.mehrnews.com/rss/tp/24"
    ],
    "scientificAcademic": [
      // 7
      "https://www.isna.ir/rss/tp/5",
      "https://www.farsnews.ir/rss/scientific-academic",
      "https://www.mehrnews.com/rss/tp/178",
    ],
    "politics": [
      // 6
      // "https://www.isna.ir/rss/tp/14",
      "https://www.farsnews.ir/rss/politics",
      "https://www.khabaronline.ir/rss/tp/1",
      "https://www.mehrnews.com/rss/tp/7"
    ],
    "lastNews": [
      //  5
      "https://www.isna.ir/rss",
      "https://www.mehrnews.com/rss",
      "https://www.farsnews.ir/rss",
      // "https://www.khabaronline.ir/rss"
    ],
  };
  static List<String> prefsId = [
    'dls',
    'movie',
    'game',
    'it',
    'economy',
    'lastNews',
    'politics',
    'scientificAcademic',
    'iranianFootbal',
    'sports',
    'boors'
  ];
  List<String> getUrls(int id) {}
}
