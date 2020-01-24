const db = require("../data/db-config");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
    addStep
};

function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes")
        .where({ id })
        .first();
}

function findSteps(id) {
    return db("steps")
        .join("schemes", "steps.scheme_id", "schemes.id")

    .select(
        "steps.id",
        "schemes.scheme_name",
        "steps.step_number",
        "steps.instructions"
    )

    .where("schemes.id", "=", id);
}

function add(schemeData) {
    return db("schemes")
        .insert(schemeData)

    .then(([id]) => {
        return findById(id);
    });
}

function update(schemeUpdatedData, id) {
    return db("schemes")
        .where({ id })

    .update(schemeUpdatedData)

    .then(() => {
        return findById(id);
    });
}

function remove(id) {
    return db("schemes")
        .where({ id })

    .del();
}

function addStep(step, scheme_id) {
    const stepData = {
        ...step,

        scheme_id: scheme_id
    };

    return db("steps")
        .insert(stepData)

    .then(([id]) => {
        return id;
    });
}