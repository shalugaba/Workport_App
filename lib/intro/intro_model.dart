
import '../Strings.dart';

class SliderModel {
  String imageAssetPath;
  String title;

/*  SliderModel({
    this.imageAssetPath,
    this.title});*/

  SliderModel({
    required this.imageAssetPath,
    required this.title });

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = SliderModel(title: 'Title', imageAssetPath: 'ImagePath');

  //1
  sliderModel.setTitle('Drive With Workport');
  sliderModel.setImageAssetPath(Strings.splash_1);
  slides.add(sliderModel);
  sliderModel = SliderModel(title: 'Drive With Workport', imageAssetPath: Strings.splash_1);

  //2
  sliderModel.setTitle('Request A Ride');
  sliderModel.setImageAssetPath(Strings.splash_2);
  slides.add(sliderModel);
  sliderModel = SliderModel(title: 'Request A Ride', imageAssetPath: Strings.splash_2);
  // sliderModel = SliderModel();

  //3
  sliderModel.setTitle('Affordables Rides');
  sliderModel.setImageAssetPath(Strings.splash_3);
  slides.add(sliderModel);
  sliderModel = SliderModel(title: 'Affordables Rides', imageAssetPath: Strings.splash_3);
  // sliderModel = SliderModel();

  //4
  sliderModel.setTitle('Fare Estimate');
  sliderModel.setImageAssetPath(Strings.splash_4);
  slides.add(sliderModel);
  sliderModel = SliderModel(title: 'Fare Estimate', imageAssetPath: Strings.splash_4);
  // sliderModel = SliderModel();


  return slides;
}
