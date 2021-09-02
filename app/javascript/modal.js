function CheckInModal () {
  const CheckInButton = document.getElementById("check-in-button");
  CheckInButton.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("check-in-form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/checks", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const CheckInModalButton = document.getElementById("check-in-modal-button"); 
      CheckInModalButton.click();
      setTimeout(function(){
          window.location.href = '/';
        }, 3*1000);
    };
  });
};

function CheckOutModal () {
  const CheckOutButton = document.getElementById("check-out-button");
  CheckOutButton.addEventListener('click', (e) => {
    e.preventDefault();
    const form = document.getElementById("check-out-form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/completes", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const CheckOutModalButton = document.getElementById("check-out-modal-button"); 
      CheckOutModalButton.click();
      setTimeout(function(){
          window.location.href = '/';
        }, 3*1000);
    };
  });
};

window.addEventListener('load', CheckInModal)
window.addEventListener('load', CheckOutModal)