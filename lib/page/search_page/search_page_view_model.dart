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
      if (e.response?.statusCode == 404) {
        _errorSearch = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorSearch =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorSearch =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorSearch =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorSearch = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  bool _isBurger = false;
  bool get isBurger => _isBurger;

  bool _isPizza = false;
  bool get isPizza => _isPizza;

  bool _isFriedChick = false;
  bool get isFriedChick => _isFriedChick;

  bool _isNoodle = false;
  bool get isNoodle => _isNoodle;
  void getBurgerSearchRecipe() async {
    _isPizza = false;
    _isFriedChick = false;
    _isNoodle = false;
    _isBurger = true;
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
      if (e.response?.statusCode == 404) {
        _errorSearch = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorSearch =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorSearch =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorSearch =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorSearch = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getPizzaSearchRecipe() async {
    _isPizza = true;
    _isFriedChick = false;
    _isNoodle = false;
    _isBurger = false;
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
      if (e.response?.statusCode == 404) {
        _errorSearch = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorSearch =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorSearch =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorSearch =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorSearch = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getNoodleSearchRecipe() async {
    _isPizza = false;
    _isFriedChick = false;
    _isNoodle = true;
    _isBurger = false;
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
      if (e.response?.statusCode == 404) {
        _errorSearch = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorSearch =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorSearch =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorSearch =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorSearch = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void getFriedChickenSearchRecipe() async {
    _isPizza = false;
    _isFriedChick = true;
    _isNoodle = false;
    _isBurger = false;
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
      if (e.response?.statusCode == 404) {
        _errorSearch = "Resource not found, please check the url or try again";
      } else if (e.response?.statusCode == 402) {
        _errorSearch =
            "Payment Required: To access this page or resource, please complete the payment process. If you believe this is an error, please contact support.";
      } else if (e.response?.statusCode == 401) {
        _errorSearch =
            "Unauthorized Access: You don't have permission to view this page or resource.";
      } else if (e.response?.statusCode == 403) {
        _errorSearch =
            "Access Forbidden: You do not have permission to access this page or resource. If you believe this is an error, please contact the administrator for assistance.";
      } else {
        _errorSearch = "Something went wronng, please try again later";
      }
      notifyListeners();
    } finally {
      _isLoadingSearch = false;
      notifyListeners();
    }
  }

  void popularRecipeRefresh() {
    if (_isBurger == true) {
      getBurgerSearchRecipe();
    } else if (_isFriedChick == true) {
      getFriedChickenSearchRecipe();
    } else if (_isNoodle == true) {
      getNoodleSearchRecipe();
    } else {
      getPizzaSearchRecipe();
    }
    notifyListeners();
  }
}
