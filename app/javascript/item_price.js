window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const taxRate = 0.1;  
    const tax = Math.floor(inputValue * taxRate);
    const profit = inputValue - tax;

    addTaxDom.innerHTML = tax.toLocaleString(); 
    profitDom.innerHTML = profit.toLocaleString(); 
  });
});