import 'package:flutter/material.dart';


class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Add your business details and other information");
  sliderModel.setTitle("List Your Restaurant");
  sliderModel.setImageAssetPath("assets/images/onboarding-inventory.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Serve your consumer Healthy, Hygienic and Good Quality Food");
  sliderModel.setTitle("Cook Delicious Food!");
  sliderModel.setImageAssetPath("assets/images/onboarding-accounts.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Keep your deliveries on time. Trains won't stop for us!");
  sliderModel.setTitle("On Time Delivery");
  sliderModel.setImageAssetPath("assets/images/onboarding-webstore.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel = new SliderModel();

  return slides;
}