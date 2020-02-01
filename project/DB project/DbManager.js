var mysql = require('mysql');
const { Sequelize, Model, DataTypesو } = require('sequelize');
const { QueryTypes } = require('sequelize');

//---------------------------------------------------------------------------------------------------------------------------------
//this function create tables
//---------------------------------------------------------------------------------------------------------------------------------

exports.createTable =  async  function  ( select ) {
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

  }
 
}


//---------------------------------------------------------------------------------------------------------------------------------
//this function drop tables
//---------------------------------------------------------------------------------------------------------------------------------

exports.dropTable =  async function  ( select ) {
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

  }
}




//---------------------------------------------------------------------------------------------------------------------------------
//this functions add tupel to customer, delivery, food and market tables 
//---------------------------------------------------------------------------------------------------------------------------------

exports.addUser =  async function  ( nationalCode , firstName , lastName , phoneNumber , birthYear , Address , AdName , AdNumber) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
  
  var sql = "INSERT INTO `customer` (`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`, `BirthYear`) VALUES ('"+nationalCode+ "', '"+firstName+ "', '"+lastName+ "', '"+phoneNumber+ "', '"+birthYear+ "')";
  con.query(sql, function (err, result) {
    if (err) return("an error occured");
    console.log("user added");
  });
  

  con.query("SELECT max(AddressId) as max FROM `address`", function (err, result, fields) {
    if (err) return("an error occured");
    var AddresId = result[0].max + 1;
    var sql = "INSERT INTO `address`(`AddressId`, `UserId`, `address`, `name`, `PhoneNumber`) VALUES ("+AddresId+",'"+nationalCode+"','"+Address+"','"+AdName+"','"+AdNumber+"')";
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("food added");
    });
  });

    return ("" + firstName + "added! :)");
};



exports.addDelivery = async function  ( nationalCode , firstName , lastName , phoneNumber ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    var sql = "INSERT INTO `delivery` (`NatinalCode`, `FirstName`, `LastName`, `PhoneNumber`) VALUES ('"+nationalCode+ "', '"+firstName+ "', '"+lastName+ "', '"+phoneNumber+ "')";
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("delivery added");
    });
};


exports.addFood = async function  ( Name , Price , IsActive ) {
    // console.log(Name);
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
    con.query("SELECT max(FoodId) as max FROM `food`", function (err, result, fields) {
        if (err) return("an error occured");
        var FoodId = result[0].max + 1;
        var sql = "INSERT INTO `food` (`FoodId`, `Name`, `Price`, `IsActive`) VALUES ("+FoodId+", '"+Name+"', '"+Price+"', '"+IsActive+"')";
        con.query(sql, function (err, result) {
          if (err) return("an error occured");
          console.log("food added");
        });
      });
};


 
exports.addMarket = async function  ( Name , IsActive ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
  con.query("SELECT max(MarketId) as max FROM `market`", function (err, result, fields) {
    if (err) return("an error occured");
    var MarketId = result[0].max + 1;
  
    var sql = "INSERT INTO `market` (`MarketId`, `Name`, `IsActive`) VALUES ('"+MarketId+"', '"+Name+"', '"+IsActive+"')";
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("market added");
    });
  });

};

//---------------------------------------------------------------------------------------------------------------------------------
//this functions delete tupel from customer, delivery, food and market tables 
//---------------------------------------------------------------------------------------------------------------------------------

exports.deleteUser = async function  ( nationalCode ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    var sql = "DELETE FROM `customer` WHERE NatinalCode = '"+nationalCode +"'";
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("user deleted");
    });
};


exports.deleteDelivery = async function  ( nationalCode  ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    var sql = "DELETE FROM `delivery` WHERE NatinalCode = '"+nationalCode +"'";
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("delivery deleted");
    });
};


exports.deleteFood = async function  ( FoodId ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    var sql = "DELETE from food WHERE FoodId = "+FoodId;
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("food deleted");
    });
};



exports.deleteMarket = async function  ( MarketId) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    var sql = "DELETE from market WHERE MarketId = "+MarketId;
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("market deleted");
    });
};

//---------------------------------------------------------------------------------------------------------------------------------
//this functions edit tupel of customer, delivery, food and market tables 
//---------------------------------------------------------------------------------------------------------------------------------

exports.editUser = async function  ( nationalCode , firstName , lastName , phoneNumber , birthYear) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    var sql = "UPDATE `customer` SET`FirstName`='"+firstName+"',`LastName`='"+lastName+"',`PhoneNumber`='"+phoneNumber+"',`BirthYear`='"+birthYear+"' WHERE NatinalCode = '"+nationalCode+"'";
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("user edited");
    });
};


