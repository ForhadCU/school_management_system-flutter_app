class GalleryWidget{
    static final GalleryWidget _singleton = GalleryWidget._internal();
    GalleryWidget._internal();
    factory GalleryWidget() {
      return _singleton;
    }

    
}