module.exports = {
    HOST: "192.168.150.11:3306",
    USER: "backend",
    PASSWORD: "password",
    DB: "backend",
    dialect: "mysql",
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    }
};