//import express from 'express';

const express = require('express');
const fs = require('fs');

require('./db/mongoose')
const app = express();

app.get('/notes', (req, res) => {
    fs.readFile(__dirname + '/' + "notes.json", 'utf-8', (err, data) => {
        if (err) {
            return console.log(err)
        }
        res.status(200).send(data)
    })
})
app.listen(3000, () => {
    console.log("Server is up on port 3000")
})