const Pool = require("pg").Pool

const pool = new Pool({
    user : "",
    password: "",
    host : 'localhost',
    database : "shakhram",
    port : 5432
})

const getCustomerById = (req, res) => {
    const customer_id = parseInt(req.params.customer_id)

    pool.query('select * from customer where customer_id = $1', [customer_id], (error, results) => {
        if (error) {
            throw error.message
        }
        res.status(200).json(results.rows)
    })
}

module.exports = pool;

module.exports = {
    getCustomerById
}
