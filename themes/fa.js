FontAwesomeConfig = {
  observeMutations: true
};

(function() {
  require("IGCMS", function() {
    var icons = document.querySelectorAll('*[class*="fa-"]')
    for (var i = 0; i < icons.length; i++) {
      icons[i].innerHTML = ""
    }
    var script = document.createElement("script")
    script.type = "text/javascript"
    script.setAttribute("data-search-pseudo-elements", "")
    script.src = "https://kit.fontawesome.com/b0c4047774.js"
    document.head.appendChild(script)
    
    var script2 = document.createElement("script")
    script2.type = "text/javascript"
    script2.src = "/themes/printlistek.js"
    document.head.appendChild(script2)
  })
})()