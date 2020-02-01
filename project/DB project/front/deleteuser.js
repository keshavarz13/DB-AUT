
function createNode(element) {
  return document.createElement(element);
}

function append(parent, el) {
return parent.appendChild(el);
}

const ul = document.getElementById('show');
const url = 'http://localhost:18888/users';
fetch(url)
.then((resp) => resp.json())
.then(function(data) {

return data.map(function(row) {
  ul.innerHTML += 
  "<tr><td>"+row.NatinalCode+"</td><td>"+row.FirstName+"</td><td>"+row.LastName+"</td><td>"+row.PhoneNumber+"</td><td>"+row.BirthYear+"</td></tr>";
})
})
.catch(function(error) {
console.log(error);
});   
