class Post {
  const Post({
    this.title,
    this.author,
    this.imgUrl,
  });

  final String title;
  final String author;
  final String imgUrl;
}

final List<Post> posts = [

  Post(
      title: "标题1",
      author: "王子旭",
      imgUrl: "http://jzvd-pic.nathen.cn/jzvd-pic/00b026e7-b830-4994-bc87-38f4033806a6.jpg"
  ),
  Post(
      title: "标题2",
      author: "王子旭",
      imgUrl: "http://jzvd-pic.nathen.cn/jzvd-pic/00b026e7-b830-4994-bc87-38f4033806a6.jpg"
  ),
  Post(
      title: "标题3",
      author: "王子旭",
      imgUrl: "http://jzvd-pic.nathen.cn/jzvd-pic/00b026e7-b830-4994-bc87-38f4033806a6.jpg"
  ),
  Post(
      title: "标题4",
      author: "王子旭",
      imgUrl: "http://jzvd-pic.nathen.cn/jzvd-pic/00b026e7-b830-4994-bc87-38f4033806a6.jpg"
  ),
  Post(
      title: "标题5",
      author: "王子旭",
      imgUrl: "http://jzvd-pic.nathen.cn/jzvd-pic/00b026e7-b830-4994-bc87-38f4033806a6.jpg"
  )
];

