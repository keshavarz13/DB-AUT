async function main () { 
  // const ul = document.getElementById('number');
  // const url = 'http://localhost:18888/NumberOfReciept';
  // await fetch(url)
  // .then((resp) => resp.json())
  // .then(function(data) {
  
  // return data.map(function(row) {
    
  //   ul.innerHTML += Number(row.max)+1;
  // })
  // })
  // .catch(function(error) {
  // console.log(error);
  // });   


  const ul = document.getElementById('show');
  const url = 'http://localhost:18888/deliveries';
  await fetch(url)
  .then((resp) => resp.json())
  .then(function(data) {

  return data.map(function(row) {
    ul.innerHTML += 
    "<tr><td>"+row.NatinalCode+"</td><td>"+row.FirstName+"</td><td>"+row.LastName+"</td><td>"+row.PhoneNumber+"</td></tr>";
  })
  })
  .catch(function(error) {
  console.log(error);
  }); 
}



main();