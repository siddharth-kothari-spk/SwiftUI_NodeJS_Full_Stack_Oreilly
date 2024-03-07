//import express from 'express';

const express = require('express');
const fs = require('fs');

require('./db/mongoose')
const Note = require('./models/note')

const app = express();

app.use(express.json())

//const mongoose = require('mongoose');

// READ
app.get('/notes', async (req, res) => {

    try {
        const notes = await Note.find({});
        res.send(notes)
    } catch (error) {
        res.status(500).send(err);
    }
    /*
    fs.readFile(__dirname + '/' + "notes.json", 'utf-8', (err, data) => {
        if (err) {
            return console.log(err)
        }
        res.status(200).send(data)
    })*/
})

// CREATE
app.post('/notes', async (req, res) => {

    const note = new Note({
        note: req.body.note
    })

    console.log("req.body = ", req.body)
    console.log("res.body =", res.body)
    console.log("note =", note)

   /*
   // sync way
   note.save()
    .then(() => {
        console.log("note saved")
        res.status(200).send(note)
    })
    .catch((err) => {
        console.log("note not saved")
        res.status(500).send(err)
    })*/

    // async way
    try {
        await note.save()
        console.log("note saved")
        res.status(200).send(note)
    } catch (error) {
        console.log("note not saved")
        res.status(400).send(error)
    }
})

// UPDATE
app.patch('./updateNote/:id', async (req, res) => {
    

    try {
        const note = await Note.findById(req.params.id)
        note.note = req.body.note

        await note.save()
        console.log("note updated")
        res.status(200).send(note)

    } catch (error) {
        console.log("error in fetching note with id:", req.params.id)
        res.status(404).send(error)
    }
})
app.listen(3000, () => {
    console.log("Server is up on port 3000")
})

/*
mongoose.connect('mongodb://127.0.0.1:27017/notes-api')
//.then(() => console.log('MongoDB Connected...'))
//.catch((err) => console.log('MongoDB Connect Error:',err));

const db = mongoose.connection
db.on('error', (err) => {
    console.log(err)
})

db.once('open', () => {
    console.log('DB connection established')
})
*/