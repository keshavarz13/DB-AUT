var mysql = require('mysql');





//---------------------------------------------------------------------------------------------------------------------------------
//this function create tables
//---------------------------------------------------------------------------------------------------------------------------------

export async  function createTable ( select ) {
    var con = await mysql.createConnection({
      host: "localhost",
      user: "root",
      database: "db_final_project"
    });
    con.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
    });
    
    if (select == 0) { 
            //market
            var sql = "DROP TABLE market ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            });
            var sql = "CREATE TABLE `market` ( `MarketId` int(11) NOT NULL,`Name` varchar(50) NOT NULL, `IsActive` tinyint(1) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            console.log("market table added");
            });
            sql = "ALTER TABLE `market` ADD PRIMARY KEY (`MarketId`)";
            con.query(sql, function (err, result) {
                if (err) throw err;
            });

    }else if (select == 1) { 
           //food
           var sql = "DROP TABLE food ";
           con.query(sql, function (err, result) {
             if (err) throw err;
           });
           var sql = "CREATE TABLE `food` (  `FoodId` int(11) NOT NULL,  `Name` varchar(50) NOT NULL,  `Price` float NOT NULL, `IsActive` tinyint(1) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4";
           con.query(sql, function (err, result) {
             if (err) throw err;
             console.log("food table added");
           });
           sql = "ALTER TABLE `food` ADD PRIMARY KEY (`FoodId`)";
           con.query(sql, function (err, result) {
               if (err) throw err;
             });

    }else if (select == 2) { 
            //delivery
            var sql = "DROP TABLE delivery ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            });
            var sql = "CREATE TABLE `delivery` (  `NatinalCode` varchar(10) NOT NULL,  `FirstName` varchar(50) NOT NULL,  `LastName` varchar(50) NOT NULL,  `PhoneNumber` varchar(11) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            console.log("food table added");
            });
            sql = "ALTER TABLE `delivery` ADD PRIMARY KEY (`NatinalCode`)";
            con.query(sql, function (err, result) {
                if (err) throw err;
            });

    }else if (select == 3) { 
            //customer
            var sql = "DROP TABLE customer ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            });
            var sql = "CREATE TABLE `customer` (  `NatinalCode` varchar(10) NOT NULL,  `FirstName` varchar(50) NOT NULL,  `LastName` varchar(50) NOT NULL,  `PhoneNumber` varchar(11) NOT NULL,  `BirthYear` int(5) NOT NULL) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            console.log("food table added");
            });
            sql = "ALTER TABLE `customer`  ADD PRIMARY KEY (`NatinalCode`)";
            con.query(sql, function (err, result) {
                if (err) throw err;
            });

    }else if (select == 4) { 

    }else if (select == 5) { 

    }
   
}


//---------------------------------------------------------------------------------------------------------------------------------
//this function drop tables
//---------------------------------------------------------------------------------------------------------------------------------

export async function dropTable ( select ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });
  
    if (select == 0) { 
            //market
            var sql = "DROP TABLE market ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            });
      
    }else if (select == 1) { 
           //food
           var sql = "DROP TABLE food ";
           con.query(sql, function (err, result) {
             if (err) throw err;
           });

    }else if (select == 2) { 
            //delivery
            var sql = "DROP TABLE delivery ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            });

    }else if (select == 3) { 
            //customer
            var sql = "DROP TABLE customer ";
            con.query(sql, function (err, result) {
            if (err) throw err;
            });

    }else if (select == 4) { 

    }else if (select == 5) { 

    }
   
}


//---------------------------------------------------------------------------------------------------------------------------------
// create sales receipt
//---------------------------------------------------------------------------------------------------------------------------------


export async function addReciept (Address, DeliveryId , UserId){
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });
  
    con.query("SELECT max(ReceiptId) as max FROM `sales_receipt`", function (err, result, fields) {
        if (err) throw err;
        var newTuple = result[0].max + 1;
        
            var sql = "INSERT INTO `sales_receipt`(`ReceiptId`, `Address`, `DeliveryId`, `UserId`) VALUES ("+newTuple+",'"+Address+"',"+DeliveryId+","+UserId+")";
            con.query(sql, function (err, result) {
                if (err) throw err;
                console.log("Reciept added");
            });
      });
}


