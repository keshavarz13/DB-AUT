
 

async function main () { 
    const ul = document.getElementById("tot2"); 
    const url = 'http://localhost:18888/sumShoppings';
    fetch(url)
    .then((resp) => resp.json())
    .then(function(data) {
      return data.map(function(row) {
        ul.innerHTML +="  "+ row.price;
      })
    })
    .catch(function(error) {
    console.log(error);
    });   
  }
  
  
  
  main();