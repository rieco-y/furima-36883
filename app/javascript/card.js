const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shopping_list_address_list[number]"),
      cvc: formData.get("shopping_list_address_list[cvc]"),
      exp_month: formData.get("shopping_list_address_list[exp_month]"),
      exp_year: `20${formData.get("shopping_list_address_list[exp_year]")}`,
    };

    Payjp.createToken(card,(status, response) =>{
      if (status == 200){
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const token0bj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", token0bj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);