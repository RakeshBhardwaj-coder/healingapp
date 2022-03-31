class LikedPage {
  static int? likeNum = 0;
  // bool? isLiked;

  static isLike(like, isLiked) {
    // if (!isLiked) {
    //   likeNum = like;
    // } else {
    //   ++like;
    //   likeNum = like;
    // }
    !isLiked ? likeNum = like : likeNum = ++like;
    return likeNum;
  }
}
