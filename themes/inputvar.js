(function () {
  require("IGCMS.InputVar", function () {
    require("IGCMS.Completable", function () {
      function createSelect (data, id) {
        var select = document.createElement("select")
        select.name = id
        select.id = id
        for (var i = 0; i < data.length; i++) {
          var option = document.createElement("option")
          option.innerHTML = data[i].name + " – " + data[i].desc
          option.setAttribute("data-name", data[i].name)
          option.setAttribute("data-date", data[i].date)
          option.setAttribute("data-desc", data[i].desc)
          option.setAttribute("data-price", data[i].price)
          select.appendChild(option)
        }
        return select
      }

      var data = IGCMS.InputVar.data
      var textareas = document.getElementsByTagName("textarea")

      for (var i = 0; i < data.length; i++) {
        var name = data[i].name
        for (var j = 0; j < textareas.length; j++) {
          if (!textareas[j].name.startsWith(name)) {
            continue;
          }
          var selectId = "select-" + name + j
          var completable = createSelect(data[i].data, selectId)
          textareas[j].parentNode.appendChild(completable)
          IGCMS.Completable.init({
            selectSelector: "#" + selectId,
            placeholder: "Pro doplnění jídla začněte psát..",
            label: "<span class='fas fa-magic'></span>",
            onSend: (function () {
              var textarea = textareas[j]
              return function (navig, file, close) {
                if (!navig.value || !file) {
                  return
                }
                textarea.value = file.origElm.getAttribute("data-name") + "\n"
                  + file.origElm.getAttribute("data-desc") + "\n"
                  + file.origElm.getAttribute("data-price").replace("~", "\n")
                textarea.dispatchEvent(new Event('input'))
                navig.value = ""
                close()
              }
            })(),
            decorateListItem: function (itemValue) {
              return itemValue.replace(/ – /g, "</br>")
            },
            undecorateListItem: function (itemValue) {
              return itemValue.replace(/<\/br>/g, " – ")
            }
          })
        }
      }
    })
  })
})()