const express = require('express');
const db = require("./DbManager");


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//config server
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
const app = express();

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "*");
    res.header("Access-Control-Allow-Methods", "*");
    next();
});

app.use(express.json());
app.use(express.urlencoded({extended : false}));


//-------------------------------------------------------------------------------
//user
//-------------------------------------------------------------------------------
app.post('/adduser', async (req, res) => {
    res.send(db.addUser(req.body.national_code , req.body.first_name , req.body.last_namet ,req.body.phone_number , req.body.age, req.body.Address, req.body.AdName, req.body.AdNumber  ));
});

app.post('/edituser', async (req, res) => {    
    res.send(db.editUser(req.body.national_code , req.body.first_name , req.body.last_namet ,req.body.phone_number , req.body.age));
});

app.post('/deletuser', async (req, res) => {    
    res.send(db.deleteUser(req.body.national_code));
});

//-------------------------------------------------------------------------------
//delivery
//-------------------------------------------------------------------------------
app.post('/adddelivery', async (req, res) => {    
    res.send(db.addDelivery(req.body.national_code , req.body.first_name , req.body.last_namet ,req.body.phone_number ));
});

app.post('/deletedelivery', async (req, res) => {    
    res.send(db.deleteDelivery(req.body.national_code));
});
app.post('/editdelivery', async (req, res) => {    
    res.send(db.editDelivery(req.body.national_code , req.body.first_name , req.body.last_namet ,req.body.phone_number ));
});

//-------------------------------------------------------------------------------
//food
//-------------------------------------------------------------------------------
app.post('/addFood', async (req, res) => {    
    res.send(db.addFood(req.body.Name , req.body.Price ,req.body.Active = 'on'? 1 : 0));
});

app.post('/deleteFood', async (req, res) => {    
    res.send(db.deleteFood(req.body.ID));
});
app.post('/editFood', async (req, res) => {    
    res.send(db.editFood(req.body.ID, req.body.Name , req.body.Price ,req.body.Active = 'on'? 1 : 0));
});

//-------------------------------------------------------------------------------
//market
//-------------------------------------------------------------------------------
app.post('/addMarket', async (req, res) => {    
    res.send(db.addMarket(req.body.Name , req.body.Active = 'on'? 1 : 0));
});
app.post('/deleteMarket', async (req, res) => {    
    res.send(db.deleteMarket(req.body.ID));
});
app.post('/editMarket', async (req, res) => {  
    res.send(db.editMarket(req.body.ID, req.body.Name , req.body.Active = 'on'? 1 : 0));
});


//-------------------------------------------------------------------------------
//get tables 
//-------------------------------------------------------------------------------
app.get('/users', async (req, res) => {  
    res.send(await db.users());
});
app.get('/deliveries', async (req, res) => {  
    res.send(await db.deliveies());
});
app.get('/foods', async (req, res) => {  
    res.send(await db.foods());
});
app.get('/markets', async (req, res) => {  
    res.send(await db.markets());
});


//-------------------------------------------------------------------------------
//manager
//-------------------------------------------------------------------------------
app.get('/sales', async (req, res) => {  
    res.send(await db.resultOfSales());
});
app.get('/sumSales', async (req, res) => {  
    res.send(await db.sumOfSales());
});
app.get('/shoppings', async (req, res) => {  
    res.send(await db.resultOfShopping());
});
app.get('/sumShoppings', async (req, res) => {  
    res.send(await db.sumOfShopping());
});

//-------------------------------------------------------------------------------
//user report
//-------------------------------------------------------------------------------
app.get('/report/:id', async (req, res) => {  
    res.send(await db.userReports(req.params.id));
});

//-------------------------------------------------------------------------------
//add receipt
//-------------------------------------------------------------------------------
app.get('/NumberOfReciept', async (req, res) => {  
    res.send(await db.numberOfReciept());
});
app.post('/addAnonymousSalesReciept', async (req, res) => {  
    res.send(db.addReciept(req.body.Address = ''? null : req.body.Address , req.body.DeliveryId , null));
});
app.post('/addFoodToReciept', async (req, res) => {  
    res.send(db.addFoodToReciept(req.body.FoodId  , req.body.RecieptId));
});
app.post('/addUserSalesReciept', async (req, res) => {  
    res.send(db.addUserReciept(req.body.DeliveryId, req.body.UserId , req.body.AdName));
});


//-------------------------------------------------------------------------------
//add shopping receipt
//-------------------------------------------------------------------------------
app.get('/NumberOfShoppingReciept', async (req, res) => {  
    res.send(await db.numberOfShoppingReciept());
});
app.post('/addShoppingReciept', async (req, res) => {  
    res.send(db.addShoppingReciept( req.body.MarketId ));
});
app.post('/addMaterialToReciept', async (req, res) => {  
    res.send(db.addMaterialToReciept(req.body.MaterialId  , req.body.RecieptId));
});
app.get('/materials', async (req, res) => {  
    res.send(await db.materials());
});

//-------------------------------------------------------------------------------
//logs
//-------------------------------------------------------------------------------
app.get('/customerLogs', async (req, res) => {  
    res.send(await db.customerLogs());
});
app.get('/addressLogs', async (req, res) => {  
    res.send(await db.addressLogs());
});
app.get('/deliveryLogs', async (req, res) => {  
    res.send(await db.deliveryLogs());
});
app.get('/foodLogs', async (req, res) => {  
    res.send(await db.foodLogs());
});
app.get('/marketLogs', async (req, res) => {  
    res.send(await db.marketLogs());
});
app.get('/salesReceiptLogs', async (req, res) => {  
    res.send(await db.salesReceiptLogs());
});
app.get('/shoppingReceiptLogs', async (req, res) => {  
    res.send(await db.shoppingReceiptLogs());
});

//-------------------------------------------------------------------------------
//create table
//-------------------------------------------------------------------------------
app.get('/report/:id', async (req, res) => {  
    res.send(await db.userReports(req.params.id));
});


//-------------------------------------------------------------------------------
//create table
//-------------------------------------------------------------------------------
app.get('/createTable/:id', async (req, res) => {  
    res.send(await db.createTable(req.params.id));
});


//-------------------------------------------------------------------------------
//drop table
//-------------------------------------------------------------------------------
app.get('/dropTable/:id', async (req, res) => {  
    res.send(await db.dropTable(req.params.id));
});


//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//run server
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
app.listen(18888, () => {
    console.log('Server is up and running on port: ' + 18888);
});