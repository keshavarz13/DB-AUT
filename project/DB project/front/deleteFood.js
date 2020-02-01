function createNode(element) {
  return document.createElement(element);
}

function append(parent, el) {
return parent.appendChild(el);
}

const ul = document.getElementById('show');
const url = 'http://localhost:18888/foods';
fetch(url)
.then((resp) => resp.json())
.then(function(data) {

return data.map(function(row) {
  ul.innerHTML += 
  "<tr><td>"+row.FoodId+"</td><td>"+row.Name+"</td><td>"+row.Price+"</td></tr>";
})
})
.catch(function(error) {
console.log(error);
});   
