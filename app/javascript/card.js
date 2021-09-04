const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("donation-button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("donation-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("donation[number]"),
      cvc: formData.get("donation[cvc]"),
      exp_month: formData.get("donation[exp_month]"),
      exp_year: `20${formData.get("donation[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("donation-form");
        const tokenObj = `<input value=${token} name='token' type="hidden" >`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");

      document.getElementById("donation-form").submit();
    });
  });
};

window.addEventListener("load", pay);