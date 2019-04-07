FontAwesomeConfig = {
  observeMutations: false,
  searchPseudoElements: true
};

(function() {
  var icons = document.querySelectorAll('*[class*="fa-"]')
  for (var i = 0; i < icons.length; i++) {
    icons[i].innerHTML = ""
  }
})()