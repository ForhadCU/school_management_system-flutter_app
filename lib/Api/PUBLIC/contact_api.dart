class ContactApi {
  // make this class singleton 
    ContactApi._internal();
    static final ContactApi _singleton = ContactApi._internal();
    factory ContactApi() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances

  
}