export async function addFoodToReciept (FoodId) { 
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });
  
    con.query("SELECT max(ReceiptId) as max FROM `sales_receipt`", function (err, result, fields) {
        if (err) throw err;
        var RecieptId = result[0].max ;
        
        var sql = "INSERT INTO `foo_rec` (`FoodId`, `receiptId`) VALUES ('"+FoodId+"' , '"+RecieptId+"' )";
        con.query(sql, function (err, result) {
            if (err) throw err;
        });
      });
}

//---------------------------------------------------------------------------------------------------------------------------------
// create shopping receipt
//---------------------------------------------------------------------------------------------------------------------------------

export async function addShoppingReciept (MarketId){
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });
  
  con.query("SELECT max(ReceiptId) as max FROM `shopping_receipt`", function (err, result, fields) {
      if (err) throw err;
      var newTuple = result[0].max + 1;
      
          var sql = "INSERT INTO `shopping_receipt` (`ReceiptId`, `MarketId`) VALUES ("+newTuple+", '"+MarketId+"')";
          con.query(sql, function (err, result) {
              if (err) throw err;
              console.log("Reciept added");
          });
    });
}
 
export async function addFoodToShoppingReciept (MaterialId) { 
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });
  
  con.query("SELECT max(ReceiptId) as max FROM `shopping_receipt`", function (err, result, fields) {
      if (err) throw err;
      var RecieptId = result[0].max ;
      
      var sql = "INSERT INTO `mat_rec`(`MaterialId`, `receiptId`) VALUES ('"+MaterialId+"' , '"+RecieptId+"' )";
      con.query(sql, function (err, result) {
          if (err) throw err;
      });
    });
}

//---------------------------------------------------------------------------------------------------------------------------------
// manager report
//---------------------------------------------------------------------------------------------------------------------------------

 async function resultOfSales (){
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  await con.connect(function(err) {
    if (err) throw err;
    console.log("im Connected!");
  });
  
  var sql = "select ReceiptId , sum(food.Price) as totalPrice from foo_rec NATURAL JOIN food WHERE food.IsActive = 1 and ReceiptId in ( select receiptId  FROM sales_receipt as T where T.Date = CURRENT_DATE) GROUP BY ReceiptId";
  const res = await con.query(sql ,result).result;
  console.log(res.result);
}



export async function sumOfSales () { 
  var sql = "select SUM(S.totalPrice) as price FROM(select ReceiptId , sum(food.Price) as totalPrice from foo_rec NATURAL JOIN food WHERE food.IsActive = 1 and ReceiptId in ( select receiptId FROM sales_receipt as T where T.Date = CURRENT_DATE) GROUP BY ReceiptId) as S";
  try { 
    console.log(con.query(sql , result).result);
    console.log(output); 
  }
  catch{}
 
}


export async  function resultOfShopping (){

  var sql = "select ReceiptId , sum(material.Price) as totalPrice from mat_rec NATURAL JOIN material WHERE material.IsActive = 1 and ReceiptId in ( select receiptId FROM shopping_receipt as T where T.Date = CURRENT_DATE) GROUP BY ReceiptId";
  let result;
  await con.query(sql, result);
  console.log(result);
}


export async  function sumOfShopping() { 
  var sql = "select SUM(S.totalPrice) as price FROM(select ReceiptId , sum(material.Price) as totalPrice from mat_rec NATURAL JOIN material WHERE material.IsActive = 1 and ReceiptId in ( select receiptId FROM shopping_receipt as T where T.Date = CURRENT_DATE) GROUP BY ReceiptId ) as S";
  con.query(sql, function (err, result) {
      if (err) throw err;
      // let output = await result; 
      // return output;
  });
}

resultOfSales();










