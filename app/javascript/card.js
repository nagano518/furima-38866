const pay = () => {
  const payjp = Payjp('pk_test_f407082ddf291c08c2304329')
  const elements = payjp.elements()
  const numberElement = elements.create('cardNumber')
  const expiryElement = elements.create('cardExpiry')
  const cvcElement = elements.create('cardCvc')

  numberElement.mount('#card-number')
  expiryElement.mount('#card-exp')
  cvcElement.mount('#card-cvc')

  const submit = document.getElementById("button")

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    })
  })
}

window.addEventListener("load", pay)