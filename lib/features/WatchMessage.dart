import 'dart:async';

class WatchMessage {
  static int? watchNum;
  static isWatched(watch, isWatched) {
    !isWatched ? watch : watchNum = ++watch;
    print('watch ' + '$watchNum');
    return watchNum;
  }
}