exports.editDelivery = async function  ( nationalCode , firstName , lastName , phoneNumber ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    var sql = "UPDATE `delivery` SET`FirstName`='"+firstName+"',`LastName`='"+lastName+"',`PhoneNumber`='"+phoneNumber+"' WHERE NatinalCode = '"+nationalCode+"'";
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("delivery edited");
    });
};



exports.editFood = async function  ( FoodId , Name , Price , IsActive ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    con.query("SELECT max(FoodId) as max FROM `food`", function (err, result, fields) {
        if (err) return("an error occured");
        var newTuple = result[0].max + 1;
            var sql = "INSERT INTO `food` (`FoodId`, `Name`, `Price`, `IsActive`) VALUES ( " +newTuple+ ", '"+Name+"', '"+Price+"', '"+IsActive+"')";
            con.query(sql, function (err, result) {
            if (err) return("an error occured");
            console.log("food edited");
            });
            sql = "UPDATE `food` SET`Isactive`='"+0+"' WHERE FoodId = '"+FoodId+"'";
            con.query(sql, function (err, result) {
                if (err) return("an error occured");
                console.log("");
            });
      });
};


exports.editMarket = async function  ( MarketId , Name , IsActive ) {
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) return("an error occured");
    console.log("Connected!");
  });
  
    var sql = "UPDATE `market` SET`Name`='"+Name+"',`IsActive`='"+IsActive+"' WHERE MarketId = '"+MarketId+"'";
    con.query(sql, function (err, result) {
      if (err) return("an error occured");
      console.log("market edited");
    });
};

//---------------------------------------------------------------------------------------------------------------------------------
//this functions return customer, delivery, food and market tables 
//---------------------------------------------------------------------------------------------------------------------------------

exports.users =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from customer  ", { type: QueryTypes.SELECT });
  return(res);
};

exports.deliveies =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from delivery  ", { type: QueryTypes.SELECT });
  return(res);
};

exports.foods =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from food where IsActive = 1  ", { type: QueryTypes.SELECT });
  return(res);
};

exports.markets =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from market where IsActive = 1  ", { type: QueryTypes.SELECT });
  return(res);
};

//---------------------------------------------------------------------------------------------------------------------------------
// manager report
//---------------------------------------------------------------------------------------------------------------------------------
exports.resultOfSales =  async function  (){

    const sequelize = new Sequelize('db_final_project', 'root', '', {
        dialect: 'mysql'
      })
    const res = await sequelize.query("select ReceiptId , sum(food.Price) as totalPrice from foo_rec NATURAL JOIN food WHERE food.IsActive = 1 and ReceiptId in ( select receiptId  FROM sales_receipt as T where T.Date = CURRENT_DATE) GROUP BY ReceiptId", { type: QueryTypes.SELECT });
    return(res);
};

exports.sumOfSales =  async function  () { 
  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select SUM(S.totalPrice) as price FROM(select ReceiptId , sum(food.Price) as totalPrice from foo_rec NATURAL JOIN food WHERE food.IsActive = 1 and ReceiptId in ( select receiptId FROM sales_receipt as T where T.Date = CURRENT_DATE) GROUP BY ReceiptId) as S", { type: QueryTypes.SELECT });
  return(res);
}

exports.resultOfShopping = async function  (){
  const sequelize = new Sequelize('db_final_project', 'root', '', {
    dialect: 'mysql'
  })
  const res = await sequelize.query("select ReceiptId , sum(material.Price) as totalPrice from mat_rec NATURAL JOIN material WHERE material.IsActive = 1 and ReceiptId in ( select receiptId FROM shopping_receipt as T where T.Date = CURRENT_DATE) GROUP BY ReceiptId", { type: QueryTypes.SELECT });
  return(res);
}

exports.sumOfShopping =  async function () { 
  const sequelize = new Sequelize('db_final_project', 'root', '', {
    dialect: 'mysql'
  })
  const res = await sequelize.query("select SUM(S.totalPrice) as price FROM(select ReceiptId , sum(material.Price) as totalPrice from mat_rec NATURAL JOIN material WHERE material.IsActive = 1 and ReceiptId in ( select receiptId FROM shopping_receipt as T where T.Date = CURRENT_DATE) GROUP BY ReceiptId ) as S", { type: QueryTypes.SELECT });
  return(res);
}
//---------------------------------------------------------------------------------------------------------------------------------
// user report
//---------------------------------------------------------------------------------------------------------------------------------
exports.userReports = async function  (id){
  const sequelize = new Sequelize('db_final_project', 'root', '', {
    dialect: 'mysql'
  })
  return (await sequelize.query("SELECT foo_rec.ReceiptId as ReceiptId, sum(food.price) as price FROM `sales_receipt` NATURAl JOIN foo_rec NATURAL JOIN food WHERE sales_receipt.UserId = '"+id+"' GROUP BY ReceiptId", { type: QueryTypes.SELECT }));
}

