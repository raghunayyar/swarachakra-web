(function() {
  var app;

  app = angular.module("Swarachakra", ["ngAnimate", "restangular", "ngRoute"]);

  app.directive("swarachakraTimeoutChange", [
    "$timeout", function($timeout) {
      return {
        restrict: "A",
        link: function(scope, element, attributes) {
          var interval;
          interval = 3000;
          $(element).bind("input propertychange", function() {
            var timeout;
            $timeout.cancel(timeout);
            timeout = $timeout(function() {
              scope.$apply(attributes.swarachakraTimeoutChange);
            }, interval);
          });
        }
      };
    }
  ]);

  app.controller("AppController", [
    "$scope", "Restangular", "LanguageModel", function($scope, Restangular, LanguageModel) {
      var languageResource;
      $scope.languages = LanguageModel.getAll();
      languageResource = Restangular.one("languages");
      languageResource.getList('all').then(function(languageobject) {
        LanguageModel.addAll(languageobject);
      });
    }
  ]);

  app.controller("DashboardController", [
    "$scope", "Restangular", "LanguageModel", function($scope, Restangular, LanguageModel) {
      $scope.langauges = LanguageModel.getAll();
      $scope.remove = function(id) {
        var language;
        language = LanguageModel.get(id);
        language.remove().then(function() {
          LanguageModel.remove(id);
          $scope.langauges = LanguageModel.getAll();
        });
      };
      return $scope.update = function(id) {
        var currentload, language;
        $scope.currentload = true;
        currentload = $scope.currentload;
        language = LanguageModel.get(id);
        language.patch({
          enabled: currentload
        }).then(function(languageobject) {
          LanguageModel.update(languageobject);
          $scope.langauges = LanguageModel.getAll();
          $scope.currentload = false;
        });
      };
    }
  ]);

  app.controller("KeyboardController", [
    "$scope", "Restangular", "LanguageModel", function($scope, Restangular, LanguageModel) {
      $scope.languages = LanguageModel.getAll();
      console.log($scope.languages);
    }
  ]);

  app.controller("TextareaController", [
    "$scope", "Restangular", "LanguageModel", "SaveModel", function($scope, Restangular, LanguageModel, SaveModel) {
      $scope.languages = LanguageModel.getAll();
      $scope.save = function() {
        var content;
        content = $scope.content;
        console.log(content);
        SaveModel.add(content);
      };
    }
  ]);

  app.factory("LanguageModel", function() {
    var LanguageModel;
    LanguageModel = function() {
      this.languages = [];
      this.languageid = {};
      this.deleted = null;
      this.updated = null;
    };
    LanguageModel.prototype = {
      add: function(language) {
        this.languages.push(language);
      },
      addAll: function(languages) {
        var i;
        i = 0;
        while (i < languages.length) {
          this.add(languages[i]);
          i++;
        }
      },
      getAll: function() {
        return this.languages;
      },
      get: function(id) {
        var i;
        i = 0;
        while (i < this.languages.length) {
          if (id === this.languages[i].id) {
            this.languageid = this.languages[i];
            break;
          }
          i++;
        }
        return this.languageid;
      },
      update: function(language) {
        var i;
        i = 0;
        while (i < this.languages.length) {
          if (this.languages[i].id === language.id) {
            this.languages[i] = language;
            break;
          }
          i++;
        }
        this.languageid[language.id] = language;
        this.updated = language;
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
          i++;
        }
      }
    };
    return new LanguageModel();
  });

  app.factory("SaveModel", [
    "$q", function($q) {
      var SaveModel;
      SaveModel = function() {
        this.queue = {};
        this.flushLock = false;
      };
      SaveModel.prototype = {
        add: function(textinput) {
          this.queue[0] = textinput;
          this.flush();
        },
        flush: function() {
          var i, keys, requests, self, textinput;
          keys = Object.keys(this.queue);
          if (keys.length === 0 || this.flushLock) {
            return;
          } else {
            this.flushLock = true;
          }
          self = this;
          requests = [];
          i = 0;
          while (i < keys.length) {
            textinput = this.queue[keys[i]];
            requests.push(textinput.put().then(this.noteUpdateRequest.bind(null, textinput)));
            i++;
          }
          this.queue = {};
          $q.all(requests).then(function() {
            self.flushLock = false;
            self.flush();
          });
        },
        noteUpdateRequest: function(note, response) {
          note = response;
        }
      };
      return new SaveModel();
    }
  ]);

}).call(this);
