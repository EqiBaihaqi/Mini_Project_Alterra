import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:your_comfort_food/model/search_recipes_response.dart';
import 'package:your_comfort_food/model/service/search_recipe_service.dart';


class SearchPageViewModel extends ChangeNotifier {
  final TextEditingController _queryController = TextEditingController();
  TextEditingController get queryController => _queryController;

  SearchRecipesResponse _searchRecipesResponse = SearchRecipesResponse();
  SearchRecipesResponse get searchRecipesResponse => _searchRecipesResponse;

  String? _errorSearch;
  String? get errorSearch => _errorSearch;

  bool _isLoadingSearch = false;
  bool get isLoadingSearch => _isLoadingSearch;

  void getSearchRecipe() async {
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response =
          await ServiceSearch.getSearchRecipe(_queryController.text);

      _searchRecipesResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getBurgerSearchRecipe() async {
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response = await ServiceSearch.getSearchRecipe('Burger');

      _searchRecipesResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getPizzaSearchRecipe() async {
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response = await ServiceSearch.getSearchRecipe('Pizza');

      _searchRecipesResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getNoodleSearchRecipe() async {
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response = await ServiceSearch.getSearchRecipe('Noodle');

      _searchRecipesResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getFriedChickenSearchRecipe() async {
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response = await ServiceSearch.getSearchRecipe('Fried Chicken');

      _searchRecipesResponse = response;
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }



 
}
