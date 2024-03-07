/*const mongoose = require('mongoose');

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

/*
mongoose.connect('mongodb://localhost:27017/notes-api',{
   // useNewUrlParser: true
   // useCreatedIndex: true,
   // useFindAndModify: false,
   // useUnifiedTopology: true
})
.then(() => console.log('MongoDB Connected...'))
.catch((err) => console.log(err));

mongoose.connect('mongodb://127.0.0.1:27017/notes-api?directConnection=true')
.then(() => console.log('MongoDB Connected...'))
.catch((err) => console.log('MongoDB Connect Error:',err));
*/