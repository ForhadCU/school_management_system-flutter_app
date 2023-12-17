class NoticeWidgets {
  // make this class singleton 
    NoticeWidgets._internal();
    static final NoticeWidgets _singleton = NoticeWidgets._internal();
    factory NoticeWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}