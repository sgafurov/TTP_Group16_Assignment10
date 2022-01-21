const express = require("express");

const pool = require("./db")

const app = express();

const bodyParser = require('body-parser');

const port = 3000;

const db = require('./db')

app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true
    })
)

app.get("/customer", async(req, res) => {
    try {
        const allCustomers = await pool.query(
            "SELECT * FROM customer",
        );

        res.json(allCustomers.rows)

    } catch (err) {
        console.log(err.message)
    }

})

app.get('/customer/:customer_id', db.getCustomerById)

// app.get("/customer/:customer_id", async(req, res) => {
//     try{
//         const customer_id = parseInt(req.params.id)
//         const allCustomers = await pool.query(
//             "SELECT * FROM customer WHERE customer_id = $1", $[customer_id]
//         );

//         res.json(allCustomers.rows)

//     }catch(err){
//         console.log(err.message)
//     }

// })

app.post("/customer", async (req, res) => {
    try {
        const { customer_id, first_name, last_name, sex } = req.body;
        const newCustomer = await pool.query("INSERT INTO customer (customer_id, first_name, last_name, sex) VALUES ($1, $2, $3, $4) RETURNING *",
            [customer_id, first_name, last_name, sex]);

        res.json(newCustomer.rows[0]);

    } catch (err) {
        console.error(err.message);
    }
})

app.listen(3000, () => {
    console.log(`App running on port ${port}`);
});