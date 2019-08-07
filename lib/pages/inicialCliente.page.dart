import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InicialClientePage extends StatefulWidget {
  State<StatefulWidget> createState() => InicialClientePageState();
}

class InicialClientePageState extends State<InicialClientePage> {
  PageController pageController;

//image list
List<String> images=[
  'https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwi_rdLly-_jAhU_ILkGHaMhB9UQjRx6BAgBEAQ&url=http%3A%2F%2Ffortal.com.br%2F2019%2F07%2F10%2Fno-dia-da-pizza-confira-as-melhores-promocoes-em-pizzarias-de-fortaleza%2F&psig=AOvVaw0jv3HLyiCzynTqdqL4vSWd&ust=1565227185408249',
  'https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwj1tv2HzO_jAhXwJrkGHXKzAo0QjRx6BAgBEAQ&url=https%3A%2F%2Fwww.peixeurbano.com.br%2Fbrasilia%2Fboteco-do-juca%2Frodizio-de-pizzas-e-petiscosoluz&psig=AOvVaw0jv3HLyiCzynTqdqL4vSWd&ust=1565227185408249',
  'https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiii8WQzO_jAhVsILkGHeQNBgoQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.ifood.com.br%2Fdelivery%2Fsalvador-ba%2Fpizzaria-grande-bahia-pituba%2Fc21b36fc-e09c-490b-8a07-4f8a5ef4539d&psig=AOvVaw0jv3HLyiCzynTqdqL4vSWd&ust=1565227185408249'
  ];


  @override
  void initState() {
    super.initState();

    pageController=PageController(initialPage: 1,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: images.length,
        itemBuilder: (context,position){
          return imageSlider(position);
      })
    );
  }

  imageSlider(int index){

  }
}
