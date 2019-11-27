(function () {
  function validateCnt (event, cntInput) {
    if (event.target[event.target.selectedIndex].text == "–") {
      cntInput.setAttribute("min", 0)
      return
    }
    cntInput.setAttribute("min", 1)
  }

  var starter = document.getElementById("contactform-catering-starter")
  var starterCnt = document.getElementById("contactform-catering-starter-cnt")
  starter.addEventListener("change", function (event) {
    var localEvent = event
    var localCnt = starterCnt
    return validateCnt(localEvent, localCnt)
  }, false)

  var drink = document.getElementById("contactform-catering-drink")
  var drinkCnt = document.getElementById("contactform-catering-drink-cnt")
  drink.addEventListener("change", function (event) {
    var localEvent = event
    var localCnt = drinkCnt
    return validateCnt(localEvent, localCnt)
  }, false)

})()