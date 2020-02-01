async function main () { 
  const ul = document.getElementById('number');
  const url = 'http://localhost:18888/NumberOfShoppingReciept';
  await fetch(url)
  .then((resp) => resp.json())
  .then(function(data) {
  
  return data.map(function(row) {
    
    ul.innerHTML += Number(row.max)+1;
  })
  })
  .catch(function(error) {
  console.log(error);
  });   
}



main();