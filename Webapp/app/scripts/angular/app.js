angular.module('kimchi', [
    'ngSanitize',
    'ui.bootstrap'
  ]);
  
  angular.module('kimchi').factory('KIMCHI', function ($window) {
    return $window.KIMCHI;
  });
  
  angular.module('kimchi').factory('THREE', function ($window) {
    return $window.THREE;
  });
  
  angular.module('kimchi').run(function ($window, KIMCHI) {
    
    KIMCHI.ready();
  
    // bind window resize
    angular.element($window).bind('resize', function () {
      KIMCHI.size.update();
      KIMCHI.renderer.render();
    });
  });
  