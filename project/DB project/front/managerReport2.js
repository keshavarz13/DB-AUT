async function main () { 
  const ul = document.getElementById('show2');
  const url = 'http://localhost:18888/shoppings';
  fetch(url)
  .then((resp) => resp.json())
  .then(function(data) {
    return data.map(function(row) {
      ul.innerHTML += 
      "<tr><td>"+row.ReceiptId+"</td><td>"+row.totalPrice+"</td></tr>";
    })
  })
  .catch(function(error) {
  console.log(error);
  });   
}

main();

