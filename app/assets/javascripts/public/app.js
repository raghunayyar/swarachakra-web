(function() {
  var app;

  app = angular.module("Swarachakra", ["ngAnimate", "restangular", "ngRoute", "ngSanitize", "ngTouch"]);

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
    "$scope", "Restangular", "LanguageModel", "$sce", function($scope, Restangular, LanguageModel, $sce) {
      var languageResource;
      $scope.languages = LanguageModel.getAll();
      languageResource = Restangular.one("languages");
      languageResource.getList("all").then(function(languageobject) {
        var i, j, k;
        LanguageModel.addAll(languageobject);
        console.log($scope.languages);
        $scope.masterarray = [];
        i = 0;
        while (i < 11) {
          $scope.juniorarray = new Array(5);
          k = 0;
          while (k < 5) {
            j = 0;
            while (j < $scope.languages[0].csv.length) {
              $scope.juniorarray[j] = $scope.languages[0].csv[j];
              j++;
            }
            k++;
          }
          $scope.masterarray[i] = $scope.juniorarray;
          i++;
        }
        console.log($scope.masterarray);
        console.log($scope.languages);
        $scope.onscreen = [
          [
            {
              keycode: "1",
              unicode: "\u0D15",
              chakra: "1"
            }, {
              keycode: "2",
              unicode: "\u0D16",
              chakra: "1"
            }, {
              keycode: "3",
              unicode: "\u0D17",
              chakra: "1"
            }, {
              keycode: "4",
              unicode: "\u0D18",
              chakra: "1"
            }, {
              keycode: "5",
              unicode: "\u0D19",
              chakra: "1"
            }
          ], [
            {
              keycode: "6",
              unicode: "\u0D1A",
              chakra: "1"
            }, {
              keycode: "7",
              unicode: "\u0D1B",
              chakra: "1"
            }, {
              keycode: "8",
              unicode: "\u0D1C",
              chakra: "1"
            }, {
              keycode: "9",
              unicode: "\u0D1D",
              chakra: "1"
            }, {
              keycode: "10",
              unicode: "\u0D1E",
              chakra: "1"
            }
          ], [
            {
              keycode: "11",
              unicode: "\u0D15",
              chakra: "1"
            }, {
              keycode: "12",
              unicode: "\u0D16",
              chakra: "1"
            }, {
              keycode: "13",
              unicode: "\u0D17",
              chakra: "1"
            }, {
              keycode: "14",
              unicode: "\u0D18",
              chakra: "1"
            }, {
              keycode: "15",
              unicode: "\u0D19",
              chakra: "1"
            }
          ], [
            {
              keycode: "16",
              unicode: "\u0D1A",
              chakra: "1"
            }, {
              keycode: "17",
              unicode: "\u0D1B",
              chakra: "1"
            }, {
              keycode: "18",
              unicode: "\u0D1C",
              chakra: "1"
            }, {
              keycode: "19",
              unicode: "\u0D1D",
              chakra: "1"
            }, {
              keycode: "20",
              unicode: "\u0D1E",
              chakra: "1"
            }
          ], [
            {
              keycode: "21",
              unicode: "\u0D15",
              chakra: "1"
            }, {
              keycode: "22",
              unicode: "\u0D16",
              chakra: "1"
            }, {
              keycode: "23",
              unicode: "\u0D17",
              chakra: "1"
            }, {
              keycode: "24",
              unicode: "\u0D18",
              chakra: "1"
            }, {
              keycode: "25",
              unicode: "\u0D19",
              chakra: "1"
            }
          ], [
            {
              keycode: "26",
              unicode: "\u0D15",
              chakra: "1"
            }, {
              keycode: "27",
              unicode: "\u0D16",
              chakra: "1"
            }, {
              keycode: "28",
              unicode: "\u0D17",
              chakra: "1"
            }, {
              keycode: "29",
              unicode: "\u0D18",
              chakra: "1"
            }, {
              keycode: "30",
              unicode: "\u0D19",
              chakra: "1"
            }
          ], [
            {
              keycode: "31",
              unicode: "\u0D1A",
              chakra: "1"
            }, {
              keycode: "32",
              unicode: "\u0D1B",
              chakra: "1"
            }, {
              keycode: "33",
              unicode: "\u0D1C",
              chakra: "1"
            }, {
              keycode: "34",
              unicode: "\u0D1D",
              chakra: "1"
            }, {
              keycode: "35",
              unicode: "\u0D1E",
              chakra: "1"
            }
          ], [
            {
              keycode: "36",
              unicode: "\u0D15",
              chakra: "1"
            }, {
              keycode: "37",
              unicode: "\u0D16",
              chakra: "1"
            }, {
              keycode: "38",
              unicode: "\u0D17",
              chakra: "1"
            }, {
              keycode: "39",
              unicode: "\u0D18",
              chakra: "1"
            }, {
              keycode: "40",
              unicode: "\u0D19",
              chakra: "1"
            }
          ], [
            {
              keycode: "41",
              unicode: "\u0D1A",
              chakra: "1"
            }, {
              keycode: "42",
              unicode: "\u0D1B",
              chakra: "1"
            }, {
              keycode: "43",
              unicode: "\u0D1C",
              chakra: "1"
            }, {
              keycode: "44",
              unicode: "\u0D1D",
              chakra: "1"
            }, {
              keycode: "45",
              unicode: "\u0D1E",
              chakra: "1"
            }
          ], [
            {
              keycode: "46",
              unicode: "\u0D15",
              chakra: "1"
            }, {
              keycode: "47",
              unicode: "\u0D16",
              chakra: "1"
            }, {
              keycode: "48",
              unicode: "\u0D17",
              chakra: "1"
            }, {
              keycode: "49",
              unicode: "\u0D18",
              chakra: "1"
            }, {
              keycode: "50",
              unicode: "\u0D19",
              chakra: "1"
            }
          ], [
            {
              keycode: "51",
              unicode: "\u0D15",
              chakra: "1"
            }, {
              keycode: "52",
              unicode: "\u0D16",
              chakra: "1"
            }, {
              keycode: "53",
              unicode: "\u0D17",
              chakra: "1"
            }, {
              keycode: "54",
              unicode: "\u0D18",
              chakra: "1"
            }, {
              keycode: "55",
              unicode: "\u0D19",
              chakra: "1"
            }
          ], [
            {
              keycode: "56",
              unicode: "\u0D1A",
              chakra: "1"
            }, {
              keycode: "57",
              unicode: "\u0D1B",
              chakra: "1"
            }, {
              keycode: "58",
              unicode: "\u0D1C",
              chakra: "1"
            }, {
              keycode: "59",
              unicode: "\u0D1D",
              chakra: "1"
            }, {
              keycode: "60",
              unicode: "\u0D1E",
              chakra: "1"
            }
          ], [
            {
              keycode: "61",
              unicode: "\u0D15",
              chakra: "1"
            }, {
              keycode: "62",
              unicode: "\u0D16",
              chakra: "1"
            }, {
              keycode: "63",
              unicode: "\u0D17",
              chakra: "1"
            }, {
              keycode: "64",
              unicode: "\u0D18",
              chakra: "1"
            }, {
              keycode: "65",
              unicode: "\u0D19",
              chakra: "1"
            }
          ], [
            {
              keycode: "66",
              unicode: "\u0D1A",
              chakra: "1"
            }, {
              keycode: "67",
              unicode: "\u0D1B",
              chakra: "1"
            }, {
              keycode: "68",
              unicode: "\u0D1C",
              chakra: "1"
            }, {}, {}
          ]
        ];
        $scope.blah = "\u0D1C";
        console.log($scope.blah);
      });
      $scope.togglechakra = function(keycode, unicode) {
        $scope.showchakra = !$scope.showchakra;
        $scope.currentkey = unicode;
      };
      $scope.shifttable = function() {
        console.log('yolo');
        $scope.frame1 = !$scope.frame1;
      };
      $scope.sharetext = function() {
        return function() {};
      };
    }
  ]);

  app.controller("TextareaController", [
    "$scope", "Restangular", "LanguageModel", "SaveModel", function($scope, Restangular, LanguageModel, SaveModel) {
      $scope.languages = LanguageModel.getAll();
      $scope.save = function() {
        var content;
        content = $scope.content;
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
