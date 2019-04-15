(function () {

  var alertMessage = document.body.getAttribute("data-alert")
  if (!alertMessage) {
    return
  }

  function setCookie(name,value,hours) {
      var expires = "";
      if (hours) {
          var date = new Date();
          date.setTime(date.getTime() + (hours*60*60*1000));
          expires = "; expires=" + date.toUTCString();
      }
      document.cookie = name + "=" + (value || "")  + expires + "; path=/";
  }
  function getCookie(name) {
      var nameEQ = name + "=";
      var ca = document.cookie.split(';');
      for(var i=0;i < ca.length;i++) {
          var c = ca[i];
          while (c.charAt(0)==' ') c = c.substring(1,c.length);
          if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
      }
      return null;
  }
  function eraseCookie(name) {   
      document.cookie = name+'=; Max-Age=-99999999;';  
  }

  var closed = getCookie("closed") 
  
  function close (el) {
    el.parentNode.parentNode.parentNode.removeChild(el.parentNode.parentNode)
    setCookie("closed", true, 1)
  }

  window.closePopup = close
  
  if (closed) {
    return;
  }
  document.body.innerHTML += '<div style="position: fixed;background: black;background: rgba(0, 0, 0, 0.8);padding: 0 1rem 2rem;font-size: 1.2rem;color: white;width: calc(100% - 2rem);bottom: 0;left: 0;line-height: 1.5;text-align: center;max-height: calc(100% - 2rem);overflow: auto;"><p style="font-size: 2rem;">Upozornění</p><p>' + alertMessage + '<a href="#" onclick="closePopup(this)" style="color: white;font-weight: normal;background: #ffffff1f;padding: 0.1em 0.4em;text-decoration: none;margin-left: 1em;border-radius: 0.5em;border: thin solid white;">Skrýt</a><a href="#" onclick="closePopup(this)" style="position: absolute;top: 0;right: 1rem;color: white;border: none;font-size: 2em;">×</a></p><p></p></div>';

})()