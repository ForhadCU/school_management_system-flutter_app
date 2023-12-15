class GalleryApi{
  // make this class singleton 
    GalleryApi._internal();
    static final GalleryApi _singleton = GalleryApi._internal();
    factory GalleryApi() {
      return _singleton;
    }
  // codes start from here
  // All methods should be static to maintain singleton instances

  

}