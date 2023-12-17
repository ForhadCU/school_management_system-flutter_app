class NoticeApis{
  // make this class singleton 
    NoticeApis._internal();
    static final NoticeApis _singleton = NoticeApis._internal();
    factory NoticeApis() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}
