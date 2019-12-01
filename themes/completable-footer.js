require("IGCMS.Completable", function() {
  IGCMS.Completable.init({
    selectSelector: '.completable-footer select[name="Admin"]',
    label: "",
    placeholder: "Select file (Ctrl+Shift+E)",
    sendFormText: "Send form",
    sendFormClass: "sendform",
    keyboardShortcut: "ctrl+shift+e"
  })
})
