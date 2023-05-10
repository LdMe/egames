//Desc: Model for stock table
import connection from "../database.js";
import Sequelize from "sequelize";

const Stock = connection.define("stock", {
    stock: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    platform: {
        type: Sequelize.STRING(45),
        allowNull: false
    },
    price: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    idgame: {
        type: Sequelize.INTEGER,
        allowNull: false
    }
});

export default Stock;