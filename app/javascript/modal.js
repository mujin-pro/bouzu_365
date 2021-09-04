function CheckModal () {
  const CheckButton = document.getElementById("check-button");
  CheckButton.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("check-form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/checks", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const CheckModalButton = document.getElementById("check-modal-button"); 
      CheckModalButton.click();
      setTimeout(function(){
          window.location.href = '/';
        }, 3*1000);
    };
  });
};

function CompleteModal () {
  const CompleteButton = document.getElementById("complete-button");
  CompleteButton.addEventListener('click', (e) => {
    e.preventDefault();
    const form = document.getElementById("complete-form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/completes", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const CompleteModalButton = document.getElementById("complete-modal-button"); 
      CompleteModalButton.click();
      setTimeout(function(){
          window.location.href = '/';
        }, 3*1000);
    };
  });
};

window.addEventListener('load', CheckModal)
window.addEventListener('load', CompleteModal)