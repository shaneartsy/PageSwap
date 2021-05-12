const bindingBooks = () => {
  const products = document.querySelectorAll('.product-card-bind')
  const input = document.querySelector('#catalog_item_book')
  products.forEach((product) => {
    product.addEventListener('click', (e) => {
      input.value = product.dataset.id
      product.style.border = "1px solid blue"
    })
  })
}

export { bindingBooks }
