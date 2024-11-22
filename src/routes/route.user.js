const controller = require("../controllers/controller.user");

module.exports = async function (fastify) {
    fastify.get("/", controller.getAllUser)
    fastify.get("/id/:id", controller.getUserById)
    fastify.post("/", controller.updatetUser)
    fastify.patch("/", controller.changeUserStatus)
}
