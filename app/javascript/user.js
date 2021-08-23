document.onkeyup = e => {
  const UserName = document.getElementById("user_name");
  const NameDummy = document.getElementById("name-dummy");
  const NameSuccess = document.getElementById("name-success");
  const NameBlank = document.getElementById("name-blank");
  const NameNil = document.getElementById("name-nil");
  const NameLength = document.getElementById("name-length");
  const InputName = UserName.value;
  const InputNameLength = InputName.length
  
  if (InputName.match(/\s/)) {
    UserName.setAttribute("class", "form-control is-invalid")
    UserName.setAttribute("style", "red");
    NameDummy.setAttribute("style", "display:none !important");
    NameSuccess.setAttribute("style", "display:none !important");
    NameBlank.setAttribute("style", "display:block");
    NameNil.setAttribute("style", "display:none !important");
    NameLength.setAttribute("style", "display:none !important");
  }
  else if (InputName == '') {
    UserName.setAttribute("class", "form-control");
    UserName.setAttribute("style", "blue");
    NameDummy.setAttribute("style", "display:none !important");
    NameSuccess.setAttribute("style", "display:none !important");
    NameBlank.setAttribute("style", "display:none !important");
    NameNil.setAttribute("style", "display:block");
    NameLength.setAttribute("style", "display:none !important");
  }
  else if (InputNameLength > 20) {
    UserName.setAttribute("class", "form-control is-invalid");
    UserName.setAttribute("style", "red");
    NameDummy.setAttribute("style", "display:none !important");
    NameSuccess.setAttribute("style", "display:none !important");
    NameBlank.setAttribute("style", "display:none !important");
    NameNil.setAttribute("style", "display:none !important");
    NameLength.setAttribute("style", "display:block !important");
  }
  else {
    UserName.setAttribute("class", "form-control is-valid");
    UserName.setAttribute("style", "green");
    NameDummy.setAttribute("style", "display:none !important");
    NameSuccess.setAttribute("style", "display:block");
    NameBlank.setAttribute("style", "display:none !important");
    NameNil.setAttribute("style", "display:none !important");
    NameLength.setAttribute("style", "display:none !important");
  };

  const UserEmail = document.getElementById("user_email"); 
  const EmailDummy = document.getElementById("email-dummy");
  const EmailSuccess = document.getElementById("email-success");
  const EmailError = document.getElementById("email-error");
  const EmailBlank = document.getElementById("email-blank");
  const EmailNil = document.getElementById("email-nil");
  const InputEmail = UserEmail.value;
  const EmailReg = /^[A-Za-z0-9]{1}[A-Za-z0-9_.-]*@{1}[A-Za-z0-9_.-]{1,}.[A-Za-z0-9]{1,}$/;
  
  if (InputEmail.match(/\s/)) {
    UserEmail.setAttribute("class", "form-control is-invalid");
    UserEmail.setAttribute("style", "red");
    EmailDummy.setAttribute("style", "display:none !important");
    EmailSuccess.setAttribute("style", "display:none !important");
    EmailError.setAttribute("style", "display:none !important");
    EmailBlank.setAttribute("style", "display:block");
    EmailNil.setAttribute("style", "display:none !important");
  }
  else if (InputEmail == '') {
    UserEmail.setAttribute("class", "form-control");
    UserEmail.setAttribute("style", "blue");
    EmailDummy.setAttribute("style", "display:none !important");
    EmailSuccess.setAttribute("style", "display:none !important");
    EmailError.setAttribute("style", "display:none !important");
    EmailBlank.setAttribute("style", "display:none !important");
    EmailNil.setAttribute("style", "display:block");
  }
  else if (EmailReg.test(InputEmail)) {
    UserEmail.setAttribute("class", "form-control is-valid");
    UserEmail.setAttribute("style", "green");
    EmailDummy.setAttribute("style", "display:none !important");
    EmailSuccess.setAttribute("style", "display:block");
    EmailError.setAttribute("style", "display:none !important");
    EmailBlank.setAttribute("style", "display:none !important");
    EmailNil.setAttribute("style", "display:none !important");
    }
  else {
    UserEmail.setAttribute("class", "form-control is-invalid");
    UserEmail.setAttribute("style", "red");
    EmailDummy.setAttribute("style", "display:none !important");
    EmailSuccess.setAttribute("style", "display:none !important");
    EmailError.setAttribute("style", "display:block");
    EmailBlank.setAttribute("style", "display:none !important");
    EmailNil.setAttribute("style", "display:none !important");
  };

  const UserPassword = document.getElementById("user_password"); 
  const PasswordDummy = document.getElementById("password-dummy");
  const PasswordSuccess = document.getElementById("password-success");
  const PasswordError = document.getElementById("password-error");
  const PasswordBlank = document.getElementById("password-blank");
  const PasswordNil = document.getElementById("password-nil");
  const InputPassword = UserPassword.value;
  const PasswordReg = /^([a-zA-Z0-9]{6,})$/;
  
  if (InputPassword.match(/\s/)) {
    UserPassword.setAttribute("class", "form-control is-invalid");
    UserPassword.setAttribute("style", "red");
    PasswordDummy.setAttribute("style", "display:none !important");
    PasswordSuccess.setAttribute("style", "display:none !important");
    PasswordError.setAttribute("style", "display:none !important");
    PasswordBlank.setAttribute("style", "display:block");
    PasswordNil.setAttribute("style", "display:none !important");
  }
  else if (InputPassword == '') {
    UserPassword.setAttribute("class", "form-control");
    UserPassword.setAttribute("style", "blue");
    PasswordDummy.setAttribute("style", "display:none !important");
    PasswordSuccess.setAttribute("style", "display:none !important");
    PasswordError.setAttribute("style", "display:none !important");
    PasswordBlank.setAttribute("style", "display:none !important");
    PasswordNil.setAttribute("style", "display:block");
  }
  else if (PasswordReg.test(InputPassword)) {
    UserPassword.setAttribute("class", "form-control is-valid");
    UserPassword.setAttribute("style", "green");
    PasswordDummy.setAttribute("style", "display:none !important");
    PasswordSuccess.setAttribute("style", "display:block");
    PasswordError.setAttribute("style", "display:none !important");
    PasswordBlank.setAttribute("style", "display:none !important");
    PasswordNil.setAttribute("style", "display:none !important");
    }
  else {
    UserPassword.setAttribute("class", "form-control is-invalid");
    UserPassword.setAttribute("style", "red");
    PasswordDummy.setAttribute("style", "display:none !important");
    PasswordSuccess.setAttribute("style", "display:none !important");
    PasswordError.setAttribute("style", "display:block");
    PasswordBlank.setAttribute("style", "display:none !important");
    PasswordNil.setAttribute("style", "display:none !important");
  };

  const UserPasswordConfirmation = document.getElementById("user_password_confirmation"); 
  const PasswordConfirmationDummy = document.getElementById("password-confirmation-dummy");
  const PasswordConfirmationSuccess = document.getElementById("password-confirmation-success");
  const PasswordConfirmationError = document.getElementById("password-confirmation-error");
  const PasswordConfirmationBlank = document.getElementById("password-confirmation-blank");
  const PasswordConfirmationNil = document.getElementById("password-confirmation-nil");
  const InputPasswordConfirmation = UserPasswordConfirmation.value;
  const PasswordConfirmationReg = /^([a-zA-Z0-9]{6,})$/;
  
  if (InputPasswordConfirmation.match(/\s/)) {
    UserPasswordConfirmation.setAttribute("class", "form-control is-invalid");
    UserPasswordConfirmation.setAttribute("style", "red");
    PasswordConfirmationDummy.setAttribute("style", "display:none !important");
    PasswordConfirmationSuccess.setAttribute("style", "display:none !important");
    PasswordConfirmationError.setAttribute("style", "display:none !important");
    PasswordConfirmationBlank.setAttribute("style", "display:block");
    PasswordConfirmationNil.setAttribute("style", "display:none !important");
  }
  else if (InputPasswordConfirmation == '') {
    UserPasswordConfirmation.setAttribute("class", "form-control");
    UserPasswordConfirmation.setAttribute("style", "blue");
    PasswordConfirmationDummy.setAttribute("style", "display:none !important");
    PasswordConfirmationSuccess.setAttribute("style", "display:none !important");
    PasswordConfirmationError.setAttribute("style", "display:none !important");
    PasswordConfirmationBlank.setAttribute("style", "display:none !important");
    PasswordConfirmationNil.setAttribute("style", "display:block");
  }
  else if (PasswordConfirmationReg.test(InputPasswordConfirmation) && InputPasswordConfirmation == InputPassword) {
    UserPasswordConfirmation.setAttribute("class", "form-control is-valid");
    UserPasswordConfirmation.setAttribute("style", "green");
    PasswordConfirmationDummy.setAttribute("style", "display:none !important");
    PasswordConfirmationSuccess.setAttribute("style", "display:block");
    PasswordConfirmationError.setAttribute("style", "display:none !important");
    PasswordConfirmationBlank.setAttribute("style", "display:none !important");
    PasswordConfirmationNil.setAttribute("style", "display:none !important");
    }
  else {
    UserPasswordConfirmation.setAttribute("class", "form-control is-invalid");
    UserPasswordConfirmation.setAttribute("style", "red");
    PasswordConfirmationDummy.setAttribute("style", "display:none !important");
    PasswordConfirmationSuccess.setAttribute("style", "display:none !important");
    PasswordConfirmationError.setAttribute("style", "display:block");
    PasswordConfirmationBlank.setAttribute("style", "display:none !important");
    PasswordConfirmationNil.setAttribute("style", "display:none !important");
  };

  const UserMission = document.getElementById("user_mission"); 
  const MissionDummy = document.getElementById("mission-dummy");
  const MissionSuccess = document.getElementById("mission-success");
  const MissionError = document.getElementById("mission-error");
  const MissionNil = document.getElementById("mission-nil");
  const InputMission = UserMission.value;
  
  if (InputMission == '') {
    UserMission.setAttribute("class", "form-control");
    MissionDummy.setAttribute("style", "display:none !important");
    MissionSuccess.setAttribute("style", "display:none !important");
    MissionError.setAttribute("style", "display:none !important");
    MissionNil.setAttribute("style", "display:block");
  }
  else if (InputMission.length > 50) {
    UserMission.setAttribute("class", "form-control is-invalid");
    UserMission.setAttribute("style", "red");
    MissionDummy.setAttribute("style", "display:none !important");
    MissionSuccess.setAttribute("style", "display:none !important");
    MissionError.setAttribute("style", "display:block");
    MissionNil.setAttribute("style", "display:none !important");
    }
  else {
    UserMission.setAttribute("class", "form-control is-valid");
    UserMission.setAttribute("style", "green");
    MissionDummy.setAttribute("style", "display:none !important");
    MissionSuccess.setAttribute("style", "display:block");
    MissionError.setAttribute("style", "display:none !important");
    MissionNil.setAttribute("style", "display:none !important");
  };

  const UserCurrentPassword = document.getElementById("user_current_password"); 
  const CurrentPasswordDummy = document.getElementById("current-password-dummy");
  const CurrentPasswordSuccess = document.getElementById("current-password-success");
  const CurrentPasswordError = document.getElementById("current-password-error");
  const CurrentPasswordBlank = document.getElementById("current-password-blank");
  const CurrentPasswordNil = document.getElementById("current-password-nil");
  const InputCurrentPassword = UserCurrentPassword.value;
  const CurrentPasswordReg = /^([a-zA-Z0-9]{6,})$/;
  
  if (InputCurrentPassword.match(/\s/)) {
    UserCurrentPassword.setAttribute("class", "form-control is-invalid");
    UserCurrentPassword.setAttribute("style", "red");
    CurrentPasswordDummy.setAttribute("style", "display:none !important");
    CurrentPasswordSuccess.setAttribute("style", "display:none !important");
    CurrentPasswordError.setAttribute("style", "display:none !important");
    CurrentPasswordBlank.setAttribute("style", "display:block");
    CurrentPasswordNil.setAttribute("style", "display:none !important");
  }
  else if (InputCurrentPassword == '') {
    UserCurrentPassword.setAttribute("class", "form-control");
    UserCurrentPassword.setAttribute("style", "blue");
    CurrentPasswordDummy.setAttribute("style", "display:none !important");
    CurrentPasswordSuccess.setAttribute("style", "display:none !important");
    CurrentPasswordError.setAttribute("style", "display:none !important");
    CurrentPasswordBlank.setAttribute("style", "display:none !important");
    CurrentPasswordNil.setAttribute("style", "display:block");
  }
  else if (CurrentPasswordReg.test(InputCurrentPassword)) {
    UserCurrentPassword.setAttribute("class", "form-control is-valid");
    UserCurrentPassword.setAttribute("style", "green");
    CurrentPasswordDummy.setAttribute("style", "display:none !important");
    CurrentPasswordSuccess.setAttribute("style", "display:block");
    CurrentPasswordError.setAttribute("style", "display:none !important");
    CurrentPasswordBlank.setAttribute("style", "display:none !important");
    CurrentPasswordNil.setAttribute("style", "display:none !important");
    }
  else {
    UserCurrentPassword.setAttribute("class", "form-control is-invalid");
    UserCurrentPassword.setAttribute("style", "red");
    CurrentPasswordDummy.setAttribute("style", "display:none !important");
    CurrentPasswordSuccess.setAttribute("style", "display:none !important");
    CurrentPasswordError.setAttribute("style", "display:block");
    CurrentPasswordBlank.setAttribute("style", "display:none !important");
    CurrentPasswordNil.setAttribute("style", "display:none !important");
  };
};

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

function CheckInModal () {
  const CheckInButton = document.getElementById("check-in-button");
  const CheckInModalButton = document.getElementById("check-in-modal-button"); 
  CheckInButton.addEventListener('click', function() {
    CheckInModalButton.click();
    setTimeout(function(){
      window.location.href = 'http://localhost:3000/';
    }, 3*1000);
  });
};

function CheckOutModal () {
  const CheckOutButton = document.getElementById("check-out-button");
  const CheckOutModalButton = document.getElementById("check-out-modal-button"); 
  CheckOutButton.addEventListener('click', function() {
    CheckOutModalButton.click();
    setTimeout(function(){
      window.location.href = 'http://localhost:3000/';
    }, 3*1000);
  });
};

window.addEventListener('load', SignUpError)
window.addEventListener('load', SignInError)
window.addEventListener('load', CheckInModal)
window.addEventListener('load', CheckOutModal)