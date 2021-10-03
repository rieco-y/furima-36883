function cost (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const costVal = itemPrice.value;
    const costPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit")
    costPrice.innerHTML = `${ Math.round(costVal * 0.1) }`;
    profit.innerHTML = `${costVal - (Math.round(costVal * 0.1))}`
  });
};

window.addEventListener('load', cost);