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

  bool _isEmpty = false;
  bool get isEmpty => _isEmpty;
  void getSearchRecipe() async {
    _isEmpty = false;
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response =
          await ServiceSearch.getSearchRecipe(_queryController.text);

      _searchRecipesResponse = response;
      if (response.results!.isEmpty) {
        _isEmpty = true;
      }
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getBurgerSearchRecipe() async {
    _isEmpty = false;
    _queryController.text = '';
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response = await ServiceSearch.getSearchRecipe('Burger');

      _searchRecipesResponse = response;
      if (response.results!.isEmpty) {
        _isEmpty = true;
      }
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getPizzaSearchRecipe() async {
    _isEmpty = false;
    _queryController.text = '';
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response = await ServiceSearch.getSearchRecipe('Pizza');

      _searchRecipesResponse = response;
      if (response.results!.isEmpty) {
        _isEmpty = true;
      }
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getNoodleSearchRecipe() async {
    _isEmpty = false;
    _queryController.text = '';
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response = await ServiceSearch.getSearchRecipe('Noodle');

      _searchRecipesResponse = response;
      if (response.results!.isEmpty) {
        _isEmpty = true;
      }
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getFriedChickenSearchRecipe() async {
    _isEmpty = false;
    _isLoadingSearch = true;
    _errorSearch = null;
    _searchRecipesResponse = SearchRecipesResponse();

    notifyListeners();
    try {
      final response = await ServiceSearch.getSearchRecipe('Fried Chicken');

      _searchRecipesResponse = response;
      if (response.results!.isEmpty) {
        _isEmpty = true;
      }
      notifyListeners();
    } on DioException catch (e) {
      _errorSearch = e.toString();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }
}
