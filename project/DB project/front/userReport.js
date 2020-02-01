import { getHeapCodeStatistics } from "v8";
rn parent.appendChild(el);

async function getData (input){
  alert("slm");
    const ul = document.getElementById('show');
    const url = await 'http://localhost:18888/report/' + input;
    fetch(url)
    .then((resp) => resp.json())
    .then(function(data) {
    return data.map(function(row) {
        
    ul.innerHTML += 
    "<tr><td>"+row.ReceiptId+"</td><td>"+row.price+"</td></tr>";
    })
    })
    .catch(function(error) {
    console.log(error);
    }); 
}

async function handler() {
  alert("slm");
    let input = await document.getElementById("field").value;
    getData(input);
}

  
