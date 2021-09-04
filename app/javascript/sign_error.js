function SignUpError () {
  const ErrorMessage = document.getElementById("error-message");
  const ErrorMessageContent = ErrorMessage.innerHTML;
  const ErrorDummy = document.getElementById("error-dummy");

  if (ErrorMessageContent) {
    ErrorDummy.setAttribute("style", "display: none;");
  };
};

function SignInError () {
  const AlertDevise = document.getElementById("alert-devise");
  const AlertDeviseContent = AlertDevise.innerHTML;
  const AlertSelf = document.getElementById("alert-self")

  if (AlertDeviseContent) {
    AlertDevise.setAttribute("style", "display: none;")
    AlertSelf.setAttribute("style", "display: block;")
  }
};

window.addEventListener('load', SignUpError)
window.addEventListener('load', SignInError)