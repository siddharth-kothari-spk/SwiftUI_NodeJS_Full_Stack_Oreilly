const { timeStamp } = require('console');
const mongoose = require('mongoose');
//const Schema = mongoose.Schema

const Note = mongoose.model('Note',{
    note: {
        type: String
    }
});

module.exports = Note ;

/*
const noteSchema = new Schema ({
    note: {
        type: String
    }
},{timestamps: true})

const Note2 = mongoose.model('Note2', noteSchema)
module.exports = Note2
*/