//---------------------------------------------------------------------------------------------------------------------------------
// create sales reciept
//---------------------------------------------------------------------------------------------------------------------------------
exports.numberOfReciept = async function  (){
  const sequelize = new Sequelize('db_final_project', 'root', '', {
    dialect: 'mysql'
  })
  const res = await sequelize.query("SELECT max(ReceiptId) as max FROM `sales_receipt`", { type: QueryTypes.SELECT });
  return(res);
}

exports.addUserReciept = async function  ( DeliveryId , UserId , Adname){
  const sequelize = new Sequelize('db_final_project', 'root', '', {
    dialect: 'mysql'
  })
  const address = await sequelize.query("Select * from address where Name = '"+Adname+"' and UserId = '"+UserId+"'", { type: QueryTypes.SELECT });
  const fmax = await sequelize.query("SELECT max(ReceiptId) as max FROM `sales_receipt`", { type: QueryTypes.SELECT });
  var newTuple = fmax[0].max + 1;
  const final_query = await sequelize.query("INSERT INTO `sales_receipt`(`ReceiptId`, `Address`, `DeliveryId`, `UserId`) VALUES ("+newTuple+",'"+address[0].address+"','"+DeliveryId+"','"+UserId+"')", { type: QueryTypes.SELECT });

};

exports.addReciept = async function  (Address, DeliveryId , UserId){
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

        
            var sql = "INSERT INTO `sales_receipt`(`ReceiptId`, `Address`, `DeliveryId`, `UserId`) VALUES ("+newTuple+",'"+Address+"','"+DeliveryId+"',"+UserId+")";
            con.query(sql, function (err, result) {
                if (err) throw err;
                console.log("Reciept added");
            });
      });
};

exports.addFoodToReciept =  async function  (FoodId , receiptId) { 
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
        
        var sql = "INSERT INTO `foo_rec` (`FoodId`, `receiptId`) VALUES ('"+FoodId+"' , '"+receiptId+"' )";
        con.query(sql, function (err, result) {
            if (err) throw err;
        });
      });
}

//---------------------------------------------------------------------------------------------------------------------------------
// create sales reciept
//---------------------------------------------------------------------------------------------------------------------------------
exports.addShoppingReciept =  async function (MarketId){
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

exports.addMaterialToReciept =  async function  (MaterialId , recieptId) { 
  var con = await mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "db_final_project"
  });
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });
  var sql = "INSERT INTO `mat_rec`(`MaterialId`, `receiptId`) VALUES ('"+MaterialId+"' , '"+recieptId+"' )";
      con.query(sql, function (err, result) {
          if (err) throw err;
  });

}

exports.numberOfShoppingReciept = async function  (){
  const sequelize = new Sequelize('db_final_project', 'root', '', {
    dialect: 'mysql'
  })
  const res = await sequelize.query("SELECT max(ReceiptId) as max FROM shopping_receipt", { type: QueryTypes.SELECT });
  return(res);
}

exports.materials =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from material where IsActive = 1  ", { type: QueryTypes.SELECT });
  return(res);
};


//---------------------------------------------------------------------------------------------------------------------------------
// create sales reciept
//---------------------------------------------------------------------------------------------------------------------------------
exports.customerLogs =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from 	customer_log", { type: QueryTypes.SELECT });
  return(res);
};

exports.addressLogs =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from 	address_log", { type: QueryTypes.SELECT });
  return(res);
};

exports.deliveryLogs =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from 	delivery_log", { type: QueryTypes.SELECT });
  return(res);
};

exports.foodLogs =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from 	food_log", { type: QueryTypes.SELECT });
  return(res);
};

exports.marketLogs =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from 		market_log", { type: QueryTypes.SELECT });
  return(res);
};

exports.salesReceiptLogs =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from sales_receipt_log", { type: QueryTypes.SELECT });
  return(res);
};

exports.shoppingReceiptLogs =  async function  (){

  const sequelize = new Sequelize('db_final_project', 'root', '', {
      dialect: 'mysql'
    })
  const res = await sequelize.query("select * from 	shopping_receipt_log", { type: QueryTypes.SELECT });
  return(res);
};


