document.addEventListener('DOMContentLoaded', function () {
  var targetToObserve = document.body;

  var observerConfig = {
    attributes: true,
    childList: true,
    characterData: true
  };

  var observer = new MutationObserver(function (mutations) {
    mutations.forEach(mutataion => {
      feather.replace({
        class: 'align-middle'
      });
    });
  });

  observer.observe(targetToObserve, observerConfig);
});