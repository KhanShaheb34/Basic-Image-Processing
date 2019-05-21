static class Utils {
  static void saveImage(PImage image) {
    String s = "Captured/image" + year() + month() + day() + hour() + minute() + second() + ".jpg";
    image.save(s);
  }
  
  
}
