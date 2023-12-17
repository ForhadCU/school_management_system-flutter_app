class LiveClassWidgets {
  // make this class singleton 
    LiveClassWidgets._internal();
    static final LiveClassWidgets _singleton = LiveClassWidgets._internal();
    factory LiveClassWidgets() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances
  
}