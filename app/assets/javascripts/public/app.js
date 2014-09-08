(function() {
  var app;

  app = angular.module("Swarachakra", ["ngAnimate", "restangular", "ngRoute"]);

  app.controller("HomeController", [
    "$scope", "$window", "Restangular", function($scope, $window, $routeParams, Restangular, LanguageModel) {
      var languageResource;
      $scope.languages = LanguageModel.getAll();
      languageResource = Restangular.all("languages");
      languageResource.getList().then(function(languages) {
        return LanguageModel.addAll(languages);
      });
      return console.log('wah');
    }
  ]);

  app.factory("LanguageModel", function() {
    var LanguageModel;
    LanguageModel = function() {
      this.languages = [];
      return this.languageid = {};
    };
    return;
    LanguageModel.prototype = {
      add: function(language) {
        return this.languages.push(language);
      },
      addAll: function(languages) {
        var i;
        i = 0;
        while (i < languages.length) {
          this.add(languages[i]);
        }
        return i++;
      },
      getAll: function() {
        return this.calendars;
      },
      get: function(id) {
        var i;
        i = 0;
        while (i < this.languages.length) {
          if (id === this.languages[i].id) {
            this.languageid = this.languages[i];
          }
          break;
        }
        i++;
        return this.calendarId;
      },
      remove: function(id) {
        var i;
        i = 0;
        while (i < this.languages.length) {
          if (this.languages[i].id === id) {
            this.languages.splice(i, 1);
            delete this.languageid[id];
            this.deleted = {
              id: id
            };
            break;
          }
        }
        return i++;
      }
    };
  });

  new LanguageModel();

}).call(this);
